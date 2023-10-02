+++
date = "2023-05-24T00:00:00+00:00"
description = "A tale of wanting nice things on Linux for Vim, Tmux and Alacritty and how it ended in a filthy shell script."
slug = "vim-tmux-alacritty-theme-switcher"
caption = "Toggling dark and light mode on Vim, Tmux, Allacrity and Firefox"
tags = ["Vim", "Tmux"]
title = "Toggle light and dark mode in Vim, Tmux and Alacritty"
+++

## Out of the shadows

For the majority of the time I use a dark theme. Throughout the winter months I
have been under the blankets bingeing on Nordic Noir and dark drama but now it
is time to get outside into the English spring and listen to ~~high bpm techno~~
the birds.

The problem with a dark themed desktop of course is that it is hard to see the
screen in any kind of sunlight. Much like a black t-shirt it is just no good for
a really hot day. I use the terminal for most of the time with [~~Vim~~][7]
[Neovim][8], [Tmux][5] and [Alacritty][4]. I run [Arch Linux][6] with [Sway][3]
as my window manager. Nothing completely crazy.

So I want to be able to toggle to light mode, expose myself to sunshine for five
minutes, toggle back, before I run back inside. I don't need this for too many
applications. Literally all I use is:

- Vim
- Alacritty
- Tmux
- Firefox

This can't be too hard right?

## Firefox

Firefox is the easiest application as it honours GTK preferences.

```sh
# Light mode
gsettings set org.gnome.desktop.interface color-scheme 'prefer-light'
# Dark mode
gsettings set org.gnome.desktop.interface color-scheme 'prefer-mode'
```

This works great for Firefox and the theme is switched based on your preference
and the browser will respect [`prefers-color-scheme`][10] css media queries for
the sites that you are browsing. Increasingly sites are using this technique to
offer light and dark modes based on the operating system preference but you may
also need to use something like the [Dark Reader][9] extension, which thankfully
also follows the GTK preference.

```css
/* Light Mode */
@media (prefers-color-scheme: light) {
}
/* Dark Mode */
@media (prefers-color-scheme: dark) {
}
```

## Alacritty

Alacritty can live reload configuration on changes with the following
configuration file setting.

```yaml
live_config_reload: true
```

With this in place we I can import a color theme that matches the preference,
save the file and Alacritty will switch themes.

```yaml
import:
  - ~/.config/alacritty/themes/catppuccin/catppuccin-mocha.yml
```

We can do this faster with `sed` to switch the theme and also make this task
scriptable.

```sh
sed -i 's/catppuccin-mocha/catppuccin-latte/' ~/.config/alacritty/alacritty.yml
```

## Tmux

As far as I know Tmux doesn't have offer any apis, either external or internal
for setting a colour scheme dynamically. There is no live reload of
configuration either so this is going to be harder.

We can use a similar to technique to Alacritty though, where a theme is included
as part of the configuration and this is modified via `sed`. In the `tmux.conf`
file a file is inclued to set the colours to the dark theme.

```sh
source-file /home/go/.config/tmux/catppuccin-mocha.conf;
```

We can then use `sed` to switch this to a theme with light colors.

```sh
sed -i 's/catppuccin-mocha/catppuccin-latte/' ~/.config/tmux/tmux.conf
```

What happens? Nothing. We need to reload the tmux config.

```sh
tmux source-file ~.config/tmux/tmux.conf
```

## Vim

Vim is the most difficult. Nvim offers a remote [RPC interface][1] that looks
useful but I would like whatever I use to be compatible with old skool vim,
probably because I am over 21.

I always run my terminal sessions in tmux and this is one of the reasons why.
Tmux offers apis that support composition of terminal windows and this is a
perfect example.

We can use the tmux api to get a list of panes across windows and sessions and
inspect the command being run.

```sh
tmux list-panes -a -F '#{pane_id} #{pane_current_command}'
%0 nvim
%2 hugo
%3 tmux
%6 nvim
%7 vim
```

Mini fist pump. We are going to make this via a disgusting hack! So now we can
use some UNIX tools to filter out what we need need before we pipe to xargs.

```sh
tmux list-panes -a -F '#{pane_id} #{pane_current_command}' |
grep vim |
cut -d ' ' -f 1
%0
%6
%7
```

Great. We have the pane ids that we want to address. Using tmux's `send-keys` we
can craft a message that switches **all** of the instances of (n)vim, across
sessions and windows to use dark mode.

```sh
xargs -I PANE tmux send-keys -t PANE ESCAPE ":set background=dark" ENTER
```

So putting it all together.

```sh
tmux list-panes -a -F '#{pane_id} #{pane_current_command}' |
grep vim |
cut -d ' ' -f 1 |
xargs -I PANE tmux send-keys -t PANE ESCAPE ":set background=light" ENTER
```

One issue here is that this is a temporary setting so if you open another
instance of `vim` you will get whatever is set in your configuration.

To get round this you will need a default setting in either your ~/.vimrc or
wherever you choose to manage this in your fancy lua neovim config.

```vimrc
set background=dark " Set dark background in Vimscript
```

```lua
vim.opt.background = "dark" -- Set dark background in Lua

```

So now we can update this value using our friend `sed`.

```sh
sed -i 's/dark/light/' ~/.vimrc
```

## Making a script

Please don't hate me for this. I know unmaintainable shell scripts are bad and I
really don't want to be doing this. If you think you can improve this, or know a
better way [send me a PR][11]. I'd love to delete this post.

```sh
#!/bin/sh
# Toggle dark and light themes for firefox, tmux, alacritty,
# and (neo)vim. Either run it from a shell or add a keybinding
# in tmux / alacritty

LIGHTTHEME="catppuccin-latte"
DARKTHEME="catppuccin-mocha"
VIMCONF="${XDG_CONFIG_HOME}/nvim/lua/config/set.lua"
ALACRITTYCONF="${XDG_CONFIG_HOME}/alacritty/alacritty.yml"
TMUXCONF="${XDG_CONFIG_HOME}/tmux/tmux.conf"
CURRENT_MODE=$(gsettings get org.gnome.desktop.interface color-scheme)

# Function to switch theme in n(v)im panes inside tmux
switch_vim_theme() {
  theme_for_vim_panes="$1"
  tmux list-panes -a -F '#{pane_id} #{pane_current_command}' |
    grep vim | # this captures vim and nvim
    cut -d ' ' -f 1 |
    xargs -I PANE tmux send-keys -t PANE ESCAPE \
      ":set background=${theme_for_vim_panes}" ENTER
}

# Toggle logic based on current mode
if [ "$CURRENT_MODE" = "'prefer-dark'" ]; then
  gsettings set org.gnome.desktop.interface color-scheme 'prefer-light'
  sed -i "s/${DARKTHEME}/${LIGHTTHEME}/" "$ALACRITTYCONF" "$TMUXCONF"
  sed -i 's/dark/light/' "$VIMCONF"
  switch_vim_theme "light"
else
  gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
  sed -i "s/${LIGHTTHEME}/${DARKTHEME}/" "$ALACRITTYCONF" "$TMUXCONF"
  sed -i 's/light/dark/' "$VIMCONF"
  switch_vim_theme "dark"
fi

tmux source-file "$TMUXCONF"
```

## Conclusion

Switching themes is **way too hard** on Linux. GTK and CSS media queries both
offer a sane approach but this is only relevant to GTK applications and web
pages. As there is no cross platform standard for this, application developers
face the prospect of supporting multiple approaches _within different operating
systems, window managers and frameworks_. For most open source maintainers of
course this is not something they want to [spend their time on][2].

So here I am in the garden a couple of hours later staring at a bright screen as
the sun hits my face. Wouldn't it be really nice to have a cross platform, cross
framework approach to this for graphical and terminal developers? Time to go
dark and go inside.

## Further reading

- [Automatic dark mode for terminal applications][13]
- [Switch between light and dark mode in Vim and Tmux with one command][14]
- [Light/Dark Toggle for Neovim, Fish, and Kitty][15]
- [Switch colorscheme in terminal, vim and tmux from dark to light with one
  command][12]

[1]: https://neovim.io/doc/user/remote.html
[2]: https://github.com/alacritty/alacritty/issues/5999#issuecomment-1100582887
[3]: https://swaywm.org/
[4]: https://alacritty.org/
[5]: https://github.com/tmux/tmux
[6]: https://archlinux.org/
[7]: https://www.vim.org/
[8]: https://neovim.io/
[9]: https://darkreader.org/
[10]:
  https://developer.mozilla.org/en-US/docs/Web/CSS/@media/prefers-color-scheme
[11]: https://github.com/shapeshed/dotfiles
[12]:
  https://superuser.com/questions/1190190/switch-colorscheme-in-terminal-vim-and-tmux-from-dark-to-light-with-one-command
[13]:
  https://arslan.io/2021/02/15/automatic-dark-mode-for-terminal-applications/
[14]:
  https://matt-a-bennett.github.io/colour_switching_terminal/colour_switching_terminal.html
[15]:
  https://evantravers.com/articles/2022/02/08/light-dark-toggle-for-neovim-fish-and-kitty/

+++
date = "2017-05-05T01:00:00+00:00"
description = "tmux 2.4 made a significant change to key bindings. Here is how to support custom keybindings for versions before and after tmux 2.4"
slug = "custom-vim-bindings-in-tmux-2-4"
tags = ["Vim", "tmux", "UNIX"]
title = "Custom Vim Bindings in tmux 2.4"
+++

## Changes in tmux 2.4

[tmux][5] continues to move on apace which is great news for the project. Since
version 2 there have been several breaking changes to configuration options.
This is fine if you run tmux on a machine that you maintain as it is easy to
keep tmux configuration in sync with the the version on the machine. If, like
me, you favour wrapping up your configuration in a [dotfiles][1] repository this
poses a challenge in supporting multiple versions of tmux with differing
configuration options.

## Tmux & Nearly Mouseless Workflow

tmux supports me achieving a nearly mouseless workflow with the copy and paste
functionality being a big part of that. [Jason Ryan][3] wrote about how to
achieve this. I'm a [Vim][6] user and here is the configuration I used.

```sh
bind-key Escape copy-mode
bind-key -t vi-copy Escape cancel
bind-key p paste-buffer
bind-key -t vi-copy v begin-selection
bind-key -t vi-copy V select-line
bind-key -t vi-copy r rectangle-toggle
bind -t vi-copy y copy-pipe "xclip -in -selection clipboard"
```

The `copy-pipe` option supports pasting into screens outside of tmux by copying
to the system clipboard. Coupled with [dwm][4] this supports changing screens
and moving data between contexts without having to touch the mouse.

## New copy mode key bindings

[This commit][2] made a fundamental change to how keybindings work. After some
tinkering my configuration now looks like this.

```sh
bind-key -T copy-mode-vi 'v' send -X begin-selection
bind-key -T copy-mode-vi 'V' send -X select-line
bind-key -T copy-mode-vi 'r' send -X rectangle-toggle
bind-key -T copy-mode-vi 'y' send -X copy-pipe-and-cancel "xclip -in -selection clipboard"
```

The [options available][7] are yet to be fully documented but the default
bindings are sane and the addition of `copy-pipe-and-cancel` is fantastic!

The problem is that for some machines that I use I am able to upgrade tmux. So
how to support multiple configuration options?

## Enter if-shell

A couple of [StackOverflow][8] [posts][9] led me to `if-shell` that allows
different configurations to be declared based on the tmux version. My
configurations for Vim bindings in copy mode now looks like this.

```sh
run-shell "tmux setenv -g TMUX_VERSION $(tmux -V | cut -c 6-)"
if-shell -b '[ "$(echo "$TMUX_VERSION < 2.4" | bc)" = 1 ]' \
  "bind-key Escape copy-mode; \
  bind-key -t vi-copy Escape cancel; \
  bind-key p paste-buffer; \
  bind-key -t vi-copy v begin-selection; \
  bind-key -t vi-copy V select-line; \
  bind-key -t vi-copy r rectangle-toggle; \
  bind -t vi-copy y copy-pipe 'xclip -in -selection clipboard'"

if-shell -b '[ "$(echo "$TMUX_VERSION >= 2.4" | bc)" = 1 ]' \
  "bind-key -T copy-mode-vi 'v' send -X begin-selection; \
  bind-key -T copy-mode-vi 'V' send -X select-line; \
  bind-key -T copy-mode-vi 'r' send -X rectangle-toggle; \
  bind-key -T copy-mode-vi 'y' send -X copy-pipe-and-cancel 'xclip -in -selection clipboard'"
```

This checks the tmux version and applies configuration accordingly. If you are
interested in what has changed recently the [CHANGES][10] documents this.

## Conclusion

tmux continues to be a core part of my daily toolkit. Copying and pasting
without touching the mouse and being able to return to sessions are the two
features that keep me using tmux. Otherwise I would just use `fg` and `bg`. It
is great to see the project being actively developed and now I have a way to
handle breaking changes to the configuration gracefully.

[1]: https://github.com/shapeshed/dotfiles
[2]:
  https://github.com/tmux/tmux/commit/76d6d3641f271be1756e41494960d96714e7ee58
[3]: http://jasonwryan.com/blog/2011/06/07/copy-and-paste-in-tmux/
[4]: http://dwm.suckless.org/
[5]: https://tmux.github.io/
[6]: http://www.vim.org/
[7]:
  https://github.com/tmux/tmux/commit/76d6d3641f271be1756e41494960d96714e7ee58#diff-de3b354b9ce10d035bad704e1ae9f54fR297
[8]:
  http://stackoverflow.com/questions/35016458/how-to-write-if-statement-in-tmux-conf-to-set-different-options-for-different-t
[9]:
  http://stackoverflow.com/questions/34187900/tmux-enabling-mouse-support-across-different-versions
[10]: https://github.com/tmux/tmux/blob/master/CHANGES

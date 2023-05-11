+++
date = "2016-10-06T00:00:00+00:00"
description = "Occasionally you may find you have a corrupt zsh history file preventing you from using CTRL+R or from using the `fc` command. Here's how to fix it."
slug = "zsh-corrupt-history-file"
image = "images/covers/zsh-corrupt.png"
caption = "The dreaded zsh: corrupt history"
tags = ["Unix", "Linux"]
title = "How to fix a corrupt zsh history file"
+++

## Corrupt ZSH history file

If you use [`zsh`][1] for your shell very occasionally you may find the
following message appearing indicating a corrupt history file.

```sh
zsh: corrupt history file /home/go/.zsh_history
```

This prevents searching back through the history with `CTRL+R` and editing
previous commands with [`fc`][2].

## How to fix it

To fix it run the following commands

```sh
cd ~
mv .zsh_history .zsh_history_bad
strings .zsh_history_bad > .zsh_history
fc -R .zsh_history
rm ~/.zsh_history_bad

```

### What's happening?

- The `zsh_history` file gets corrupted somehow and the shell is unable to read
  it.
- The corrupted file is moved to a new file `zsh_history_bad`.
- The `strings` command is used to extract strings (or text) from the
  `zsh_history_bad` file and the output is written to a new file `zsh_history`.
- The zsh builtin command `fc` is used to read the history from the fixed
  `zsh_history` file.
- Finally the corrupted file `zsh_history_file` can be removed.
- All done!

## Making it a script

Once this happened more than twice I made a script to save some typing. The
following is saved in my `~/bin` folder as `zsh_history_fix` and this folder [is
in my `$PATH`][3].

```sh
#!/usr/bin/env zsh
# George Ornbo (shapeshed) http://shapeshed.com
# License - http://unlicense.org
#
# Fixes a corrupt .zsh_history file

mv ~/.zsh_history ~/.zsh_history_bad
strings ~/.zsh_history_bad > ~/.zsh_history
fc -R ~/.zsh_history
rm ~/.zsh_history_bad
```

Now if I see the `zsh: corrupt history file` error again I just run the command
get back to work.

```sh
zsh_history_fix
```

If you'd like the script you can download it [from Github][4], put it somewhere
in your `$PATH` and make it executable.

```sh
cd ~/bin # or somewhere in your $PATH
wget https://raw.githubusercontent.com/shapeshed/dotfiles/master/bin/zsh_history_fix
chmod +x zsh_history_fix
source ~/.zshrc
```

[1]: http://www.zsh.org/
[2]: https://shapeshed.com/unix-fc/
[3]: https://shapeshed.com/using-custom-shell-scripts-on-osx-or-linux/
[4]:
  https://raw.githubusercontent.com/shapeshed/dotfiles/master/bin/zsh_history_fix

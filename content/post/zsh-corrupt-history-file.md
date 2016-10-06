{
  "slug": "zsh-corrupt-history-file",
  "title": "How to fix a corrupt zsh history file",
  "date": "2016-10-06T00:00:00+00:00",
  "description": "Occasionally you may find you have a corrupt zsh history file preventing you from using the `fc` command or searching the history. Here's how to fix it.", 
"tags": [
    "Unix",
    "Linux"
  ]
}

## Corrupt ZSH history file

If you use  [`zsh`][1] for your shell very occasionally you may find the following message appearing indicating a corrupt history file. This is normally after a reboot.

    zsh: corrupt history file /home/george/.zsh_history

This prevents searching back through the history with `CTRL+R` and editing previous commands with [`fc`][2].

## How to fix it

To fix it run the following commands

    cd ~
    mv .zsh_history .zsh_history_bad
    strings .zsh_history_bad > .zsh_history
    fc -R .zsh_history

## Making it a script

Once this happened more than twice I made a script to fix the issue. The following is saved in my `~/bin` folder as `zsh_history_fix` and this folder [is in my `$PATH`][3].

    #!/usr/bin/env sh
    # George Ornbo (shapeshed) http://shapeshed.com
    # License - http://unlicense.org
    #
    # Fixes a corrupt .zsh_history file

    mv ~/.zsh_history ~/.zsh_history_bad
    strings .zsh_history_bad > .zsh_history
    fc -R ~/.zsh_history
    rm ~/.zsh_history_bad

Now if I see the `zsh: corrupt history file` error again I just run the command get back to work.

    zsh_history_fix

If you'd like the script you can download it directly from Github, put it somewhere in your `$PATH` and make it executable.

    cd ~/bin # or somewhere in your $PATH
    wget https://github.com/shapeshed/dotfiles/blob/master/bin/zsh_history_fix
    chmod +x zsh_history_fix

[1]: http://www.zsh.org/
[2]: https://shapeshed.com/unix-fc/
[3]: https://shapeshed.com/using-custom-shell-scripts-on-osx-or-linux/

+++
date = "2016-10-06T00:00:00+00:00"
description = "Occasionally you may find you have a corrupt zsh history file preventing you from using the `fc` command or searching the history. Here's how to fix it."
slug = "zsh-corrupt-history-file"
tags = ["Unix", "Linux"]
title = "How to fix a corrupt zsh history file"

+++

## Corrupt ZSH history file

If you use [`zsh`][1] for your shell very occasionally you may find the following message appearing indicating a corrupt history file. This is normally after a reboot.

    zsh: corrupt history file /home/george/.zsh_history

This prevents searching back through the history with `CTRL+R` and editing previous commands with [`fc`][2].

## How to fix it

To fix it run the following commands

    cd ~
    mv .zsh_history .zsh_history_bad
    strings -eS .zsh_history_bad > .zsh_history
    fc -R .zsh_history

## Making it a script

Once this happened more than twice I made a script to fix the issue. The following is saved in my `~/bin` folder as `zsh_history_fix` and this folder [is in my `$PATH`][3].

    #!/usr/bin/env zsh
    # George Ornbo (shapeshed) http://shapeshed.com
    # License - http://unlicense.org
    #
    # Fixes a corrupt .zsh_history file

    mv ~/.zsh_history ~/.zsh_history_bad
    strings -eS ~/.zsh_history_bad > ~/.zsh_history
    fc -R ~/.zsh_history
    rm ~/.zsh_history_bad

Now if I see the `zsh: corrupt history file` error again I just run the command get back to work.

    zsh_history_fix

If you'd like the script you can download it directly from Github, put it somewhere in your `$PATH` and make it executable.

    cd ~/bin # or somewhere in your $PATH
    wget https://raw.githubusercontent.com/shapeshed/dotfiles/master/bin/zsh_history_fix
    chmod +x zsh_history_fix
    
In the alternative, a ZSH function can be defined in place of using a script. This may be useful if, e.g., you prefer to maintain a single file containing multiple user-defined functions that is sourced on ZSH startup. Be advised that this approach will consume more memory, as sourcing the file containing the function will cause the function to stay resident in memory even when not in use.

This version of the function assumes the history file is located at the globally defined variable $HISTFILE, which means it should be able to find the history file on any system where this variable is defined. This approach should also work in a shell script.

Also note that this function includes extra print statements and comments that are not necessary, but that help demonstrate what is going on and may be useful if you are just learning shell/ZSH programming. Except for the local variable definitions, everything before the mv command and after the rm command is optional.

    function fixCorruptHistoryFile
    {
        local historyPath=$HISTFILE:h               # Get file path without file name
        local historyFile=$HISTFILE:t               # Get file name

        print -P "Repairing corrupt ZSH History File at:" $historyPath "..."
        print -P "ZSH History File is:" $historyFile

        # Repair logic
        print -P "Starting repair..."
        mv $historyPath"/"$historyFile $historyPath"/"$historyFile"_corrupted"
        strings $historyPath"/"$historyFile"_corrupted" > $historyPath"/"$historyFile
        fc -R $historyPath"/"$historyFile
        print -P "Repair complete."
        rm $historyPath"/"$historyFile"_corrupted"
        print -P "Temporary repair file deleted. Function terminated."
    }

[1]: http://www.zsh.org/
[2]: https://shapeshed.com/unix-fc/
[3]: https://shapeshed.com/using-custom-shell-scripts-on-osx-or-linux/

{
  "slug": "unix-shell-aliases",
  "title": "Linux and Unix shell aliases tutorial with examples",
  "date": "2008-07-11T00:00:00+01:00",
  "lastmod": "2016-08-05T00:00:00+01:00",
  "description": "How to create shell aliases using bash or zsh to provide shortcuts to common commands",
  "image": "/images/articles/shell_alias.png",
  "tags": [
    "Linux",
    "UNIX"
  ]
}

![An example of a shell alias][4]

## What is a shell alias?

A shell alias is a shortcut to reference a command. It can be used to avoid typing long commands or as a means to correct incorrect input. For common patterns it can reduce keystrokes and improve efficiency. A simple example is setting default options on commands to avoid having to type them each time a command is run. 

## Why create a shell alias?

For the following example suppose that a user prefers to confirm deleting a file before using the `rm` command. The rm command supports this with the `-i` option.

    rm -i file.txt
    remove file.txt? y

To avoid forgetting to use the `-i` option each time an alias can be created so that each time `rm` is run it will use the `-i` option and prompt the user to confirm.

## How to set an shell alias

Building on the previous example an alias can be directly set in the shell as follows.

    alias rm='rm -i'
  
Now when the `rm` command is run it will use the alias and the `-i` option. 

    rm file.txt
    remove file.txt?     

Note that setting an alias in this way only works for the life of a shell session. When the shell is closed the alias  will be lost. To make an alias persist across shell sessions and reboots a configuration file for the shell should be used. For `bash` this is the `.bashrc` file. If you are using `zsh` it is the `.zshrc` file.

## The .bashrc file

A `.bashrc` file can be used to set configuration for a shell. In this example a local user's `.bashrc` file will be used. If you are running the `zsh` shell use a file called `.zshrc`. 

Open the `~/.bashrc` file in your preferred text editor. If it does not exist create it.

    touch ~/.bashrc

## How to add a shell alias to .bashrc

Within the `.bashrc` files aliases can now be added. The format is simple. First declare the command you wish to alias, then specify the command to run instead. 

    alias rm='rm -i'

For this example we replace `rm` with `rm -i` so that the user is prompted before deleting the file.

Once the `.bashrc` file is saved the shell needs to be reloaded for the alias to take effect.

    source ~/.bashrc

The alias should now be available and typing `rm` will be interpreted as `rm -i`. 

## Some examples of aliases

The following are some practical examples of using aliases.

    # ensure git commits are signed
    alias git commit='git commit -S'

    # shorthand for vim
    alias v="vim"

    # setting preferred options on ls
    alias ls='ls -lhF' 

    # prompt user if overwriting during copy
    alias cp='cp -i'

    # prompt user when deleting a file
    alias rm='rm -i'

    # always print in human readable form
    alias df="df -h"

## Further reading

* [The alias Command][1]
* [Alias, setting command aliases][2]
* [30 Handy Bash Shell Aliases For Linux / Unix / Mac OS][3]


[1]: http://www.linfo.org/alias.html
[2]: http://www.linuxhowtos.org/Tips%20and%20Tricks/command_aliases.htm
[3]: http://www.cyberciti.biz/tips/bash-aliases-mac-centos-linux-unix.html
[4]: https://shapeshed.com/images/articles/shell_alias.png

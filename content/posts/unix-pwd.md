{
  "slug": "unix-pwd",
  "title": "Linux and Unix pwd command tutorial with examples",
  "date": "2016-09-20T01:00:00+00:00",
  "image": "images/articles/pwd.png",
  "description": "Tutorial on using pwd, a UNIX and Linux command for printing the name of the current working directory. Examples of printing the current working directory, avoiding symlinks and how to get the current working directory in shell scripts.",
  "tags": [
    "UNIX",
    "Linux"
  ]
}

![Terminal showing pwd man page][2]

## What is the pwd command in UNIX?

The `pwd` command is a command line utility for printing the current working directory. It will print the full system path of the current working directory to standard output. By default the `pwd` command ignores symlinks, although the full physical path of a current directory can be shown with an option. The `pwd` command is normally a shell builtin meaning it is part of the code that runs the shell rather than an external executable. 

## How to print the current working directory

To print the current working directory run the `pwd` command. The full path of the current working directory will be printed to standard output. 

    pwd
    /home/george

## How to avoid symlinks

To avoid symlinks pass the `-P` option. This will cause `pwd` to show the physical location rather than a symlink. To demonstrate this the following example shows a folder that is symlinked to another location. Without the `-P` option the symlink is ignored. In the following example the folder `zsh` is a symlink.


    ls -la | grep -E '.zsh$'    
    lrwxrwxrwx    1 george users    25 Sep 15  2013 .zsh -> /home/george/dotfiles/zsh

Running `pwd` within the `zsh` folder does not show the symlink.

    cd .zsh
    pwd
    /home/george/.zsh

Running `pwd` with the `-P` shows the physical location.

    cd .zsh
    pwd -P  
    /home/george/dotfiles/zsh

## pwd is normally a shell builtin

In most shells `pwd` is a [shell builtin][4]. This means the command is present in the shell rather than calling an external program. This means that the code will run significantly faster than calling an external executable. 

    which pwd
    pwd: shell builtin command

Whilst most shells have `pwd` as a shell builtin the command also exists on systems as an executable. On my own system the executable is located at `/bin/pwd`.

    /bin/pwd
    /home/george/dotfiles/zsh

## How to reference pwd in shell scripts

In most shells the `$PWD` variable is available and is set each time a user or in script changes directory. As such this variable can be referenced to show the current working directory.

    echo $PWD
    /home/george

Although `$PWD` is ubiquitous it is specific to the shell running the command so some prefer to reference the `pwd` command and store it in a variable. This makes scripts more portable as they will call the system executable if the shell builtin or the `$PWD` variable does not exist.

    CWD=$(pwd)
    echo $CWD
    /home/george

Althought the `$PWD` variable is present is almost all shells it is possible it may not be there. If you are really paranoid use `CWD=$(pwd)` but in most cases `$PWD` will work. 

## Further reading 
* [pwd man page][1]
* [pwd Wikipedia page][3]
* [Is it better to use $(pwd) or $PWD][5]
* [HowTo: Use pwd Command In Linux / UNIX][6]

[1]: http://linux.die.net/man/1/pwd
[2]: /images/articles/pwd.png "Linux and Unix pwd command"
[3]: https://en.wikipedia.org/wiki/Pwd
[4]: https://en.wikipedia.org/wiki/Shell_builtin
[5]: http://unix.stackexchange.com/questions/173916/is-it-better-to-use-pwd-or-pwd
[6]: http://www.cyberciti.biz/faq/pwd-linux-unix-command-examples/

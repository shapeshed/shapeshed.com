+++
date = "2009-07-20T00:00:00+01:00"
description = "A couple of useful tips for writing shell scripts more quickly using the vi editor."
tags = ["Linux"]
title = "Writing shell scripts more quickly in vi"
+++

## Shell scripts

If you are on a POSIX compliant machine (OSX or Linux) you can make use of Shell
Scripts to do day-to-day donkey work. I use Shell Scripts for backups, cleaning
out temporary folders, profiling and logging. Writing these scripts is pretty
straightforward and if you are completely new to it I recommend getting a copy
of [Classic Shell Scripting][1].

Recently I came across a couple of shortcuts that have greatly reduced the time
it takes to write a script in the vi editor.

## Run shell commands from within vi

Using :! from within vi you can run a shell command. This is great as you don't
need to exit vi to test your code. Let's say for example your script is called
myscript.sh. You can run your script from within the vi editor by using.

```vim
:!myscript.sh
```

Furthermore you can make more changes in vi, save the file and then run the
script again by using

```vim
:!!
```

This is a shortcut to the last command issued to the shell, allowing you to
retest your shell script without even typing the filename.

## The % variable

Within vi the % variable refers to the file that you are currently editing. So
to run the script you are editing from within vi you can also use:

```vim
:%
```

[1]: http://oreilly.com/catalog/9780596005955/

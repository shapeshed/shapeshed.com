+++
date = "2016-10-19T00:00:00+00:00"
description = "Tutorial on using more, a UNIX and Linux command for viewing the contents of a file or files one screen at a time. Examples of viewing a file, viewing multiple files, searching using regular expressions and opening the file in a text editor."
image = "images/covers/more.png"
caption = "The UNIX and Linux more command"
slug = "unix-more"
tags = ["UNIX", "Linux"]
title = "Linux and Unix more command tutorial with examples"
+++

## What is the more command in UNIX?

The `more` command is a command line utility for viewing the contents of a file
or files once screen at a time. It supports navigating forwards and backwards
through a file and is primarily used for viewing the contents of a file. It also
supports searching for strings or regular expressions and opening the file at
the current point in a text editor.

## How to view the contents of a file

To view the contents of a file pass the name of the file to `more`. This will
open the file in `more` at the start of the file and fit the first page within
the screen size available.

```sh
more /usr/share/dict/british
A
a
AA
AAA
Aachen
--More--(0%)
```

The line at the bottom shows that the file is being viewed within the `more`
program. As `more` moves through the file the percentage value on the bottom
line will also update reflecting how far through the file the current page is.

## How to view the contents of multiple files

To view the contents of multiple files using `more` pass the names of the files
or a pattern to the `more` command. This will open a buffer for each file and
show the first file. A banner is shown to indicate the file being shown.

```sh
more /usr/share/dict/*
::::::::::::::
/usr/share/dict/american-english
::::::::::::::
A
```

To move to the next file press `:n`. This moves the viewer to the start of the
next file.

```sh
::::::::::::::
/usr/share/dict/british
::::::::::::::
A
a
```

To move back a file press `:p`. This moves to the start of the previous file.

## How to navigate within more

To move forward a page within `more` the `SPACE` key may be used. Additionally
the `z` key may be used. This moves forward a page based on the current screen
size.

To move forward one line press the `RETURN` key. Optionally a number `n` may be
pressed before the `RETURN` key to move forward by `n` lines.

To move backwards by a page press `b` or `CTRL-B`. Some versions of more support
moving backwards by one line with the `k` key but your mileage may vary here.

## How to open a file at a line number

To open a file at a line number pass the `+` option along with a line number

```sh
more +2654 /usr/share/dict/british
```

The more viewer will open at line 2654.

## How to open a file at the first occurrence of a search

To open a file at the first occurrence of a search string pass the `+` option
followed by a search pattern. The search pattern should begin with a `/` and can
be a regular expression.

```sh
more +/^eat /usr/share/dict/british
```

The pager will move to the first occurrence of the search pattern.

## How to search within more

To search within `more` press the `/` key followed by the phrase to be searched
for. The search pattern accepts regular expressions. The following searches for
the phrase 'eat'. This will search lines for instances of the phrases and scroll
the page to the first occurrence.

```sh
more /usr/share/dict/british
/eat
```

In this file the first occurrence is the word 'aleatory'. To search for words
starting with 'eat' a regular expression may be used.

```sh
more /usr/share/dict/british
/^eat
```

Now the word 'eat' is found.

To search for the next occurrence of a regular expresssion press the `n` key.

```sh
more /usr/share/dict/british
/eat
# first match is aleatory
# press 'n'
# second match is amphitheatre
```

## How to display the file that more is viewing

To display the file that more is viewing press `:f`. The file will be shown at
the bottom along with the current position in the file.

more /usr/share/dict/british :f "/usr/share/dict/british" line 34298

## How to edit a file being viewed with more

To edit a file being viewed with more press `v`. This will launch the text
editor that is set in the $EDITOR shell variable at the line being viewed. Once
the file is save it returns to the more viewer. If no $EDITOR variable is found
`vi` will be used.

To understand what the editor variable is echo it at a shell prompt. In the
following example it is `vim`.

```sh
echo $EDITOR
vim
```

If the $EDITOR variable is not set or is set incorrectly it may be set
temporarily as follows.

```sh
export EDITOR=vim
```

To set the $EDITOR variable permanently add the following to your `.bashrc` file
if you are using `bash` or `.zshrc` file if you are using `zsh`.

```sh
export EDITOR=vim
```

## Getting help within more

To access the help menu press `h` within more.

## How to exit more

To exit from `more` press `q` or `Q`. This returns you to the terminal prompt.

## Further reading

- [more man page][1]
- [more Wikipedia page][3]

[1]: http://linux.die.net/man/1/more
[2]: /images/articles/more.png "Linux and Unix more command"
[3]: https://en.wikipedia.org/wiki/More

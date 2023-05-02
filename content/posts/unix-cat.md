+++
date = "2016-08-04T00:00:00+00:00"
description = "Tutorial on using cat, a UNIX and Linux command for concatenating files and printing to standard output. Examples of showing the contents of a file, appending one file to another, and combining multiple files into one."
image = "images/articles/cat.png"
slug = "unix-cat"
tags = ["UNIX", "Linux"]
title = "Linux and Unix cat command tutorial with examples"
+++

![cat man page][6]

## What is the cat command?

The `cat` command a command line utility for concatenating files and printing to
standard output. It may be used to show the contents of a file in the terminal,
to write the contents of one file to another and to combine multiple files into
one. It also supports adding line numbers, showing special characters and
squeezing blank lines.

## How to show the contents of a file

To show the contents of a file using `cat` simply pass the name of the file or
files you want to view. The contents will be printed to standard output and
viewable in the terminal. The following example supposes that the file `foo.txt`
has a single line 'Hello World'.

```sh
cat foo.txt
Hello world
```

If the content of a file is very long the contents will be written to the
terminal. In this case it can be difficult to find certain parts of a file. When
looking for specific content [grep][1] is probably a better option.

## How to write the contents of a file to a new file

To write the content of a file to a new file [shell redirection][5] can be used
with the `cat` tool. The following example supposes that the file `foo.txt` has
a single line with 'Hello World' and writes this into `bar.txt`.

```sh
cat foo.txt > bar.txt
cat bar.txt
Hello world
```

Not only does this write the contents of `foo.txt` to `bar.txt` but it also
creates `boo.txt` if it does not exist.

## How to append the contents of a file to another file

To append the contents of a file to another the shell redirection can again be
used. For this example we have two files `beer.txt` and `wine.txt`. The file
`wine.txt` contains two lines.

```sh
cat wine.txt
Sancerre
Chablis
```

The file `beer.txt` also contains two lines.

```sh
cat beer.txt
Side Pocket
Greene King IPA
```

The `cat` tool can be used with shell redirection to write the contents of one
file to the end of another.

```sh
cat wine.txt >> beer.txt
cat beer.txt
Side Pocket
Greene King IPA
Sancerre
Chablis
```

## How to combine multiple files into one

To combine multiple files into one `cat` can be used with shell redirection. The
following combines all files with the `.txt` extension in a directory into one
file.

```sh
cat *.txt > combined.txt
```

## How to add line numbers to the output of cat

To add line numbers to the output of `cat` pass the `-n` option. This prepends
line numbers to the start of the line.

```sh
cat -n /usr/share/dict/words
1  A
2  a
3  aa
4  aal
5  aalii
```

## How to show the end of lines

To show the ends of lines using `cat` pass the `-E` option. This appends a $
character to the ends of lines. This can be useful to indicate if there are
trailing spaces for example.

```sh
cat -E example.txt
This line has no space at the end.$
This one does. $
```

## How to squeeze blank lines

To squeeze blank lines using `cat` pass the `-s` option. This squeezes the
number of blank lines to suppress repeated empty output lines. Suppose we have a
file with the following contents named `blanks.txt`.

```sh
Line one

Line two


Line three
```

The `cat` tool can remove repeated empty output lines with the `-s` option.

```sh
cat -s blanks.txt
Line one

Line two

Line three
```

## How to show tabs

To show tabs using `cat` pass the `-T` option. This will show tabs as `^I`.
Suppose we have the following file saved as `tabs.txt`.

```sh
  One tab
        Two tabs
          Three tabs
```

The tabs can be shown with the `-T` option.

```sh
cat -T tabs.txt
^IOne Tab
^I^ITwo tabs
^I^I^IThree tabs
```

## Further reading

- [cat man page][2]
- [The cat command][3]
- [13 Basic Cat Command Examples in Linux][4]

[1]: /unix-grep/
[2]: http://linux.die.net/man/1/cat
[3]: http://www.linfo.org/cat.html
[4]: http://www.tecmint.com/13-basic-cat-command-examples-in-linux/
[5]: http://www.tldp.org/LDP/abs/html/io-redirection.html
[6]: /images/articles/cat.webp

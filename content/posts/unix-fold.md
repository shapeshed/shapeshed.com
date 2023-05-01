+++
date = "2016-08-08T00:00:00+00:00"
description = "Tutorial on using fold, a UNIX and Linux command for folding long lines for finite widths. Examples of limiting column width, limiting by bytes and wrapping on spaces."
image = "images/articles/fold.png"
slug = "unix-fold"
tags = ["UNIX", "Linux"]
title = "Linux and Unix fold command tutorial with examples"
+++

![fold man page][1]

## What is the fold command in UNIX?

The `fold` command in UNIX is a command line utility for folding contents of
specified files, or standard input. By default it wraps lines at a maximum width
of 80 columns. It also supports specifying the column width and wrapping by
numbers of bytes.

## How to fold input

To fold input using the `fold` command pass a file, files or standard input to
the command. The result will be printed to standard output. The default is 80
columns but this is configurable.

```sh
fold lorum.txt

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer at accumsan ips
    um, ut sagittis dolor. Vivamus erat tellus, ullamcorper ut aliquam nec, maximus
    at turpis.
```

This limits the width to 80 columns.

## How to limit column width

To change the column width from the default 80 pass the `-w` option. In the
following example this is limited to 20

```sh
fold -w 20 lorum.txt
Lorem ipsum dolor si
t amet, consectetur
adipiscing elit. Int
eger at accumsan ips
um, ut sagittis dolo
r. Vivamus erat tell
us, ullamcorper ut a
liquam nec, maximus
at turpis.
```

## How to limit width by bytes

To limit the width by bytes use the `-b` option. This will contstrain the width
of the output to the number of bytes specified. In the following example this is
set to 15.

```sh
fold -b15 lorum.txt
Lorem ipsum dol
or sit amet, co
nsectetur adipi
scing elit. Int
eger at accumsa
n ipsum, ut sag
ittis dolor. Vi
vamus erat tell
us, ullamcorper
 ut aliquam nec
, maximus at tu
rpis.
```

## How to wrap on spaces

When using the `-w` option fold will break words to wrap lines. To break on
spaces so that words are not broken to wrap lines use the `-s` option.

```sh
 fold -w 20 -s lorum.txt
Lorem ipsum dolor
sit amet,
consectetur
adipiscing elit.
Vestibulum sit amet
euismod purus.
Morbi suscipit
dignissim lacus, ut
ultricies justo
rhoncus at.
```

## Further reading

- [fold man page][2]
- [Fold files using fold command][3]
- [fold: Wrap Text File / Line / Words To Fit in Specified Width][4]

[1]: /images/articles/fold.png
[2]: http://linux.die.net/man/1/fold
[3]: http://www.theunixschool.com/2011/08/fold-files-using-fold-command.html
[4]: http://www.cyberciti.biz/tips/linux-unix-word-wrap-command.html

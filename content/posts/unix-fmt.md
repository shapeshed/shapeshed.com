+++
date = "2016-08-15T00:00:00+00:00"
description = "Tutorial on using fmt, a UNIX and Linux command for formatting text. Examples of formatting a file, setting the column with and formatting uniform spaces."
image = "images/articles/fmt.png"
slug = "unix-fmt"
tags = ["UNIX", "Linux"]
title = "Linux and Unix fmt command tutorial with examples"
+++

![Terminal showing fmt man page][3]

## What is the fmt command in UNIX?

The `fmt` is a simple text formatter that can set the column width for a file,
files or standard input and write it to standard output. It supports setting the
with of columns for the formatting, preserving first line indentation, and
setting uniform spacing. Originally designed as a tool to format mail messages
it can be useful for reading files in the terminal and ad-hoc formatting
requirements.

## How to format the contents of a file

To format the contents of a file using the `fmt` command pass a file, files or
standard input to the command. The result will be printed to standard output. In
the following example there is a file of latin text named `text.txt`. Using the
[cat][1] tool it is possible to see that this file is unformatted.

```sh
cat text.txt
    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse diam enim, faucibus ut cursus vel, dictum et risus. Donec elementum, lacus in pulvinar pretium, ex risus porttitor tortor, ac faucibus leo ante sed mauris. Proin volutpat urna ut faucibus placerat. Ut dictum tristique nibh quis ornare.
```

To file contents can be sorted using the `fmt` command.

```sh
fmt text.txt
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse
diam enim, faucibus ut cursus vel, dictum et risus. Donec elementum,
lacus in pulvinar pretium, ex risus porttitor tortor, ac faucibus
leo ante sed mauris. Proin volutpat urna ut faucibus placerat. Ut
dictum tristique nibh quis ornare.
```

The default width is 75 columns.

## How to change the width of formatting

By default `fmt` sets the column width at 75. This can be changed with the
`--width` option.

```sh
fmt --width 10 text.txt
Lorem
ipsum
dolor
sit amet,
...
```

## How to preserve first line indentation

To preserve first line indentation using the `fmt` command the `-t` option may
be used. This ensures that indentation of the first lines of a paragraph is
preseved. In the following example the first line is indented.

```sh
cat lorum.txt
      Aenean sodales, dolor at dictum venenatis, nisl nibh eleifend nunc, sed viverra turpis sapien ut urna. Fusce ornare tristique tortor sit amet sodales. Interdum et malesuada fames ac ante ipsum primis in faucibus. Etiam rhoncus hendrerit sem a vulputate.

      Suspendisse potenti. Praesent sit amet vehicula tortor, nec pharetra arcu. Curabitur at sollicitudin sapien. Fusce eget pulvinar velit. Morbi a elit nec odio ornare ullamcorper.    Etiam vulputate ex ac metus vehicula  sollicitudin.

```

By default `fmt` removes this indentation.

```sh
fmt lorum.txt
      Aenean sodales, dolor at dictum venenatis, nisl nibh eleifend nunc,
      sed viverra turpis sapien ut urna. Fusce ornare tristique tortor
      sit amet sodales. Interdum et malesuada fames ac ante ipsum primis
      in faucibus. Etiam rhoncus hendrerit sem a vulputate.

      Suspendisse potenti. Praesent sit amet vehicula tortor, nec
      pharetra arcu. Curabitur at sollicitudin sapien. Fusce eget pulvinar
      velit. Morbi a elit nec odio ornare ullamcorper.    Etiam vulputate
      ex ac metus vehicula  sollicitudin.

```

To preserve indentation the `-t` option may be used.

```sh
fmt -t lorum.txt
      Aenean sodales, dolor at dictum venenatis, nisl nibh eleifend
nunc, sed viverra turpis sapien ut urna. Fusce ornare tristique tortor
sit amet sodales. Interdum et malesuada fames ac ante ipsum primis in
faucibus. Etiam rhoncus hendrerit sem a vulputate.

      Suspendisse potenti. Praesent sit amet vehicula tortor, nec
pharetra arcu. Curabitur at sollicitudin sapien. Fusce eget pulvinar
velit. Morbi a elit nec odio ornare ullamcorper.    Etiam vulputate ex
ac metus vehicula  sollicitudin.

```

## How to enforce uniform spacing

To enforce uniform spacing using the `fmt` command the `-u` option may be used.
This enforces one space between words and two after sentences.

```sh
echo 'this  has different    spaces' | fmt -u
this has different spaces
```

## Further reading

- [fmt man page][2]
- [Linux fmt command examples][4]
- ["fmt" Command Usage Examples in Linux][5]

[1]: /unix-cat/
[2]: http://linux.die.net/man/1/fmt
[3]: /images/articles/fmt.png "Linux and Unix fmt command"
[4]: http://landoflinux.com/linux_fmt_command.html
[5]: http://www.sanfoundry.com/fmt-command-usage-examples-linux/

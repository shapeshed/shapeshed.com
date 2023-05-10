+++
date = "2016-08-09T00:00:00+00:00"
description = "Tutorial on using shuf, a UNIX and Linux command for generating random permutations. Examples of shuffling the lines in a file, picking a random line and shuffling standard input."
image = "images/articles/shuf.png"
slug = "unix-shuf"
tags = ["UNIX", "Linux"]
title = "Linux and Unix shuf command tutorial with examples"
+++

<!-- prettier-ignore -->
![A terminal showing the shuf man page][1]
{.hero}

## What is the shuf command in UNIX?

The `shuf` command generates random permutations from input lines to standard
output. If given a file or series of files it will shuffle the lines and write
the result to standard output. It can also limit the number of results returned
supporting selecting random lines from a file or data from a list.

## How to shuffle the contents of a file

To shuffle the lines in a file using the `shuf` command pass a file, files or
standard input to the command. The result will be printed to standard output. In
the following example we have a list of cards in a file saved as `cards.txt`.
This file is ordered by suit and number.

```sh
shuf cards.txt
4D
9D
QC
3S
6D
```

The `shuf` command shuffles the lines and outputs this to standard output.

## How to pick a random line from a file

To pick a random line from a file using `shuf` use the `-n` option. This limits
the output to the number specified.

```sh
shuf -n 1 cards.txt
KH
```

To select more than one line change the number.

```sh
shuf -n 5 cards.txt
4H
9S
KH
9D
9H
```

## How to shuffle standard input

To shuffle words passed to `shuf` in standard input use the `-e` option. This
shuffles items separated by spaces.

```sh
shuf -e one two three
three
two
one
```

If you wanted to quickly decide whose turn it is to make the tea you can use
`shuf`.

```sh
shuf -n 1 -e George Kirsten Fin Bea
Bea
```

Bea make the tea!

## Further reading

- [shuf man page][2]
- [Linux shuf command - generate random permutations][3]
- [Shuffle speed comparison][4]

[1]: /images/articles/shuf.png "Linux and Unix shuf command"
[2]: http://linux.die.net/man/1/shuf
[3]: http://www.unixcl.com/2009/10/linux-shuf-command-generate-random.html
[4]:
  https://stackoverflow.com/questions/2153882/how-can-i-shuffle-the-lines-of-a-text-file-on-the-unix-command-line-or-in-a-shel#answer-30133294

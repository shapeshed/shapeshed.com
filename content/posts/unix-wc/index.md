+++
date = "2011-03-19T00:00:00+00:00"
description = "Tutorial on using wc, a UNIX and Linux command for printing newline, word and byte counts for files. Examples of printing the number of lines in a file, printing the number of characters in a file and printing the number of words in a file."
image = "images/covers/wc.png"
caption = "The UNIX and Linux wc command"
slug = "unix-wc"
tags = ["UNIX", "Linux"]
title = "Linux and Unix wc command tutorial with examples"
+++

## What is the wc command in UNIX?

The `wc` command in UNIX is a command line utility for printing newline, word
and byte counts for files. It can return the number of lines in a file, the
number of characters in a file and the number of words in a file. It can also be
combine with pipes for general counting operations.

## How to get count information on a file

To get count information on a file use the `wc` command with no options.

```sh
wc /usr/share/dict/words
235886  235886 2493109 /usr/share/dict/words
```

The output is number of lines, number of words, number of bytes, filename.

## How to print the number of lines in a file

To print the number of lines in a file (or more specifically newline counts) use
the `-l` option.

```sh
wc -l /usr/share/dict/words
235886 /usr/share/dict/words
```

## How to print the number of characters in a file

To print the number of characters in a file use the `-m` option.

```sh
wc -m /usr/share/dict/words
2493109 /usr/share/dict/words
```

## How to print the number of bytes in a file

To print the number of bytes in a file use the `-c` option.

```sh
wc -c /usr/share/dict/words
2493109 /usr/share/dict/words
```

## How to print the number of words in a file

To print the number of words in a file use the `-w` option.

```sh
wc -w /usr/share/dict/words
235886 /usr/share/dict/words
```

## How to count records in CSV files

To count the number of records (or rows) in several CSV files the `wc` can used
in conjunction with pipes. In the following example there are five CSV files.
The requirement is to find out the sum of records in all five files. This can be
achieved by piping the output of the [cat][2] command to wc.

```sh
cat *.csv | wc -l
1866
```

Done. There are 1866 records across the 5 files.

## How to count the number files in a directory

To count the number of folders and files in a directory `wc` can be combined
with the `ls` command. By passing the `-1` options to `ls` it will list one file
per line. This can be piped to `wc` to give a count.

```sh
ls -1 | wc -l
21
```

## Further reading

- [wc man page][1]
- [The Linux wc command (word count)][2]

[1]: http://linux.die.net/man/1/wc
[2]: http://alvinalexander.com/unix/edu/examples/wc.shtml
[3]: /images/articles/wc.png

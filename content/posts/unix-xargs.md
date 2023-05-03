+++
date = "2017-09-11T00:00:00+01:00"
description = "Tutorial on using xargs, a UNIX and Linux command for building and executing command lines from standard input. Examples of cutting by character, byte position, cutting based on delimiter and how to modify the output delimiter."
image = "images/articles/xargs.png"
slug = "unix-xargs"
tags = ["UNIX", "Linux"]
title = "Linux and Unix xargs command tutorial with examples"
+++

![A terminal showing the xargs man page](/images/articles/xargs.png)

## What is the xargs command in UNIX?

The `xargs` command in UNIX is a command line utility for building an execution
pipeline from standard input. Whilst tools like [`grep`][1] can accept standard
input as a parameter, many other tools cannot. Using `xargs` allows tools like
`echo` and [`rm`][2] and [`mkdir`][3] to accept standard input as arguments.

## How to use xargs

By default `xargs` reads items from standard input as separated by blanks and
executes a command once for each argument. In the following example standard
input is piped to xargs and the `mkdir` command is run for each argument,
creating three folders.

```sh
echo 'one two three' | xargs mkdir
ls
one two three
```

When filenames contains spaces you need to use -d option to change delimiter

```sh
ls
'one two three.txt' 'four.txt'
find . -name '*.txt' | xargs -d '\n' rm
```

## How to use xargs with find

The most common usage of `xargs` is to use it with the [`find`][4] command. This
uses `find` to search for files or directories and then uses `xargs` to operate
on the results. Typical examples of this are changing the ownership of files or
moving files.

`find` and `xargs` can be used together to operate on files that match certain
attributes. In the following example files older than two weeks in the temp
folder are found and then piped to the xargs command which runs the `rm` command
on each file and removes them.

```sh
find /tmp -mtime +14 | xargs rm
```

## xargs v exec {}

The `find` command supports the `-exec` option that allows arbitrary commands to
be performed on found files. The following are equivalent.

```sh
find ./foo -type f -name "*.txt" -exec rm {} \;
find ./foo -type f -name "*.txt" | xargs rm
```

So which one is faster? Let's compare a folder with 1000 files in it.

```sh
time find . -type f -name "*.txt" -exec rm {} \;
0.35s user 0.11s system 99% cpu 0.467 total

time find ./foo -type f -name "*.txt" | xargs rm
0.00s user 0.01s system 75% cpu 0.016 total
```

Clearly using xargs is far more efficient. In fact [several][5] [benchmarks][6]
suggest using `xargs` over `exec {}` is six times more efficient.

## How to print commands that are executed

The `-t` option prints each command that will be executed to the terminal. This
can be helpful when debugging scripts.

```sh
echo 'one two three' | xargs -t rm
rm one two three
```

## How to view the command and prompt for execution

The `-p` command will print the command to be executed and prompt the user to
run it. This can be useful for destructive operations where you really want to
be sure on the command to be run. l

```sh
echo 'one two three' | xargs -p touch
touch one two three ?...
```

## How to run multiple commands with xargs

It is possible to run multiple commands with `xargs` by using the `-I` flag.
This replaces occurrences of the argument with the argument passed to xargs. The
following echos a string and creates a folder.

```sh
cat foo.txt
one
two
three

cat foo.txt | xargs -I % sh -c 'echo %; mkdir %'
one
two
three

ls
one two three
```

## Further reading

- [xargs man page][7]
- [xargs vs. exec {}][5]
- [find exec vs find xargs][6]

[1]: https://shapeshed.com/unix-grep/
[2]: https://shapeshed.com/unix-rm/
[3]: https://shapeshed.com/unix-mkdir/
[4]: https://shapeshed.com/unix-find/
[5]: https://danielmiessler.com/blog/linux-xargs-vs-exec/
[6]: https://www.everythingcli.org/find-exec-vs-find-xargs/
[7]: http://man7.org/linux/man-pages/man1/xargs.1.html

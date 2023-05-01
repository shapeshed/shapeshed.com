+++
date = "2016-07-12T20:20:27+01:00"
description = "Tutorial on using find, a UNIX and Linux command for walking a file hierarchy. Examples of finding a file by name, finding and deleting a file, finding a directory and searching by modification time and permissions."
image = "images/articles/find.png"
slug = "unix-find"
tags = ["UNIX"]
title = "Linux and Unix find command tutorial with examples"
+++

![find man page][5]

## What is the find command in UNIX?

The `find` command in UNIX is a command line utility for walking a file
hierarchy. It can be used to find files and directories and perform subsequent
operations on them. It supports searching by file, folder, name, creation date,
modification date, owner and permissions. By using the `- exec` other UNIX
commands can be executed on files or folders found.

## How to find a single file by name

To find a single file by name pass the `-name` option to `find` along with the
name of the file you are looking for.

Suppose the following directory structure exists shown here as the output of the
`tree` command.

```sh
foo
    ├── bar
    ├── baz
    │   └── foo.txt
    └── bop
```

The file `foo.txt` can be located with the `find` by using the `-name` option.

```sh
find ./foo -name foo.txt
./foo/baz/foo.txt
```

## How to find and delete a file

To find and delete a file pass the `-delete` option to `find`. This will delete
the file with no undo so be careful.

```sh
find ./foo -name foo.txt -delete
```

To be prompted to confirm deletion combine `-exec` with `rm -i`.

```sh
find ./foo -name foo.txt -exec rm -i {} \;
```

Comparing the efficiency of these methods when operating on 10000 files we can
see that using `-delete` is far more efficient.

```sh
touch {0..10000}.txt
time find ./ -type f -name "*.txt" -exec rm {} \;
find ./ -type f -name "*.txt" -exec rm {} \;  3.95s user 1.44s system 99% cpu 5.402 total
touch {0..10000}.txt
time find ./ -type f -name '*.txt' -delete
find ./ -type f -name '*.txt' -delete  0.03s user 0.06s system 98% cpu 0.090 total
```

## How to find a directory

To find a directory specify the option `-type d` with `find`.

```sh
find ./foo -type d -name bar
./foo/bar
```

## How to find files by modification time

To find files by modification time use the `-mtime` option followed by the
number of days to look for. The number can be a positive or negative value. A
negative value equates to less then so `-1` will find files modified within the
last day. Similarly `+1` will find files modified more than one day ago.

```sh
find ./foo -mtime -1
find ./foo -mtime +1
```

## How to find files by permission

To find files by permission use the `-perm` option and pass the value you want
to search for. The following example will find files that everyone can read,
write and execute.

```sh
find ./foo -perm 777
```

## How to find and operate on files

To find and operate on file us the `-exec` option. This allows a command to be
executed on files that are found.

```sh
find ./foo -type f -name bar -exec chmod 777 {} \;
```

## How to find and replace in a range of files

To find and replace across a range of files the `find` command may be combined
with another utility like `sed` to operate on the files by using the `-exec`
option. In the following example any occurrence of find is replaced with
replace.

```sh
find ./ -type f -exec sed -i 's/find/replace/g' {} \;
```

## How to search for text within multiple files

Another use of combining `find` with `exec` is to search for text within
multiple files.

```sh
find ./ -type f -name "*.md" -exec grep 'foo'  {} \;
```

## Further reading

- [find man page][1]
- [A collection of Unix/Linux find command examples][2]
- [Find Command in Unix and Linux Examples][3]
- [Some examples of using UNIX find command][4]

[1]: http://linux.die.net/man/1/find
[2]: http://alvinalexander.com/unix/edu/examples/find.shtml
[3]: http://www.folkstalk.com/2011/12/101-examples-of-using-find-command-in.html
[4]:
  http://www.ling.ohio-state.edu/~kyoon/tts/unix-help/unix-find-command-examples.htm
[5]: /images/articles/find.png

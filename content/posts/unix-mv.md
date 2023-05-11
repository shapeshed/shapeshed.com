+++
date = "2016-10-11T01:00:00+00:00"
description = "Tutorial on using mv, a UNIX and Linux command to move or rename files. Examples of moving a file, moving multiple files, moving a directory, prompting before overwriting and taking a backup before moving."
image = "images/covers/mv.png"
caption = "The UNIX and Linux mv command"
slug = "unix-mv"
tags = ["UNIX", "Linux"]
title = "Linux and Unix mv command tutorial with examples"
+++

## What is the mv command in UNIX?

The `mv` command is a command line utility that moves files or directories from
one place to another . It supports moving single files, multiple files and
directories. It can prompt before overwriting and has an option to only move
files that are new than the destination.

## How to move a file

To move a file using the `mv` command pass the name of the file and then the new
name for the file. In the following example the file `foo.txt` is renamed to
`bar.txt`.

```sh
ls
foo.txt
mv foo.txt bar.txt
ls
bar.txt
```

## How to move a file into a directory

To move a file into a directory using the `mv` command pass the name of the file
and then the directory. In the following example the file `foo.txt` is moved
into the directory `bar`.

```sh
tree -F .
.
├── bar/
└── foo.txt
mv foo.txt bar
tree -F
.
└── bar/
    └── foo.txt
```

## How to move multiple files into a directory

To move multiple files using the `mv` command pass the names of the files or a
pattern followed by the destination.

```sh
mv file1.txt file.2.txt file3.txt folder
```

The following example is the same as above but uses pattern matching to move all
files with a `.txt` extension.

```sh
mv *.txt folder
```

## How to move a directory

To move a directory using the `mv` command pass the name of the directory to
move followed by the destination.

```sh
ls -F
foo/
mv foo bar
ls -F
bar/
```

## How to prompt before overwriting a file

By default the `mv` command will overwrite an existing file. Consider the
following example.

```sh
ls
foo.txt bar.txt
mv foo.txt bar.txt
ls
bar.txt
```

In this example `bar.txt` is overwritten by the file `file.txt`. At some point
when running `mv` a file that was not meant to be overwritten probably will be.
To prompt before overwriting a file the `-i` option can be used.

```sh
ls
foo.txt bar.txt
mv -i foo.txt bar.txt
mv: overwrite 'bar.txt'? n
```

## How to not overwrite an existing file

To prevent an existing file from being overwritten pass the `-n` option. This
causes the `mv` command to ignore anything that would overwrite an existing
file. In the following example the effect is for nothing to happen as a file
would be overwritten.

```sh
ls
foo.txt bar.txt
mv -n foo.txt bar.txt
ls
foo.txt bar.txt
```

## How to only move files newer than the destination

To only move files that are newer than the destination pass the `-u` option. If
a file is not newer than a file with the same name in the destination it will
not be moved.

```sh
tree -F .
.
├── bar/
│   ├── bar.txt
│   └── foo.txt
├── bar.txt
└── foo.txt
```

Looking at the timestamps of these files we can see that the file `foo.txt` in
the current directory is older than the file `foo.txt` in the directory `bar`.

```sh
ls -l
total 4
drwxr-xr-x 2 george users 4096 Oct 11 20:18 bar
-rw-r--r-- 1 george users    0 Oct 11 20:18 bar.txt
-rw-r--r-- 1 george users    0 Oct 11 20:20 foo.txt
ls -l bar
total 0
-rw-r--r-- 1 george users 0 Oct 11 20:18 bar.txt
-rw-r--r-- 1 george users 0 Oct 11 20:23 foo.txt
```

Using the `-u` option means that only newer files will be moved.

```sh
mv -u foo.txt bar.txt bar
ls
bar foo.txt
```

The file `foo.txt` is not moved as it is older than the file in the destination
folder.

## How to take a backup of an existing file

To take a backup of an existing file that will be overwritten as a result of the
`mv` command pass the `-b` option. This will create a backup file with the tilde
character appended to it.

```sh
ls
foo.txt bar.txt
mv -b foo.txt bar.txt
ls
bar.txt  bar.txt~
```

To change the backup suffix the `-S` option may be used.

```sh
ls
foo.txt bar.txt
mv -S .bak -b foo.txt bar.txt
ls
bar.txt  bar.txt.bak
```

## Further reading

- [mv man page][1]
- [mv Wikipedia page][3]
- [The mv command][4]
- [mv (rename) files][5]

[1]: http://linux.die.net/man/1/mv
[2]: /images/articles/mv.png "Linux and Unix mv command"
[3]: https://en.wikipedia.org/wiki/Mv
[4]: http://linfo.org/mv.html
[5]: https://www.gnu.org/software/coreutils/manual/coreutils.html#mv-invocation

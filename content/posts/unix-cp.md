+++
date = "2016-10-12T00:00:00+00:00"
description = "Tutorial on using cp, a UNIX and Linux command for copying files and directories. Examples of copying a file, copying multiple files, copying a directory, taking a backup when copying and preserving file attributes when copying."
image = "images/articles/cp.png"
slug = "unix-cp"
tags = ["UNIX", "Linux"]
title = "Linux and Unix cp command tutorial with examples"
+++

![Terminal showing cp man page][2]

## What is the cp command?

The `cp` command is a command-line utility for copying files and directories. It
supports moving one or more files or folders with options for taking backups and
preserving attributes. Copies of files are independent of the original file
unlike the [`mv` command][6].

## How to copy a file

To copy a file with the `cp` command pass the name of the file to be copied and
then the destination. In the following example the file `foo.txt` is copied to a
new file called `bar.txt`. The cp command will also create the new file as part
of the operation.

```sh
ls
foo.txt
cp foo.txt bar.txt
ls
foo.txt bar.txt
```

## How to copy multiple files

To copy multiple files using the `cp` command pass the names of files followed
by the destination directory to the `cp` command.

```sh
tree -F
.
├── bar.txt
├── baz.txt
├── foo/
└── foo.txt
cp foo.txt bar.txt baz.txt foo/
tree .
.
├── bar.txt
├── baz.txt
├── foo
│   ├── bar.txt
│   ├── baz.txt
│   └── foo.txt
└── foo.txt
```

The same operation can also be achieved through pattern matching

```sh
cp *.txt foo/
```

## How to copy a directory

By default the `cp` command will not copy directories. Attempting to copy a
directory results in an error.

```sh
cp directory/ foo
cp: omitting directory 'directory/'
```

To copy a directory pass the `-R` flag. This will recursively copy a folder and
create a copy.

```sh
cp -R directory/ foo
```

## How to copy multiple directories

To copy multiple directories pass the path of the directories to be copied
followed by the destination directory.

```sh
tree .
.
├── bar
│   └── bar.txt
├── baz
│   └── baz.txt
├── foo
│   └── foo.txt
└── some-directory
cp foo bar baz some-directory
tree .
.
├── bar
│   └── bar.txt
├── baz
│   └── baz.txt
├── foo
│   └── foo.txt
└── some-directory
    ├── bar
    │   └── bar.txt
    ├── baz
    │   └── baz.txt
    └── foo
        └── foo.txt
```

## How to take a backup when copying a file

If a copy operation will overwrite a file the `-b` flag may be used to create a
back up of the file. This copies the file into place and writes a backup file.

```sh
ls
foo.txt bar.txt
cp -b foo.txt bar.txt
ls
foo.txt bar.txt bar.txt~
```

To specify the name of the backup file use the `-S` option.

```sh
ls
foo.txt bar.txt
cp -S .bak foo.txt bar.txt
ls
foo.txt bar.txt bar.txt.bak
ls
foo.txt bar.txt bar.txt.bak
```

## How to prompt for confirmation when copying a file

To prompt for confirmation when copying a file pass the `-i` flag. Normally when
using the `cp` command a destination file will be overwritten if it exists when
copying. Using the `-i` flag the command will prompt to overwrite the file.

```sh
ls
foo.txt bar.txt
cp -i foo.txt bar.txt
cp: overwrite 'bar.txt'?
```

## How to create a hard link instead of copying

To create a hard link instead of copying with the `cp` command pass the `-l`
option. Instead of copying the file a new file will be created that is a hard
link to the data on disk. Here's a [primer][7] on hard and symbolic or soft
links.

```sh
ls
foo.txt
cat foo.txt
foo text
cp -l foo.txt bar.txt
echo 'bar text' > bar.txt
cat foo.txt
bar text
```

## How to preserve file attributes

To preserve file attributes (permissions, group and user owernship) pass the
`--preserve` option along with the attributes to be preserved. By default mode,
ownership and timestamps will be preserved.

```sh
ls -la
-rw------- 1 george users 0 Oct 13 09:14 foo.txt
cp --preserve foo.txt bar.txt
-rw-------  1 george users     0 Oct 13 09:14 bar.txt
-rw-------  1 george users     0 Oct 13 09:14 foo.txt
```

## How to show files that are being copied

To show files that are being copied pass the `-v` option to the `cp`. This
prints the files and folders that are being copied to standard output. In the
following example the directory `foo` is copied as `bar` along with the
contents.

```sh
cp -R -v foo bar
'foo' -> 'bar'
'foo/foo.txt' -> 'bar/foo.txt'
'foo/bar.txt' -> 'bar/bar.txt'
```

## Further reading

- [cp man page][1]
- [cp Wikipedia page][3]
- [GNU Coreuticp: cp invocation][4]
- [The cp command][5]

[1]: http://linux.die.net/man/1/cp
[2]: /images/articles/cp.png "Linux and Unix cp command"
[3]: https://en.wikipedia.org/wiki/Cp_(Unix)
[4]: https://www.gnu.org/software/coreutils/manual/html_node/cp-invocation.html
[5]: http://linfo.org/cp.html
[6]: https://shapeshed.com/unix-mv/
[7]:
  https://shapeshed.com/unix-ln/#what-is-the-difference-between-a-hard-and-symbolic-link

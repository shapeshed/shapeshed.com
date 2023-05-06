+++
date = "2016-10-07T01:00:00+00:00"
description = "Tutorial on using rm, a UNIX and Linux command for removing files or directories. Examples of removing a file, removing multiple files, prompting for confirmation, removing recursively and forcing removal."
image = "images/articles/rm.png"
slug = "unix-rm"
tags = ["UNIX", "Linux"]
title = "Linux and Unix rm command tutorial with examples"
+++

![A terminal showing the rm man page][2]

## What is the rm command?

The `rm` command is a command line utility for removing files or directories.

## How to remove a file

To remove a file pass the name of a file or files to the `rm` command. Note that
files will be removed immediately.

```sh
ls
foo.txt bar.txt
rm foo.txt
ls
bar.txt
```

## How to remove multiple files

The `rm` command can remove multiple files at once either by passing it more
than one file or by using a pattern.

```sh
ls
foo.txt bar.txt
rm foo.txt bar.txt
ls
```

In the following example a pattern is used to remove all filenames ending in
'.txt'.

```sh
ls
foo.txt bar.txt baz.zip
rm *.txt
ls
baz.zip
```

Be careful that no unwanted files are removed using this method.

## How to prompt for confirmation

To prompt for conformation when removing a file use the `-i` option. This will
cause `rm` to ask for confirmation. If confirmation is given the file is
removed. If it is not given the file removal is skipped.

```sh
ls
foo.txt bar.txt
rm -i foo.txt
# type 'y' at the prompt
rm: remove regular file 'foo.txt'? y
ls
bar.txt
```

In the following example confirmation is not given and the removal is skipped.

```sh
ls
foo.txt bar.txt
rm -i foo.txt
# type 'n' at the prompt
rm: remove regular file 'foo.txt'? n
ls
foo.txt bar.txt
```

Many users like to [add an alias][3] to make this the default behaviour so that
each time the rm command is run they are prompted for confirmation.

```sh
alias rm="rm -i"
```

## How to show more information

To show more output in the `rm` command pass the `-v` option. This will cause
more information to be written to standard output.

```sh
ls
foo.txt bar.txt
rm -v foo.txt
removed 'foo.txt'
ls
bar.txt
```

## How to remove directories

By default the `rm` command does not remove directories. To remove directories
use the `-R` option to make removal recursive.

```sh
ls -F
foo.txt bar/
rm: cannot remove 'bar': Is a directory
rm -R bar/
ls -F
foo.txt
```

The `-i` option may also be combined with the `-R` option to prompt for
confirmation.

```sh
tree foo
foo
├── bar
│   └── baz.txt
└── foo.txt
```

```sh
1 directory, 2 files
rm -iR foo
rm: descend into directory 'foo'? y
rm: remove regular empty file 'foo/foo.txt'? n
rm: descend into directory 'foo/bar'? y
rm: remove regular empty file 'foo/bar/baz.txt'? y
rm: remove directory 'foo/bar'? y
rm: remove directory 'foo'? n
tree foo                                                                (master)
foo
└── foo.txt
```

```sh
0 directories, 1 file
```

## How to handle permission denied errors

Sometimes when running the `rm` a permissions error will be thrown indicating
that you do not have enough permissions to remove a file.

```sh
rm /etc/shadow
rm: remove write-protected regular file 'shadow'? y
rm: cannot remove 'shadow': Permission denied
```

In this case you will either need to ask a systems administrator to give you
permissions on the file or use `sudo` to delete the file.

```sh
sudo rm /etc/shadow
```

## How to remove multiple files based on a pattern

The `rm` command can be combined with [`find`][4] to find and remove files based
on things like modification time, file name or permissions. The following
command will find all files in the folder `foo` that have been modified in the
last day and remove them interactively.

```sh
find ./foo -type f -mtime -1 -exec rm -i {} \;
```

## How to force a file or folder to be removed

If a user tries to remove a write-protected file with `rm` by default they will
be prompted for confirmation.

```sh
rm foo
rm: remove write-protected regular empty file 'foo'? y
```

To force removal and not receive a prompt pass the `-f` option.

```sh
rm -f foo
```

## rm -Rf /

One of the worst commands you can run in Linux is `rm -Rf /` especially if you
are root. This will remove everything on your machine rendering it useless. The
`zsh` shell now has some protection against this and even prompts if you use an
asterisk character to delete all files in a directory.

```sh
rm *
zsh: sure you want to delete all the files in /home/george/foo [yn]? y
```

## Does rm delete a file?

The `rm` command does not delete a file. Instead it unlinks it meaning the data
is still on disk but the link to it is removed. Depending on the filesystem you
are using it is more or less difficult to recover files removed with `rm`. If
you really want to delete something you can use `shred` to overwrite a file to
hide its contents.

```sh
echo 'hello' > foo.txt
cat foo.txt
hello
shred foo.txt
cat foo.txt
O3eiqOIl%bq;a;;%/HwOr<ZVP=
...
rm foo.txt
```

The safest option if you really want to delete a file is to take the hard drive
out and smash it to smithereens. Wooo destruction!

![Smashed up hard drive][5]

## Further reading

- [rm man page][1]
- [rm Wikipedia page][7]
- [Where to files go when the rm command is issued][7]
- [Linux and Unix find command tutorial with examples][3]
- [Linux and Unix find alias tutorial with examples][4]

[1]: http://linux.die.net/man/1/rm
[2]: /images/articles/rm.png "Linux and Unix rm command"
[3]: https://shapeshed.com/unix-shell-alias/
[4]: https://shapeshed.com/unix-find/
[5]: /images/articles/smashed-up-hard-drive.jpg "A destroyed hard drive"
[6]:
  http://unix.stackexchange.com/questions/10883/where-do-files-go-when-the-rm-command-is-issued
[7]: https://en.wikipedia.org/wiki/Rm_(Unix)

+++
date = "2016-10-04T00:00:00+00:00"
description = "Tutorial on using ls, a UNIX and Linux command for listing directory contents. Examples of listing a directory, showing hidden files, showing long listings, sorting on various items and showing recursive listings."
image = "images/articles/ls.png"
slug = "unix-ls"
tags = ["UNIX", "Linux"]
title = "Linux and Unix ls command tutorial with examples"
+++

![Terminal showing ls man page][2]

## What is the ls command?

The `ls` command is a command-line utility for listing the contents of a
directory or directories given to it via standard input. It writes results to
standard output. The `ls` command supports showing a variety of information
about files, sorting on a range of options and recursive listing.

## How to show the contents of a directory

To show the contents of a directory pass the directory name to the `ls` command.
This will list the contents of the directory in alphabetical order. If your
terminal supports colours you may see that file and directory listings are a
different colour.

```sh
ls /home/george
bin  code  dotfiles  Downloads  go  irc  logs  src
```

## How to show hidden files and folders

To show hidden files and folders pass the `-a` option to `ls` this will

```sh
ls -a /home/george
.                         .goobook            .tmux.conf
..                        .goobook_auth.json  .urlview
.asoundrc                 .inputrc            .vim
.asoundrc.asoundconf      .install.sh         .viminfo
.asoundrc.asoundconf.bak  .irbrc              .viminfo.tmp
...
```

## How to append file types to listings

To append an indicator of the file type to a directory listing pass the `-F`
option.

```sh
ls -F
bin@   dotfiles/   file.txt  irc/   src/
code/  Downloads/  go/       logs/
```

The following characters are appended based on this option:

- `/` indicates a directory
- `@` indicates a symbolic link
- `|` indicates a FIFO
- `=` indicates a socket
- `>` indicates a door
- nothing is shown for regular files

## How to show a long listing

To show a long listing pass the `-l` option to the `ls` command. This will
output detailed information on the directory listing.

```sh
ls -l
total 56
lrwxrwxrwx  1 george users    25 Sep 22 14:17 bin -> /home/george/dotfiles/bin
drwxr-xr-x  6 george users  4096 Oct  4 20:27 code
drwxr-xr-x 10 george users  4096 Oct  4 09:13 dotfiles
drwx------  3 george users  4096 Oct  4 11:31 Downloads
-rw-r--r--  1 george users     0 Oct  4 20:42 file.txt
drwxr-xr-x  5 george users  4096 Sep 25 08:30 go
drwx------  3 george users  4096 Sep 27 10:49 irc
drwxr-xr-x  2 george users 32768 Oct  4 09:15 logs
drwxr-xr-x  8 george users  4096 Oct  2 17:13 src
```

## How to sort by size

To sort a directory listing by name pass the `-S` option. In the following
example this is combined with the `-l` option to show a long listing.

```sh
ls -lS
total 56
drwxr-xr-x  2 george users 32768 Oct  4 09:15 logs
drwxr-xr-x  6 george users  4096 Oct  4 20:27 code
drwxr-xr-x 10 george users  4096 Oct  4 09:13 dotfiles
drwx------  3 george users  4096 Oct  4 11:31 Downloads
drwxr-xr-x  5 george users  4096 Sep 25 08:30 go
drwx------  3 george users  4096 Sep 27 10:49 irc
drwxr-xr-x  8 george users  4096 Oct  2 17:13 src
lrwxrwxrwx  1 george users    25 Sep 22 14:17 bin -> /home/george/dotfiles/bin
-rw-r--r--  1 george users     0 Oct  4 20:42 file.txt
```

## How to sort by modification time

To sort by modification time pass the `-t` option. This causes the output to
show the most recently modified files or folders at the top of the listing. In
the following example this is combined with the `-l` option to show a long
listing.

```sh
ls -lt
total 56
-rw-r--r--  1 george users     0 Oct  4 20:42 file.txt
drwxr-xr-x  6 george users  4096 Oct  4 20:27 code
drwx------  3 george users  4096 Oct  4 11:31 Downloads
drwxr-xr-x  2 george users 32768 Oct  4 09:15 logs
drwxr-xr-x 10 george users  4096 Oct  4 09:13 dotfiles
drwxr-xr-x  8 george users  4096 Oct  2 17:13 src
drwx------  3 george users  4096 Sep 27 10:49 irc
drwxr-xr-x  5 george users  4096 Sep 25 08:30 go
lrwxrwxrwx  1 george users    25 Sep 22 14:17 bin -> /home/george/dotfiles/bin
```

To show the last edited file in a directory the `ls` command can be combined
with `head`

```sh
ls -t | head -n 1
```

## How to sort by access time

To sort by access time pass the `-u` option. This causes the output to show the
most recently accessed files of folders at the top of the listing. In the
following example this is combined with the `-l` option to show a long listing.

```sh
ls -lu
total 56
lrwxrwxrwx  1 george users    25 Oct  4 09:01 bin -> /home/george/dotfiles/bin
drwxr-xr-x  6 george users  4096 Oct  4 20:23 code
drwxr-xr-x 10 george users  4096 Oct  4 11:21 dotfiles
drwx------  3 george users  4096 Oct  4 11:24 Downloads
-rw-r--r--  1 george users     0 Oct  4 20:42 file.txt
drwxr-xr-x  5 george users  4096 Sep 26 16:46 go
drwx------  3 george users  4096 Oct  4 09:38 irc
drwxr-xr-x  2 george users 32768 Oct  4 09:15 logs
drwxr-xr-x  8 george users  4096 Oct  2 17:12 src
```

## How to show file size in human readable format

To show file size in human readable format pass the `-h` option. This causes the
file size output to be shown in human readable format.

```sh
ls -lh
total 793M
-rw-r--r-- 1 george users 792M Oct  4 21:23 archlinux-2016.10.01-dual.iso
```

## How to display one file or folder per line

To display one file or folder per line pass the `-1` option.

```sh
ls -1
bin
code
dotfiles
Downloads
file.txt
go
irc
logs
src
```

## How to show a recursive listing

To display a recursive listing pass the `-R` option. This causes folders and
files within a folder to be listed.

```sh
ls -R tree
tree:
file.txt  folder1  folder2
```

```sh
tree/folder1:
file.txt
```

```sh
tree/folder2:
```

## Further reading

- [ls man page][1]
- [ls Wikipedia page][3]
- [GNU Coreutils: ls invocation][4]
- [20 Linux ls Command Examples to Display the Entries of Directory][5]

[1]: http://linux.die.net/man/1/ls
[2]: /images/articles/ls.png "Linux and Unix ls command"
[3]: https://en.wikipedia.org/wiki/Ls
[4]: https://www.gnu.org/software/coreutils/manual/html_node/ls-invocation.html
[5]: http://linoxide.com/linux-command/linux-ls-command/

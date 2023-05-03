+++
date = "2016-09-19T00:00:00+00:00"
description = "Tutorial on using df, a UNIX and Linux command for reporting file system disk space usage. Examples of viewing free disk space, viewing in human readable format, showing filesystem types and including and excluding specific filesystem types."
image = "images/articles/df.png"
slug = "unix-df"
tags = ["UNIX", "Linux"]
title = "Linux and Unix df command tutorial with examples"
+++

![Terminal showing df man page][2]

## What is the df command in UNIX?

The `df` command is a command line utility for reporting file system disk space
usage. It can be used to show the free space on a Unix or Linux computer and to
understand the filesystems that have been mounted. It supports showing usage in
Bytes, Megabytes and Gigabytes. It also support including and excluding certain
filesystem types from the output.

## How to view disk space usage

To view disk space usage run the `df` command. This will print a table of
information to standard output. This can be useful to discover the amount of
free space available on a system or filesystems.

```sh
df
Filesystem     1K-blocks    Used Available Use% Mounted on
/dev/root       24489260 2533832  20693860  11% /
devtmpfs         2021940       0   2021940   0% /dev
tmpfs            2022896       0   2022896   0% /dev/shm
tmpfs            2022896    1544   2021352   1% /run
tmpfs            2022896       0   2022896   0% /sys/fs/cgroup
tmpfs            2022896       0   2022896   0% /tmp
tmpfs             404576       0    404576   0% /run/user/1000
```

This show six columns as follows

- `Filesystem` - the filesystem on the machine
- `1K-blocks` - the size of the filesystem in 1K blocks
- `Used` - the amount of space used in 1K blocks
- `Available` - the amount of available space in 1K blocks
- `Use%` - the percentage that the filesystem is in use.
- `Mounted` on - where the filesystem is mounted

## How to view disk space usage in human readable format

To view disk space in human readable format pass the `-h` option. This prints
sizes in powers of 1024 and will append `G` for Gigabytes, `M` for Megabytes and
`B` for Bytes.

```sh
df -h
Filesystem      Size  Used Avail Use% Mounted on
/dev/root        24G  2.5G   20G  11% /
devtmpfs        2.0G     0  2.0G   0% /dev
tmpfs           2.0G     0  2.0G   0% /dev/shm
tmpfs           2.0G  1.6M  2.0G   1% /run
tmpfs           2.0G     0  2.0G   0% /sys/fs/cgroup
tmpfs           2.0G     0  2.0G   0% /tmp
tmpfs           396M     0  396M   0% /run/user/1000
```

## How to show the file system type

To show the file system type pass the `-T` option. This causes a new column to
be added to the output displaying the filesystem type.

```sh
df -T
Filesystem     Type     1K-blocks    Used Available Use% Mounted on
/dev/root      ext4      24489260 2533836  20693856  11% /
devtmpfs       devtmpfs   2021940       0   2021940   0% /dev
tmpfs          tmpfs      2022896       0   2022896   0% /dev/shm
tmpfs          tmpfs      2022896    1544   2021352   1% /run
tmpfs          tmpfs      2022896       0   2022896   0% /sys/fs/cgroup
tmpfs          tmpfs      2022896       0   2022896   0% /tmp
tmpfs          tmpfs       404576       0    404576   0% /run/user/1000
```

## How to only show specific file system types

To only show specific file system types pass the `-t` option followed by the
filesystem type or types to be shown. This causes only the file system types to
be shown. The `-t` option accepts a list of types.

```sh
df -t ext4
Filesystem     1K-blocks    Used Available Use% Mounted on
/dev/root       24489260 2533840  20693852  11% /
```

## How to only exclude specific file system types

To exclude specific file types pass the `-x` option followed by the filesystem
type or types to be shown. This causes the filesystem types specified to be
excluded.

```sh
df -x tmpfs
Filesystem     1K-blocks    Used Available Use% Mounted on
/dev/root       24489260 2533844  20693848  11% /
devtmpfs         2021940       0   2021940   0% /dev
```

## How to view space available and mount point for a folder

To view space available, filesystem and mount point for a folder pass the name
of the folder to `df`.

```sh
df -Ht /george/home/
Filesystem     Type  Size  Used Avail Use% Mounted on
/dev/root      ext4   26G  2.6G   22G  11% /
```

The output of this shows where the filesystem type, and where it is mounted.
This can be useful if you are administering a server or machine and are unsure
where a folder is mounted.

## Further reading

- [df man page][1]
- [df Wikipedia page][3]
- [How much disk space?][4]

[1]: http://linux.die.net/man/1/df
[2]: /images/articles/df.png "Linux and Unix df command"
[3]: https://en.wikipedia.org/wiki/Df_(Unix)
[4]: http://docstore.mik.ua/orelly/unix3/upt/ch15_08.htm

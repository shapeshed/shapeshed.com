+++
date = "2016-10-14T00:00:00+00:00"
description = "Tutorial on using touch, a UNIX and Linux command for changing file timestamps. Examples of creating an empty file, updating access and modification time, updating just access time, updating just modification time and setting timestamps in the past."
image = "images/articles/touch.png"
slug = "unix-touch"
tags = ["UNIX", "Linux"]
title = "Linux and Unix touch command tutorial with examples"

+++

![Terminal showing touch man page][2]

## What is the touch command in UNIX?

The `touch` command is a command line utility to update timestamps on files. UNIX and UNIX like operating systems store timestamp information for each file or folder including access time, modify time and change time. It is possible to modify timestamps using the `touch` command either to update a timestamp to the current time or to modify it to a date in the past. 

## How to create an empty file

To create an empty file using the `touch` command pass the name of the file to be created to the touch command. This sets the access and modification time for the file to the current time when running the command. 

    touch file.txt
    ls -l
    -rw-r--r-- 1 george users 0 Oct 14 20:55 file.txt

## How to create multiple empty files

To create multiple empty files pass more than one filename to be created to the `touch` command. This sets the access and modification time for each file created to the current time when running the command.

    touch file1.txt file2.txt file3.txt
    -rw-r--r-- 1 george users 0 Oct 14 20:58 file1.txt
    -rw-r--r-- 1 george users 0 Oct 14 20:58 file2.txt
    -rw-r--r-- 1 george users 0 Oct 14 20:58 file3.txt

## How to avoid creating a file if it does not exist

By default the `touch` command will create a file if it does not exist. To prevent this behaviour pass the `-c` option. 
     
    ls
    file1.txt
    touch -c nonexistentfile.txt
    ls 
    file1.txt

## How to update access and modification time

To update the access and modification time of a file or files pass the name of the file or files to the `touch` command. This will update the access and modification dates to the time the command was run.

    ls -l favicon.ico
    -rw-r--r-- 1 george users   12014 Sep 25 21:27 favicon.ico
    ls -l --time=atime
    -rw-r--r-- 1 george users   12014 Sep 25 21:27 favicon.ico
    touch favicon.ico
    ls -l
    -rw-r--r-- 1 george users 12014 Oct 14 21:22 favicon.ico
    ls -l --time=atime
    -rw-r--r-- 1 george users 12014 Oct 14 21:22 favicon.ico

## How to change only the access time

To change the access time of a file pass the `-a` option. 

    ls -l --time=atime
    -rw-r--r-- 1 george users 0 Oct 14 20:58 file1.txt
    touch -a file1.txt
    ls -l --time=atime
    -rw-r--r-- 1 george users 0 Oct 14 21:03 file1.txt

In this example the modified date remains the same.

    ls -l
    -rw-r--r-- 1 george users 0 Oct 14 20:58 file1.txt

## How to change only the modification time

To change the access time of a file pass the `-m` option. 

    ls -l 
    -rw-r--r-- 1 george users 0 Oct 14 21:09 file1.txt
    touch -a --time=mtime file1.txt
    ls -l
    -rw-r--r-- 1 george users 0 Oct 14 21:11 file1.txt

In this example the access time remains the same.

    ls -l --time=atime
    -rw-r--r-- 1 george users 0 Oct 14 21:09 file1.txt

## How to apply timestamp attributes from one file to another

To apply one files timestamps to another one pass the `-r` option followed by the source and target files. This takes the source file as a reference and applies the timestamps to the target file.

    ls -l
    -rw-r--r-- 1 george users 0 Oct 14 21:19 file1.txt
    -rw-r--r-- 1 george users 0 Oct 14 21:13 file2.txt
    touch -r file2.txt file1.txt
    ls -l
    -rw-r--r-- 1 george users 0 Oct 14 21:13 file1.txt
    -rw-r--r-- 1 george users 0 Oct 14 21:13 file2.txt

## How to set a time that is not the current time

To set a time that is not the current time pass the `-t` option followed by a time in the format `[[CC]YY]MMDDhhmm[.ss]`. In the following example the file access and modification dates are set to 25th January 1977.

    ls -l
    -rw-r--r-- 1 george users 0 Oct 14 21:13 file1.txt
    ls -l
    -rw-r--r-- 1 george users 0 Jan 25  1977 file1.txt

You can literally bend time with the `touch` command.

![Marty McFly by the clock][5]




## Further reading 
* [touch man page][1]
* [The touch command][3]
* [Touch Wikipedia page][4]

[1]: http://linux.die.net/man/1/touch
[2]: /images/articles/touch.png "Linux and Unix touch command"
[3]: http://www.linfo.org/touch.html
[4]: https://en.wikipedia.org/wiki/Touch_(Unix)
[5]: /images/articles/mcfly.jpg "Bending time with the touch command"

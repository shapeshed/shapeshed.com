+++
date = "2016-09-07T00:00:00+00:00"
description = "Tutorial on using file, a UNIX and Linux command for determining file types. Examples of a single file, multiple files, viewing mime types and compressed files."
image = "images/articles/file.png"
slug = "unix-file"
tags = ["UNIX", "Linux"]
title = "Linux and Unix file command tutorial with examples"

+++

![Terminal showing file man page][2]

## What is the file command in UNIX?

The `file` command determines the file type of a file. It reports the file type in human readable format (e.g. 'ASCII text') or MIME type (e.g. 'text/plain; charset=us-ascii'). As filenames in UNIX can be entirely independent of file type `file` can be a useful command to determine how to view or work with a file. 

## How to determine the file type of a file

To determine the file type of a file pass the name of a file to the `file command`.The file name along with the file type will be printed to standard output. 

    file file.txt
    file.txt: ASCII text

To show just the file type pass the `-b` option.

    file -b file.txt
    ASCII text

The `file` command can be useful as filenames in UNIX bear no relation to their file type. So a file called `somefile.csv` could actually be a zip file. This can be verified by the `file` command.

    file somefile.csv
    somefile.csv: Zip archive data, at least v2.0 to extract
    
## How to determine the file type of multiple files

The `file` command can also operate on multiple files and will output a separate line to standard output for each file.

    file unix-*.md
    unix-cat.md:         ASCII text, with very long lines
    unix-comm.md:        ASCII text, with very long lines
    unix-cut.md:         UTF-8 Unicode text
    unix-exit-status.md: ASCII text
    unix-file.md:        ASCII text, with very long lines

## How to view the mime type of a file

To view the mime type of a file rather than the human readable format pass the `-i` option. 

    file -i file.txt
    file.txt: text/plain; charset=us-ascii

This can be combined with the `-b` option to just show the mime type.

    file -i -b file.txt
    text/plain; charset=us-ascii
    
## How to view compressed files without decompressing

To view compressed files without decompressing them pass the `-z` option. In the following example a file `foo.txt.gz` is a gzip compressed ASCII text file.

    file -z bar.txt.gz
    bar.txt.gz: ASCII text (gzip compressed data, was "bar.txt", last modified: Wed Sep  7 19:31:23 2016, from Unix)


## Further reading 
* [file man page][1]
* [The Linux file command][3]
* [file (command) Wikipedia page][4]

[1]: http://linux.die.net/man/1/file
[2]: /images/articles/file.png "Linux and Unix file command"
[3]: http://alvinalexander.com/unix/edu/examples/file.shtml
[4]: https://en.wikipedia.org/wiki/File_(command)

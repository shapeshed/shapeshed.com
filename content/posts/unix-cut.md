+++
date = "2016-07-19T18:16:59+01:00"
description = "Tutorial on using cut, a UNIX and Linux command for cutting sections from each line of files. Examples of cutting by character, byte position, cutting based on delimiter and how to modify the output delimiter."
image = "images/articles/cut.png"
slug = "unix-cut"
tags = ["UNIX", "Linux"]
title = "Linux and Unix cut command tutorial with examples"

+++

![cut man page](/images/articles/cut.png)

## What is the cut command in UNIX?

The `cut` command in UNIX is a command line utility for cutting sections from each line of files and writing the result to standard output. It can be used to cut parts of a line by byte position, character and delimiter. It can also be used to cut data from file formats like CSV. 

## How to cut by byte position

To cut out a section of a line by specifying a byte position use the `-b` option.

    echo 'baz' | cut -b 2
    a
    echo 'baz' | cut -b 1-2
    ba
    echo 'baz' | cut -b 1,3
    bz

## How to cut by character

To cut by character use the `-c` option. This selects the characters given to the `-c` option. This can be a list of comma separated numbers, a range of numbers or a single number.

Where your input stream is character based `-c` can be a better option than selecting by bytes as often characters are more than one byte.

In the following example character ‘♣’ is three bytes. By using the `-c` option the character can be correctly selected along with any other characters that are of interest.

    echo '♣foobar' | cut -c 1,6
    ♣a
    echo '♣foobar' | cut -c 1-3
    ♣fo

## How to cut based on a delimiter

To cut using a delimiter use the `-d` option. This is normally used in conjunction with the `-f` option to specify the field that should be cut.

In the following example a CSV file exists and is saved as `names.csv`.

    John,Smith,34,London
    Arthur,Evans,21,Newport
    George,Jones,32,Truro

The delimiter can be set to a comma with `-d ','`. `cut` can then pull out the fields of interest with the `-f` flag. In the following example the first field is cut.

    cut -d ',' -f 1 names.csv
    John
    Arthur  
    George

Multiple fields can be cut by passing a comma separated list.

    cut -d ',' -f 1,4 names.csv
    John,London
    Arthur,Newport
    George,Truro

## How to cut by complement pattern

To cut by complement us the `--complement` option. Note this option is not available on the BSD version of `cut`. The `--complement` option selects the _inverse_ of the options passed to cut.

In the following example the `-c` option is used to select the first character. Because the `--complement` option is also passed to `cut` the second and third characters are cut.

    echo 'foo' | cut --complement -c 1
    oo

## How to modify the output delimiter

To modify the output delimiter use the `--output-delimiter` option. Note that this option is not available on the BSD version of `cut`. In the following example a semi-colon is converted to a space and the first, third and fourth fields are selected.

    echo 'how;now;brown;cow' | cut -d ';' -f 1,3,4 --output-delimiter=' '
    how brown cow

## Further reading

*   [cut man page](http://linux.die.net/man/1/cut)
*   [10 Practical Linux Cut Command Examples to Select File Columns](http://www.thegeekstuff.com/2013/06/cut-command-examples)
*   [Linux and Unix cut command](http://www.computerhope.com/unix/ucut.htm)
*   [Cut Command in Unix ( Linux) Examples](http://www.folkstalk.com/2012/02/cut-command-in-unix-linux-examples.html)



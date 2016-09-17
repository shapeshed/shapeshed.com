{
  "slug": "unix-wc",
  "title": "Linux and Unix wc command tutorial with examples",
  "date": "2011-03-19T00:00:00+00:00",
  "image": "images/articles/wc.png",
  "description": "Tutorial on using wc, a UNIX and Linux tool for printing newline, word and byte counts for files. Examples of printing the number of lines in a file, printing the number of characters in a file and printing the number of words in a file.",
  "tags": [
    "UNIX",
    "Linux"
  ]
}

![wc man page][3]

## What is the wc command in UNIX?

The `wc` command in UNIX is a command line utility for printing newline, word and byte counts for files. It can return the number of lines in a file, the number of characters in a file and the number of words in a file. It can also be combine with pipes for general counting operations. 

## How to get count information on a file

To get count information on a file use the `wc` command with no options.

    wc /usr/share/dict/words
    235886  235886 2493109 /usr/share/dict/words

The output is number of lines, number of words, number of bytes, filename.

## How to print the number of lines in a file

To print the number of lines in a file (or more specifically newline counts) use the `-l` option.

    wc -l /usr/share/dict/words
    235886 /usr/share/dict/words

## How to print the number of characters in a file

To print the number of characters in a file (or more specifically newline counts) use the `-m` option.

    wc -m /usr/share/dict/words
    2493109 /usr/share/dict/words

## How to print the number of bytes in a file

To print the number of bytes in a file (or more specifically newline counts) use the `-c` option.

    wc -c /usr/share/dict/words
    2493109 /usr/share/dict/words

## How to print the number of words in a file

To print the number of bytes in a file (or more specifically newline counts) use the `-w` option.

    wc -w /usr/share/dict/words
    235886 /usr/share/dict/words

## How to count records in CSV files

To count the number of records (or rows) in several CSV files the `wc` can used in conjunction with pipes.
In the following example there are five CSV files. The requirement is to find out the sum of records in all five files. This can be achieved by piping the output of the [cat][2] command to wc.

    cat *.csv | wc -l 
    1866

Done. There are 1866 records across the 5 files.

## How to count the number files in a directory 

To count the number of folders and files in a directory `wc` can be combined with the `ls` command. By passing the `-1` options to `ls` it will each folder or line on a new line. This can be piped to `wc` to give a count. 

    ls -1 | wc -1
    21

## Further reading

* [wc man page][1]
* [The Linux wc command (word count)][2]

[1]: http://linux.die.net/man/1/wc
[2]: http://alvinalexander.com/unix/edu/examples/wc.shtml
[3]: /images/articles/wc.png

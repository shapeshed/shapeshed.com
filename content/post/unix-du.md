{
  "slug": "unix-du",
  "title": "Linux and Unix du command tutorial with examples",
  "date": "2016-09-26T00:00:00+00:00",
  "image": "images/articles/du.png",
  "description": "Tutorial on using du, a UNIX and Linux command for estimating file space usage. Examples of showing a disk usage summary, outputting a human readable format, showing the size of a directory and showing the ten largest files or folders on a system.",
  "tags": [
    "UNIX",
    "Linux"
  ]
}

![Terminal showing du man page][2]

## What is the du command?

The `du` command is a command line utility for reporting file system disk space usage. It can be used to find out disk usage for files and folders and to show what is taking up space. It supports showing just directories or all files, showing a grand total, outputting in human readable format and can be combined with other UNIX tools to output a sorted list of the largest files of folders on a system. 

## How to view a disk usage summary of a directory

To view a disk usage summary of a directory pass the directory to the `du` command. This will print a summary of the files and folders in a directory.

    du ~/go
    8       /home/george/go/src/gopkg.in/yaml.v2/.git/info
    48      /home/george/go/src/gopkg.in/yaml.v2/.git/hooks
    8       /home/george/go/src/gopkg.in/yaml.v2/.git/refs/heads
    8       /home/george/go/src/gopkg.in/yaml.v2/.git/refs/remotes/origin
    12      /home/george/go/src/gopkg.in/yaml.v2/.git/refs/remotes
    1712    /home/george/go/src/gopkg.in/yaml.v2
    1716    /home/george/go/src/gopkg.in
    ...

The output show the disk usage in kilobytes in the first column followed by the full path to the file or folder. Folders are summaries so include a sum of files and folders within them.

## How to view a grand total for a directory

To view a grand total for a directory pass the `-c` option. This will show the full output and append a total line.

    du -c ~/go
    ...
    14420   /home/george/go/pkg
    23088   /home/george/go/bin
    170436  /home/george/go
    170436  total

## How to view disk usage in human readable format

To view disk usage in human readable format pass the `-h` option. Instead of showing file size in kilobytes for all files and folders the output is modified to into a human readable format.

    du -h ~/go
    8.0K    /home/george/go/src/gopkg.in/yaml.v2/.git/info
    48K     /home/george/go/src/gopkg.in/yaml.v2/.git/hooks
    1.2M    /home/george/go/src/gopkg.in/yaml.v2/.git/objects/pack
    1.2M    /home/george/go/src/gopkg.in/yaml.v2/.git/objects


## How to view the file size of a directory

To view the file size of a directory pass the `-s` option to the du command followed by the folder. This will print a grand total size for the folder to standard output. 

    du -s /home/george
    2142628 /home/george

Along with the `-h` option a human readable format is possible.

    du -sh /home/george
    2.1G    /home/george

## How to sort by file or folder size

To sort by file size pass the output of `du` to `sort` and use the `-n` (numeric) and `-r` (reverse) options.

    du ~/go | sort -n -r | less
    170440  /home/george/go
    132816  /home/george/go/src
    74024   /home/george/go/src/github.com
    57072   /home/george/go/src/golang.org

## How to find the largest files or folders on a file system

To find the largest folders on a file system pass the `-a` option. This will change the behaviour of `du` to write size counts for files as well as folders. Run the following as root to see the ten largest files or folders on a system. This can be useful if you are dealing with out of disk space issues on a system. 

    du -a / | sort -n -r | head -n 10
    5351116 /
    2462616 /usr
    2153492 /home
    2153472 /home/george
    1571924 /usr/lib

## Further reading 
* [du man page][1]
* [du Wikipedia page][3]
* [10 Linux du command examples][4]
* [How to use the du command][5]

[1]: http://linux.die.net/man/1/du
[2]: /images/articles/du.png "Linux and Unix du command"
[3]: https://en.wikipedia.org/wiki/Du_(Unix)
[4]: http://www.thegeekstuff.com/2012/06/du-command-examples
[5]: http://www.linfo.org/du.html

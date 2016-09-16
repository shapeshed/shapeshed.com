{
  "slug": "unix-mkdir",
  "title": "Linux and Unix mkdir command tutorial with examples",
  "date": "2016-09-09T00:00:00+00:00",
  "image": "images/articles/mkdir.png",
  "description": "Tutorial on using mkdir, a UNIX command for creating directories. Examples of creating a directory, creating multiple directories, creating parent directories and setting permissions.",
  "tags": [
    "UNIX"
  ]
}

![Terminal showing file man page][2]

## What is the mkdir command in UNIX?

The `mkdir` command in UNIX allows users to create directories or folders as they are referred to in some operating systems. The `mkdir` command can create multiple directories at once and also set permissions when creating the directory. The user running the command must have appropriate permissions on the parent directory to create a directory or will receive a permission denied error. 


## How to create a directory

To create a directory in UNIX or Linux using the `mkdir` command pass the name of directory to the `mkdir` command.

    mkdir mydirectory
    ls
    mydirectory
  
## How to create multiple directories

To create multiple directories in UNIX or Linux using the `mkdir` command pass the names of directories to be created to the `mkdir` command. The names of directories should be separated by spaces.

    mkdir foo bar baz
    ls
    foo bar baz
    
## How to create parent directories

To create parent directories using the `mkdir` command pass the `-p` option. Suppose that the directory path `foo/bar/baz` is to be created. This can be created with `mkdir` as follows.

    mkdir foo
    cd foo
    mkdir bar
    cd bar
    mkdir baz
    tree foo
    foo
    └── bar
        └── baz


This may also be achieved in a single command with the `-p` flag.

    mkdir -p foo/bar/baz
    tree foo
    foo
    └── bar
        └── baz

## Insufficient permissions when creating a directory

The `mkdir` command will return a permission denied error when trying to create a directory in a parent directory that the user does not have permissions for.

    mkdir /etc/foo
    mkdir: cannot create directory ‘/etc/foo’: Permission denied

In this instance to create a directory in this location the user will need `sudo` permissions or to contact a system administrator.
    
## How to set permissions when creating a directory

To set permissions when creating a directory pass the `-m` option. This accepts a number value to set the file mode. If no options are passed to `mdkir` the directory will be created with read, write and execute permissions for the user (755). 
In the following example the directory is created to be world readable.

    mkdir -m 777 foo
    ls -la
    total 12
    drwxr-xr-x 3 george users 4096 Sep  9 20:59 .
    drwxr-xr-x 8 george users 4096 Sep  9 20:47 ..
    drwxrwxrwx 2 george users 4096 Sep  9 20:59 foo


## Further reading 
* [mkdir man page][1]
* [The Linux mkdir command][3]
* [file (command) Wikipedia page][4]

[1]: http://linux.die.net/man/1/mkdir
[2]: /images/articles/mkdir.png "Linux and Unix mkdir command"
[3]: http://ww.linfo.org/mkdir.html
[4]: https://en.wikipedia.org/wiki/Mkdir


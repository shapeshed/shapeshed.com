{
  "slug": "unix-find",
  "title": "Linux and Unix find command tutorial with examples",
  "date": "2016-07-12T20:20:27+01:00",
  "description": "A series of how to examples on using find, a UNIX tool for sorting lines of text files",
  "tags": [
    "UNIX"
  ]
}

![find man page][5]

## How to find a single file by name

To find a single file by name pass the `-name` option to `find` along with the name of the file you are looking for.

Suppose the following directory structure exists shown here as the output of the `tree` command.

    foo
    ├── bar
    ├── baz
    │   └── foo.txt
    └── bop

The file `foo.txt` can be located with the `find` by using the `-name` option.

    find ./foo -name foo.txt 
    ./foo/baz/foo.txt

## How to find and delete a file

To find and delete a file pass the `--delete` option to `find`. This will delete the file with no undo so be careful.

    find ./foo -name foo.txt --delete

To be prompted to confirm deletion combine `-exec` with `rm -i`.

    find ./foo -name foo.txt -exec rm -i {} \;

## How to find a directory

To find a directory specify the option `-type d` with `find`.

    find ./foo -type d -name bar
    ./foo/bar

## How to find files by modification time

To find files by modification time use the `-mtime` option followed by the number of days to look for. The number can be a positive or negative value. A negative value equates to less then so `-1` will find files modified within the last day. Similarly `+1` will find files modified more than one day ago.

    find ./foo -mtime -1
    find ./foo -mtime +1

## How to find files by permission

To find files by permission use the `-perm` option and pass the value you want to search for. The following example will find files that everyone can read, write and execute.

    find ./foo -perm 777

## How to find and operate on files

To find and operate on file us the `-exec` option. This allows a command to be executed on files that are found.

    find ./foo -type f -name bar -exec chmod 777 {} \;

## How to find and replace in a range of files

To find and replace across a range of files the `find` command may be combined with another utility like `sed` to operate on the files by using the `-exec` option. In the following example any occurrence of find is replaced with replace. 

    find ./ -type f -exec sed -i 's/find/replace/g' {} \;


## How to search for text within multiple files

Another use of combining `find` with `exec` is to search for text within multiple files.

    find ./ -type f -name "*.md" -exec grep 'foo'  {} \;

## Further reading

* [find man page][1]
* [A collection of Unix/Linux find command examples][2]
* [Find Command in Unix and Linux Examples][3]
* [Some examples of using UNIX find command][4]

[1]: http://linux.die.net/man/1/find
[2]: http://alvinalexander.com/unix/edu/examples/find.shtml
[3]: http://www.folkstalk.com/2011/12/101-examples-of-using-find-command-in.html
[4]: http://www.ling.ohio-state.edu/~kyoon/tts/unix-help/unix-find-command-examples.htm
[5]: https://shapeshed.com/images/articles/find.png

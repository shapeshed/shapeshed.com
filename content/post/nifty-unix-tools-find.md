{
  "slug": "nifty-unix-tools-find",
  "title": "Nifty UNIX tools - find",
  "date": "2016-07-12T20:20:27+01:00",
  "description": "Examples of how to find and operate on files.",
  "tags": [
    "UNIX"
  ]
}

## Find a single file

In its simplest form `find` can be used to walk a filesystem tree and find a file. Considering the following directory structure we can use `find` to locate files of interest

    foo
    ├── bar
    ├── baz
    │   └── foo.txt
    └── bop

By using the `-name` flag we can search for the name of the file and use `-type -f` to say we are looking for a file.

    find ./foo -name foo.txt -type f 
    ./foo/baz/foo.txt

## Find and delete a file

`find` allows you to delete files that you find with the `--delete` flag.

    find ./foo -name foo.txt -type f -delete

You can also use rm if you want to prompt for deletion.

    find ./foo -name foo.txt -exec rm -i {} \;

## Find a directory

You can search recursively for directories using `-type d`.

    find ./foo -type d -name bar
    ./foo/bar

## Operating on files you find

By using `exec` you can run another command on the files you find. In this example the permissions on the file are changed.

    find ./foo -type f -name bar -exec chmod 777 {} \;

## Find and replace

One example of using `exec` is to loop over a series of files and make a replacement. By combining with something like `sed`you can find and replace text on a large group of files in one line. 

    find ./ -type f -exec sed -i 's/find/replace/g' {} \;


## Look for content in files

By using `exec` you can look for content in a series of file through combining with `grep`.

    find ./ -type f -name "*.md" -exec grep 'foo'  {} \;

## Conclusion

Find is a flexible tool for walking a file heirarchy. It supports searching a filesystem and through `exec` supports subsequent operations on found files. I use `find` daily and find it super useful!

## Further reading

* [find man page][1]
* [A collection of Unix/Linux find command examples][2]
* [Find Command in Unix and Linux Examples][3]
* [Some examples of using UNIX find command][4]

[1]: http://linux.die.net/man/1/find
[2]: http://alvinalexander.com/unix/edu/examples/find.shtml
[3]: http://www.folkstalk.com/2011/12/101-examples-of-using-find-command-in.html
[4]: http://www.ling.ohio-state.edu/~kyoon/tts/unix-help/unix-find-command-examples.htm

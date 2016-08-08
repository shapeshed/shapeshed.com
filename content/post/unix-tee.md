{
  "slug": "unix-tee",
  "title": "Linux and Unix tee command tutorial with examples",
  "date": "2016-07-28T00:00:00+00:00",
  "description": "How to examples on using tee, a UNIX tool for copying standard input to standard output and making a copy to one or more files.",
  "image": "images/articles/tee.png",
  "tags": [
    "UNIX"
  ]
}

![Tee man page][4]

## What is the tee command in UNIX?

The `tee` command in UNIX is a command line utility for copying standard input to standard output. It supports writing whatever it is given from standard input to standard output and optional writing to one or more files. The command is named after T splitter used in plumbing. 

## How to write to standard output and a file

To write to standard output and a file use `tee` after a pipe and specify the file or files to write to.

    echo 'foo' | tee foo.txt
    foo
    cat foo.txt
    foo

This writes the output of the first command to standard output and to a file called `foo.txt`

## How to write to a file and append output

To use `tee` and append to a file rather use the `-a` option.

    cat foo.txt
    foo
    echo 'bar' | tee -a foo.txt
    bar
    cat foo.txt
    foo
    bar

## How to write the state of a pipe 

As data flows through UNIX pipelines it can be useful to take a snapshot of the state of the data. This can be for debugging purposes or to take a backup.

    ls ~/ | tee pipe1.txt | grep ^b | tee pipe2.txt | sort -r

## How to watch log files and write to a file

In this example there is a requirement to analyse the HTTP2 traffic going through an nginx server. Using `tee` the live logs can be streamed to standard output and also write to a file for further analysis later.

    tail -f /var/log/nginx/access.log | grep --line-buffered "HTTP/2.0" | tee -a http2.log

## How to write to a privileged file using tee

To write to a privileged file `tee` may be used as part of a pipe to elevate to sudo permissions.

Suppose we have a `file` owned by root. Trying to append to this file as a normal user results in a permissions error.

    echo 'foo' >> file 
    zsh: permission denied: file

As part of a pipe `tee` can take the input, elevate permissions and write to the file.

    echo "foo" | sudo tee -a file

## Further reading

* [tee man page][1]
* [Linux Terminal: the tee command][2]
* [Linux and Unix tee command help and examples][3]

[1]: http://man7.org/linux/man-pages/man1/tee.1.html
[2]: https://linuxaria.com/pills/linux-terminal-the-tee-command
[3]: http://www.computerhope.com/unix/utee.htm
[4]: https://shapeshed.com/images/articles/tee.png

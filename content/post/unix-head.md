{
  "slug": "unix-head",
  "title": "Linux and Unix head command tutorial with examples",
  "date": "2010-11-03T00:00:00+00:00",
  "lastmod": "2016-10-03T00:00:00+00:00",
  "image": "images/articles/head.png",
  "description": "Tutorial on using head, a UNIX and Linux command for outputting the first part of files. Examples of outputting the first ten lines of a file, limiting the number of lines, limiting the number of bytes, showing multiple files and using pipes.",
  "tags": [
    "UNIX",
    "Linux"
  ]
}

![Terminal showing head man page][6]

## What is the head command?

The `head` command is a command-line utility for outputting the first part of files given to it via standard input. It writes results to standard output. By default `head` returns the first ten lines of each file that it is given. 


## How to view the first ten lines of a file

To view the first ten lines of a file pass the name of a file to the `head` command. The first ten lines of the file will be printed to standard output. 

    head /usr/share/dict/words
    A
    a
    AA
    AAA
    Aachen
    aah
    Aaliyah
    Aaliyah's
    aardvark
    aardvark's

## How to limit the number of lines to show

To set the number of lines to show with `head` pass the `-n` option followed by the number of lines to show. 

    head -n 1 /usr/share/dict/words
    A

## How to limit the number of bytes to show

To limit the number of bytes shown with `head` pass the `-c` option. Instead of limiting by number of lines this will limit by the number of bytes passed to the `-c` option. In the following example the output is limited to 16 bytes.

    
    head -c 16 /usr/share/dict/words
    A
    a
    AA
    AAA
    Aache%

## How to show multiple files

To show the first ten lines of multiple files pass more than one filename to the `head` command. This will output the first ten lines of each file to standard output with a header indicating which file is being shown. 

    head /usr/share/dict/words /usr/share/dict/french
    ==> /usr/share/dict/words <==
    A
    a
    AA
    AAA
    Aachen
    aah
    Aaliyah
    Aaliyah's
    aardvark
    aardvark's

    ==> /usr/share/dict/french <==
    ça
    AAAI
    abaissé
    abaissa
    abaissai
    abaissaient
    abaissais
    abaissait
    abaissant
    abaissas

To suppress the header line pass the `-q` option. This can be useful to combine files.

    head -q /usr/share/dict/words /usr/share/dict/french
    A
    a
    AA
    AAA
    Aachen
    aah
    Aaliyah
    Aaliyah's
    aardvark
    aardvark's
    ça
    AAAI
    abaissé
    abaissa
    abaissai
    abaissaient
    abaissais
    abaissait
    abaissant
    abaissas

## How to use head with pipes

The `head` command can be piped to from other commands. In the following example the output of the `ls` command is piped to `head` to only show the five most recently modified files or folders.

    ls -t /etc | head -n 5
    ld.so.cache
    ssh
    pam.d
    shadow
    passwd

## Further reading

* [head man page][1]
* [How to use the head command][3]
* [head Wikipedia page][4]
* [Linux and Unix head command][5]

[1]: http://linux.die.net/man/1/head
[2]: https://shapeshed.com/unix-sort/
[3]: http://www.linfo.org/head.html
[4]: https://en.wikipedia.org/wiki/Head_(Unix)
[5]: http://www.computerhope.com/unix/uhead.htm
[6]: /images/articles/head.png "Linux and Unix head command"
	

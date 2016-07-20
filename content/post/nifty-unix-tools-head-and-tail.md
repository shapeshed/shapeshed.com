{
  "slug": "nifty-unix-tools-head-and-tail",
  "title": "Nifty Unix Tools - head and tail",
  "date": "2010-11-03T00:00:00+00:00",
  "excerpt": "For quickly looking into source and log files head and tail are simple tools for everyday use that become powerful when piped with other commands.",
  "tags": [
    "UNIX"
  ]
}

## Head - view the top of files

Head is simple tool to view the top of files. In its simplest form you can use it to see the first ten lines of a file.

    head /usr/share/dict/words
    A
    a
    aa
    aal
    aalii
    aam
    Aani
    aardvark
    aardwolf
    Aaron

By default it outputs the first ten lines of a file but you can modify that by passing the -n option

    head -n 1 /usr/share/dict/words
    A

In fact you don't even need to use -n. You can just use a number.

    head -1 /usr/share/dict/words
    A

This is useful for viewing comments and the the top of files in general but becomes really useful when you pipe things together. 

    FILES=/some/dir/*.zip
    SEARCH_STRING="findme"

    for f in $FILES
    do
      zipinfo -1 $f | grep $SEARCH_STRING | head -1 | awk '{ print "Found in: " $1 }'
    done

Here we are searching the contents of zip files with a search string but we only want the first occurence. So we can use head to filter the results to just one. 

## Tail

Tail is the opposite to head but operates on the end of files.

    tail /usr/share/dict/words
    zymotoxic
    zymurgy
    Zyrenian
    Zyrian
    Zyryan
    zythem
    Zythia
    zythum
    Zyzomys
    Zyzzogeton

It also accepts the -n argument for the number of lines you want

    tail -n 1 /usr/share/dict/words
    Zyzzogeton

This also works passing just a number

    tail -1 /usr/share/dict/words
    Zyzzogeton

## Watching log files

Tail has the option to watch files in real time so you can keep an eye on log files. You can enable this by passing the -f option.

    tail -f /Users/george/Sites/myrailspp/log/development.log

This is really useful for watching logs. You can use it for watching apache, mail logs - any file! 

head and tail are simple tools but are extemely useful for everyday usage, especially in piping so worth understanding!

## Further reading

* [head man page][1]
* [tail man page][2]
* [The Linux head and tail commands][3]

[1]: http://linux.die.net/man/1/head
[2]: http://linux.die.net/man/1/tail
[3]: http://www.devdaily.com/blog/post/linux-unix/linux-head-tail-commands
	

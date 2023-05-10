+++
date = "2016-10-03T00:00:00+00:00"
description = "Tutorial on using tail, a UNIX and Linux command for outputting the last part of files. Examples of outputting the last ten lines of a file, limiting the number of lines, limiting the number of bytes, showing multiple files, watching a file for changes and using pipes."
image = "images/articles/tail.png"
slug = "unix-tail"
tags = ["UNIX", "Linux"]
title = "Linux and Unix tail command tutorial with examples"
+++

<!-- prettier-ignore -->
![A terminal showing the tail man page][6]
{.hero}

## What is the tail command?

The `tail` command is a command-line utility for outputting the last part of
files given to it via standard input. It writes results to standard output. By
default `tail` returns the last ten lines of each file that it is given. It may
also be used to follow a file in real-time and watch as new lines are written to
it.

## How to view the last ten lines of a file

To view the last ten lines of a file pass the name of a file to the `tail`
command. The last ten lines of the file will be printed to standard output.

```sh
tail /usr/share/dict/words
zygote's
zygotes
zygotic
zymurgy
zymurgy's
Zyrtec
Zyrtec's
Zyuganov
Zyuganov's
Zzz
```

## How to limit the number of lines to show

To set the number of lines to show with `tail` pass the `-n` option followed by
the number of lines to show.

```sh
tail -n 1 /usr/share/dict/words
Zzz
```

## How to limit the number of bytes to show

To limit the number of bytes shown with `tail` pass the `-c` option. Instead of
limiting by number of lines this will limit by the number of bytes passed to the
`-c` option. In the following example the output is limited to 16 bytes.

```sh
tail -c 24 /usr/share/dict/words
Zyuganov
Zyuganov's
Zzz
```

## How to show multiple files

To show the last ten lines of multiple files pass more than one filename to the
`tail` command. This will output the last ten lines of each file to standard
output with a header indicating which file is being shown.

```sh
tail /usr/share/dict/words /usr/share/dict/french
==> /usr/share/dict/words <==
zygote's
zygotes
zygotic
zymurgy
zymurgy's
Zyrtec
Zyrtec's
Zyuganov
Zyuganov's
Zzz
```

```sh
==> /usr/share/dict/french <==
zoos
zouave
zouaves
zozoter
zéro
zéros
zyeuter
zézaiement
zézaiements
zézayer
```

To suppress the header line pass the `-q` option. This can be useful to combine
files.

```sh
tail -q /usr/share/dict/words /usr/share/dict/french
zygote's
zygotes
zygotic
zymurgy
zymurgy's
Zyrtec
Zyrtec's
Zyuganov
Zyuganov's
Zzz
zoos
zouave
zouaves
zozoter
zéro
zéros
zyeuter
zézaiement
zézaiements
zézayer
```

## How to watch a file for changes

To watch a file for changes with the `tail` command pass the `-f` option. This
will show the last ten lines of a file and will update when new lines are added.
This is commonly used to watch log files in real-time. As new lines are written
to the log the console will update will new lines.

```sh
tail -f /var/log/nginx/access.log
173.169.79.32 - - [03/Oct/2016:21:20:09 +0100] "GET / HTTP/1.1" 200 2213 "-" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/601.7.7 (KHTML, like Gecko)"
...
```

Newer versions of `tail` also support watching multiple files. As the file
updates a header will show which line the update is from.

```sh
tail -f /var/log/nginx/access.log /var/log/nginx/access.log
```

```sh
==> /var/log/nginx/access.log <==
173.169.79.32 - - [03/Oct/2016:21:23:09 +0100] "GET /apple-touch-icon-precomposed.png HTTP/1.1" 404 162 "-" "Safari/11601.7.7 CFNetwork/760.6.3 Darwin/15.6.0 (x86_64)"
```

```sh
==> /var/log/nginx/error.log <==
2016/10/03 21:23:53 [error] 30632#30632: *1737 access forbidden by rule, client: 216.137.60.86, server: shapeshed.com, request: "GET /wp-login.php HTTP/1.1", host: "shapeshed.com"
```

## How to use tail with pipes

The `tail` command can be piped to from other commands. In the following example
the output of the `ls` command is piped to `tail` to only show the five files or
folders modified the longest time ago.

```sh
ls -t /etc | tail -n 5
login.defs
request-key.conf
libao.conf
mime.types
pcmcia
```

## Further reading

- [tail man page][1]
- [The tail command][3]
- [tail Wikipedia page][4]
- [14 tail and head commands in Linux/Unix][5]

[1]: http://linux.die.net/man/1/tail
[3]: http://www.linfo.org/tail.html
[4]: https://en.wikipedia.org/wiki/Tail_(Unix)
[5]: https://www.linux.com/blog/14-tail-and-head-commands-linuxunix
[6]: /images/articles/tail.png "Linux and Unix tail command"

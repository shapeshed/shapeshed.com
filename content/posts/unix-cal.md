{
  "slug": "unix-cal",
  "title": "Linux and Unix cal command tutorial with examples",
  "date": "2016-09-27T00:00:00+00:00",
  "image": "images/articles/cal.png",
  "description": "Tutorial on using cal, a UNIX and Linux command for displaying a calendar in the console. Examples of displaying a single month, multiple months, showing week numbers, Julian dates and arbitrary dates passed as arguments.",
  "tags": [
    "UNIX",
    "Linux"
  ]
}

![Terminal showing cal man page][2]

## What is the cal command?

The `cal` command is a command line utility for displaying a calendar in the terminal. It can be used to print a single month, many months or an entire year. It supports starting the week on a Monday or a Sunday, showing Julian dates and showing calendars for arbitrary dates passed as arguments.

## How to show a calendar in the terminal

To show a calendar in the terminal simply run the `cal` command. This will output a calendar of the current month with the current day highlighted.

    cal
       September 2016
    Mo Tu We Th Fr Sa Su
              1  2  3  4
     5  6  7  8  9 10 11
    12 13 14 15 16 17 18
    19 20 21 22 23 24 25
    26 27 28 29 30

## How to output more than one month

To output more than one month pass the `-n` option along with the number of months that you wish to show.

    cal -n 2
       September 2016         October 2016
    Mo Tu We Th Fr Sa Su  Mo Tu We Th Fr Sa Su
              1  2  3  4                  1  2
     5  6  7  8  9 10 11   3  4  5  6  7  8  9
    12 13 14 15 16 17 18  10 11 12 13 14 15 16
    19 20 21 22 23 24 25  17 18 19 20 21 22 23
    26 27 28 29 30        24 25 26 27 28 29 30
                          31

## How to display week numbers 

To display week numbers pass the `-w` option. This modifies the output to display the week number before each row. 

    cal -w
         September 2016
       Mo Tu We Th Fr Sa Su
    35           1  2  3  4
    36  5  6  7  8  9 10 11
    37 12 13 14 15 16 17 18
    38 19 20 21 22 23 24 25
    39 26 27 28 29 30

## How to display the day of the year in numbers

To display the day of the year in numbers (or Julian dates) pass the `-j` option. This displays days numbered from January 1.

    cal -j
           September 2016
    Mon Tue Wed Thu Fri Sat Sun
                245 246 247 248
    249 250 251 252 253 254 255
    256 257 258 259 260 261 262
    263 264 265 266 267 268 269
    270 271 272 273 274

## How to print a calendar for a particular day, month and year

To print a calendar for a particular month and year pass the day month and year to the `cal` command. 

    cal 25 01 1977
        January 1977
    Mo Tu We Th Fr Sa Su
                    1  2
     3  4  5  6  7  8  9
    10 11 12 13 14 15 16
    17 18 19 20 21 22 23
    24 25 26 27 28 29 30
    31

This can also be combined with other options. 

    cal -3 25 01 1977
        December 1976         January 1977          February 1977
    Mo Tu We Th Fr Sa Su  Mo Tu We Th Fr Sa Su  Mo Tu We Th Fr Sa Su
           1  2  3  4  5                  1  2      1  2  3  4  5  6
     6  7  8  9 10 11 12   3  4  5  6  7  8  9   7  8  9 10 11 12 13
    13 14 15 16 17 18 19  10 11 12 13 14 15 16  14 15 16 17 18 19 20
    20 21 22 23 24 25 26  17 18 19 20 21 22 23  21 22 23 24 25 26 27
    27 28 29 30 31        24 25 26 27 28 29 30  28
                          31

## Further reading 
* [cal man page][1]
* [cal Wikipedia page][3]
* [cal 9 1752 explained][4]
* [Calendar (cal) on Linux command line][5]

[1]: https://linux.die.net/man/1/cal
[2]: /images/articles/cal.png "Linux and Unix cal command"
[3]: https://en.wikipedia.org/wiki/Cal_(Unix)
[4]: http://www.csd.uwo.ca/~magi/personal/humour/Computer_Audience/'cal%209%201752'%20explained.html
[5]: https://www.if-not-true-then-false.com/2009/calendar-cal-on-linux-command-line/

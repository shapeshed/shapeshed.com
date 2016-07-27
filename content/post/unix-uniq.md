{
  "slug": "unix-uniq",
  "title": "Linux and Unix uniq command tutorial with examples",
  "date": "2016-07-26T00:00:00+00:00",
  "description": "How to examples on using uniq, a UNIX tool for reporting or filtering repeated lines in a file",
  "tags": [
    "UNIX"
  ]
}

## Uniq expects adjacent lines

The `uniq` commands expects adjacent lines in inputs. If you are looking to find unique occurrences where the lines are not adjacent you will need to sort the lines before passing to `uniq`. `uniq` will operate as expected on the following file that is named `authors.txt`.

    Chaucer
    Chaucer
    Orwell
    Larkin
    Larkin

This is because the duplicates are adjacent.
  
    uniq authors.txt
    Chaucer
    Orwell
    Larkin

Let us suppose that the duplicates in the file are not adjacent. 

    Chaucer
    Larkin
    Orwell
    Chaucer
    Larkin

If we ask `uniq` to operate on this file it will simply return the contents of the file. Where files are not already sorted the `sort` command can be used to sort the file first before piping to `uniq`. An article outlining the usage of `sort` is [available here][4].

    sort authors.txt | uniq
    Chaucer
    Orwell
    Larkin

## How to show a count of the number of times a line occurred

To output the number of occurrences of a line use the `-c` flag in conjunction with `uniq`. This prepends a number value to the output of each line. 

    uniq -c authors.txt
    2 Chaucer
    2 Larkin
    1 Orwell

## How to only show repeated lines

To only show repeated lines use the `-d` flag. This will output only lines that occur more than once.

    uniq -d authors.txt
    Chaucer 
    Larkin

## How to only show lines that are not repeated

To only show lines that are not repeated use the `-u` flag. This will output only lines that are not repeated.

    uniq -u authors.txt
    Orwell

## How to ignore characters in comparison

Let us suppose we have the `authors.txt` file has some numbers in front of the list of authors.

    1Chaucer
    2Chaucer
    3Larkin
    4Larkin
    5Orwell

We can ignore these numbers using the `-s` flag that will skip the number of characters it is given before doing the comparison.

    uniq -s 1 authors.txt
    1Chaucer
    3Larkin
    5Orwell

Note that the first occurrence is taken and the line is printed out as is. You could easily clean up the output by piping to something like `sed`.

    uniq -s 1 compare.txt | sed s/^.//
    Chaucer
    Larkin
    Orwell

## How to ignore fields in comparison

Given the following file saved as `cricketers.txt` we wish to sort it not based on the line as a whole but on the occurrence of a field. 

    Tom Westley Essex
    Ravi Bopara Essex
    Marcus Trescothick Somerset
    Joe Root Yorkshire
    Jonny Bairstow Yorkshire

A field is considered as a string of non-blank characters separated from adjacent fields by blanks. We want to group by the county that these cricketers play for.

    uniq -f 2 cricketers.txt
    Tom Westley Essex
    Marcus Trescothick Somerset
    Joe Root Yorkshire
    
As with the `-s` flag the tool outputs the first occurrence it finds. It is possible to combine with the `-c` flag to output a count.

    uniq -f -2 cricketers.txt
    2 Tom Westley Essex
    1 Marcus Trescothick Somerset
    2 Joe Root Yorkshire

If we wanted to just see the list of counties we can clean this up. 

    uniq -f 2 -c cricketers.txt | sed 's/^\s*//' | cut -d ' ' -f 1,4
    2 Essex
    1 Somerset
    2 Yorkshire

## Further reading

* [uniq man page][1]
* [7 Linux Uniq Command Examples to Remove Duplicate Lines from File][2]
* [Linux and Unix uniq command help and examples][3]
* [Linux and Unix uniq command tutorial with examples][4]

[1]: http://linu.die.net/man/1/uniq
[2]: http://www.thegeekstuff.com/2013/05/uniq-command-examples
[3]: http://www.computerhope.com/unix/uuniq.htm
[4]: https://shapeshed.com/unix-sort/

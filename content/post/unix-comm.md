{
  "slug": "unix-comm",
  "title": "Linux and Unix comm command tutorial with examples",
  "date": "2016-08-10T00:00:00+00:00",
  "image": "images/articles/comm.png",
  "description": "Tutorial on using comm, a UNIX and Linux command for comparing two sorted files line by line. Examples of showing specific comparisons and ignoring case sensitivity.",
  "tags": [
    "UNIX",
    "Linux"
  ]
}

![comm man page][1]

## What is the comm command in UNIX?

The `comm` command compares two sorted files line by line and writes three columns to standard output. These columns show lines that are unique to files one, lines that are unique to file two and lines that are shared by both files. It also supports suppressing column outputs and comparing lines without case sensitivity.


## How to compare the compare two files line by line

To compare two files line by line using `comm` it is a prerequisite that files are first sorted. For this example we will be comparing two files with numbers in that are saved as `set1.txt` and `set2.txt`. The following is the contents of `set1.txt`.

    1
    2
    3

The following is the contents of `set2.txt`.

    8
    3 
    2

As theses files are not sorted [sort][3] can be used to accomplish this

    comm <(sort set1.txt) <(sort set2.txt)
    1
                    2
                    3
            8

The output is in three columns. The first is lines that are only in file one (`set1.txt`), the second is lines only in file two (`set2.txt`), the third is line that are in both files.

## How to show specific comparisons 

To show specific comparisons using `comm` pass the option of the column that should be suppressed. In the following example only column three, or the lines that are common to both files are shown. 

    comm -12 <(sort set1.txt) <(sort set2.txt)
    2
    3

The following example shows lines that are unique to `set1.txt`.
    
    comm -23 <(sort set1.txt) <(sort set2.txt)
    1

The following example shows lines that are unique to `set2.txt`.

    comm -23 <(sort set1.txt) <(sort set2.txt)
    8

## How to ignore case sensitivity 

To ignore case sensitivity when using `comm` pass the `-i` option. This will ignore case sensitivity in the comparison. Consider the two following files that have been sorted.

    cat words1.txt
    Apple
    Banana
    Orange

    cat words2.txt
    apple
    banana
    orange

If these files are compared using `comm` there will be nothing common to these two files.

    comm words comm words1.txt words2.txt
    Apple
    Banana
    Orange
            apple
            banana
            orange

If case sensitivity is ignore with `-i` option the words will be shown as common to both files. Note that the uppercase words is shown as it is from the first file.

    comm -i words1.txt words2.txt
                Apple
                Banana
                Orange

## Further reading

* [comm man page][2]
* [comm - The beautiful comparison][4]
* [comm Wikipedia page][5]


[1]: /images/articles/comm.png
[2]: http://linux.die.net/man/1/comm
[3]: /unix-sort/
[4]: http://www.theunixschool.com/2011/03/comm-beautiful-comparison.html
[5]: https://en.wikipedia.org/wiki/Comm

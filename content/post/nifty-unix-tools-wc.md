{
  "layout": "post",
  "slug": "nifty-unix-tools-wc",
  "title": "Nifty Unix Tools - wc",
  "date": "2011-03-19T00:00:00+00:00",
  "description": "Word Count (wc) is a great tool to quickly give information on text files and becomes very powerful when piped with other commands",
  "tags": [
    "Unix"
  ]
}

## Word Count

Text files have lots of statitics that can be really useful when you want to extract information from them. With the word count tool it is possible to access

* The number of bytes
* The number of lines
* The number of characters
* The number of words

    wc /usr/share/dict/words

This gives us

    234936  234936 2486813 /usr/share/dict/words 

The output is \[number of lines\] \[number of words\] \[number of bytes\] \[filename\].

We can access each of these statistics individually by passing an option to the command.

    # The number of bytes
    wc -c /usr/share/dict/words
    # The number of lines
    wc -l /usr/share/dict/words
    # The number of words
    wc -w /usr/share/dict/words

## Piping is powerful

The wc command really starts to become useful when it is piped to other commands. Here's an example we have 5 csv files that are full of data. We want to find out a sum of how many records there are in all five files. We can do this easily by piping the output of the [cat][2] command to wc.

    cat *.csv | wc -l 
    1866

Done - we have 1866 records across the 5 files.

Another example might be looking for the number of occurences of a word or pattern in a file. We can combine [grep][3] with wc to achieve this.

    grep "union" /usr/share/dict/words | wc -l
    41

wc is a really useful tool for summing up results and gathering information on text files or streams.

## Further reading

* [wc man page][1]
* [The Linux wc command (word count)][4]
* [Software Carpentry - Shell Basics][5]
* [cat man page][2]
* [grep man page][2]

[1]: http://linux.die.net/man/1/wc
[2]: http://linux.die.net/man/1/cat
[3]: http://linux.die.net/man/1/grep
[4]: http://www.devdaily.com/unix/edu/examples/wc.shtml
[5]: http://showmedo.com/videotutorials/video?name=940050&fromSeriesID=94

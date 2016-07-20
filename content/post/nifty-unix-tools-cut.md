{
  "title": "Nifty UNIX Tools - Cut",
  "slug": "nifty-unix-tools-cut",
  "date": "2016-07-19T18:16:59+01:00",
  "description": "Cut is a simple tool that can cut select portions of a line based on bytes, charaters and delimiters",
  "tags": [
    "UNIX"
  ]
}

## Cutting selecting portions of a line

The `cut` command is a simple utility for cutting parts of a line. It reads from standard input and outputs to standard output.

It supports cutting byte postions, character positions, a delimiter and a list of fields. It can be used to quickly manipulate text streams and can become a powerful utility. 

## Cutting byte positions 

`cut` can pull out individual bytes from an input stream.

    echo 'baz' | cut -b 2
    a
    echo 'baz' | cut -b 1-2
    ba
    echo 'baz' | cut -b 1,3
    bz

## Cutting character positions

If you input stream is character based you are better off using the character option as characters can be more than one byte. This character '♣' for example is three bytes. 

    echo '♣foobar' | cut -c 1,6
    ♣a
    echo '♣foobar' | cut -c 1-3
    ♣fo

## Cutting based on a delimiter

A common use for this is to cut values out of a CSV file. Consider we have the following file as `names.csv`.

    John,Smith,34,London
    Arthur,Evans,21,Newport
    George,Jones,32,Truro

We can set the delimiter to be the comma with `-d ','` and then ask `cut` to pull out the fields we are interested in with the `-f` flag.

    cut -d ',' -f 1 names.csv
    John
    Arthur  
    George

This can be useful for pulling out the fields you are interested in and then perhaps piping to another command. 

    cut -d ',' -f 1,4 names.csv
    John,London
    Arthur,Newport
    George,Truro

## Conclusion

`cut` is a limited tool but it does one thing and does it well. Particular for working with files formats like CSV it allows you to simply pull out bits of data you are interested in and pipe them to another command or write them to a file. 



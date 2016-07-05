{
  "layout": "post",
  "slug": "nifty-unix-tools-tr",
  "title": "Nifty Unix Tools - tr",
  "date": "2010-07-23T00:00:00+01:00",
  "description": "tr is a simple but effective tool for translating or deleting characters in a string",
  "tags": [
    "Unix"
  ]
}

## tr - a simple translation tool

I'm an unashamed command line <del>kid</del> old git. For getting things done quickly and efficiently there are a wealth of tools at your fingertips. tr is just one of those tools. It lets you quickly and simply translate characters in a string. 

It doesn't have the power of other tools like [sed][1] or [awk][2] but for basic string manipulation it is pretty good. One example would be that we want to change uppercase text to lower case

    echo 'HI THERE' |  tr '[:upper:]' '[:lower:]'
    hi there

Or we might have a comma separated list that we want to strip the commas out of and to replace them with a new line 

    cat file.csv | tr ',' '\n' > new.txt

This translates each comma to a new line so 'dog, cat, horse' becomes

    dog<br />
    cat<br />
    horse

## Deleting characters

tr also lets you delete characters. So if you need to quickly clean up a string you can do:

    echo 'clean$ me$ $up$ please$' | tr -d '$'
    clean me up please

Because Unix lets you pipe the output we can write this to a file easily

    echo 'clean$ me$ $up$ please$' | tr -d '$' > file.txt

We could also read in a big file, pipe it to the tr command and then send the output to another file

    cat big_file.txt | tr -d '$' > clean_file.txt

## More complex uses

You can pipe replacements together for more complex translations. Let's say someone sends you a file with spaces in it. You want to remove the spaces and whilst you are at it make the filename lowercase. 

    mv Crap\ File\ nAme.txt `echo Crap\ File\ nAme.txt | tr -d '\' | tr ' ' '_' | tr '[:upper:]' '[:lower:]'`

This will rename 'Crap File nAme.txt' to 'crap\_file\_name.txt'

These little commands are really useful. If you find yourself doing the same thing over and over again you can save it to an executable script. I regularly get clients sending me documents for the web with spaces in. So I use [this script][3] to quickly lowercase the filenames and clean up. This lets me run clean\_filenames.sh in any directory and the filenames will be cleaned up. If you put your scripts in your bin folder and make them executable they'll be available via tab completion too. So you can just type 'clean\_' hit tab, then return and you are done. 

tr is a simple tool that can't compete with the power of sed or awk but there are times when using a more heavyweight is unnecessary. 

For more run 'man tr' from the command line. 

[1]: http://unixhelp.ed.ac.uk/CGI/man-cgi?sed
[2]: http://unixhelp.ed.ac.uk/CGI/man-cgi?awk
[3]: http://github.com/shapeshed/dotfiles/blob/master/bin/clean_filenames.sh

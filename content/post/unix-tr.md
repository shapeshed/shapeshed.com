{
  "slug": "unix-tr",
  "title": "Linux and Unix tr command tutorial with examples",
  "date": "2010-07-23T00:00:00+01:00",
  "image": "images/articles/tr.png",
  "description": "A series of how to examples on using tr, a UNIX tool for translating or deleting characters",
  "tags": [
    "UNIX"
  ]
}

![tr man page](https://shapeshed.com/images/articles/tr.png)

## What is the tr command in UNIX?

The `tr` command in UNIX is a command line utility for translating or deleting characters. It supports a range of transformations including uppercase to lowercase, squeezing repeating characters, deleting specific characters and basic find and replace. It can be used with UNIX pipes to support more complex translation.

## How to convert lower case to upper case

To convert from lower case to upper case the predefined sets in `tr` can be used. The `[:lower:]` set will match any lower case character. The `[:upper:]` set matches any uppercase character. To convert from lower to upper these can be used to translate a string.

    echo uppercaseme | tr '[:lower:]' '[:upper:]'
    UPPERCASEME

## How to search for a compliment of a pattern

To search for a compliment of a pattern use the `-c` option. Searching for a compliment means searching for the _inverse_ of the set specified. In the following example any character that is not ‘a’ is matched and translated to ‘z’.

    echo abcdefghijklmnop | tr -c 'a' 'z'
    azzzzzzzzzzzzzzzz

Searching for a compliment pattern can effectively be used to pull out patterns from text. In the following example the `-c` option is combined with the `-d` delete option to extract a phone number.

    echo 'Phone: 01234 567890' | tr -cd '[:digit:]'
    01234567890

## How to delete specific characters

To delete specific characters use the `-d` option. This option deletes characters in the first set specified. The following example removes any occurrence of ‘up’.

    echo 'clean this up' | tr -d 'up'
    clean this

Note that the `tr` is relatively crude. For more complex patterns `sed` is a better option.

## How to squeeze repeating characters

To squeeze repeat occurrences of characters specified in a set use the `-s` option. This removes repeated instances of a character. In the following example a string with too many spaces is squeezed to remove them.

    echo 'too    many    spaces  here' | tr -s '[:space:]'
    too many spaces here

## How to truncate a search pattern

To truncate the first set to the second set use the `-t` option. By default `tr` will repeat the last character of the second set if the first and second sets are different lengths. Consider the following example.

    echo 'the cat in the hat' | tr 'abcdefgh' '123'
    t33 31t in t33 31t

The last character of the second set is repeat to match any letter from c-h. Using the truncate option limits the matching to the length of the second set.

    echo 'the cat in the hat' | tr -t 'abcdefgh' '123'
    the 31t in the h1t

Note that this option is not available on the BSD version of `tr`.

## How to find and replace

The `tr` tool works well for simple find and replace operations where one character should be replaced with another. The following example replaces underscores with spaces.

    echo "some_url_that_I_have" | tr "_" "-"
    some-url-that-I-have

For more complex find and replace operations a tool like `sed` is recommended.

## How to build translate pipelines

The `tr` can be combined with pipes to build a translation pipeline. In the following example `tr` is used to clean a file named ‘Bad File nAme.txt’. This removes backslashes, converts spaces to underscores and converts uppercase to lowercase.

    echo Bad\ File\ nAme.txt | tr -d '\' | tr ' ' '_' | tr '[:upper:]' '[:lower:]'

## Further reading

*   [tr man page](http://linux.die.net/man/1/tr)
*   [8 Linux TR Command Examples](http://www.thegeekstuff.com/2012/12/linux-tr-command/)
*   [Understanding Linux/UNIX tr command](http://www.cyberciti.biz/faq/how-to-use-linux-unix-tr-command/)
*   [Howto guide for using the “tr” command](http://landoflinux.com/linux_translate_command.html)

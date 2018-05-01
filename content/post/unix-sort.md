{
  "slug": "unix-sort",
  "title": "Linux and Unix sort command tutorial with examples",
  "date": "2011-03-21T00:00:00+00:00",
  "lastmod": "2016-07-26T00:00:00+00:00",
  "image": "images/articles/sort.png",
  "description": "Tutorial on using sort, a UNIX and Linux command for sorting lines of text files. Examples of alphabetical sorting, reverse order sorting, sorting by number and mixed case sorting.",
  "tags": [
    "UNIX",
    "Linux"
  ]
}

![Terminal showing sort man page][7]

## What is the sort command?

The `sort` command is a command line utility for sorting lines of text files. It supports sorting alphabetically, in reverse order, by number, by month and can also remove duplicates. The sort command can also sort by items not at the beginning of the line, ignore case sensitivity and return whether a file is sorted or not. 

## How to sort alphabetically

The `sort` tool will sort lines alphabetically by default. Running `sort filename` writes the contents of the `filename` in alphabetical order to standard output. 

Suppose a file exists with the following list of metal bands that needs to be sorted in alphabetical order. The file is saved as `bands.txt`.

    Motörhead
    ACDC
    Sepultura
    Carcass
    Opeth

The `sort` command allows us to sort the file alphabetically.

    sort bands.txt
    ACDC
    Carcass
    Motörhead
    Opeth
    Sepultura

## How to sort in reverse order

To sort in reverse order pass the `-r` option to `sort`. This will sort in reverse order and write the result to standard output. 

Using the same list of metal bands from the previous example this file can be sorted in reverse order with the `-r` option.

    sort -r bands.txt
    Sepultura
    Opeth
    Motörhead
    Carcass
    ACDC

## How to sort by number

To sort by number pass the `-n` option to `sort`. This will sort from lowest number to highest number and write the result to standard output.

Suppose a file exists with a list of items of clothing that has a number at the start of the line and needs to be sorted numerically. The file is saved as `clothes.txt`.

    3. Brown shoes
    5. Blue tie
    1. White shirt
    11. Jeans
    4. Underpants

By passing `sort` the `-n` option the file is ordered numerically.

    sort -n clothes.txt
    1. White shirt
    3. Brown shoes
    4. Underpants
    5. Blue tie
    11. Jeans

## How to sort mixed-case text 

To sort mixed-case text pass the `-f` option to `sort`. This will ignore case sensitivity when sorting and write the result to standard output.

If a file has uppercase and lowercase content `sort` will order uppercase first. Suppose a file exists with a list of names in a file called `names.txt`.

    Sam
    sally
    Sarah
    steven

By default the `sort` tool will sort uppercase characters first.

    sort names.txt
    Sam
    Sarah
    sally
    steven

To sort and ignore case use the `-f` option.

    sort -f names.txt
    sally
    Sam
    Sarah
    steven

## How to check if a file is already sorted

To check if a file is already sorted pass the `-c` option to `sort`. This will write to standard output if there are lines that are out of order.

Suppose a file exists with a list of cars called `cars.txt`.

    Audi
    Cadillac
    BMW
    Dodge 

The `sort` tool can be used to understand if this file is sorted and which lines are out of order.
  
    sort -c cars.txt
    sort: cars.txt:3: disorder: BMW

If there is no output then the file is considered to be already sorted. 

## How to sort and remove duplicates

To sort and remove duplicates pass the `-u` option to `sort`. This will write a sorted list to standard output and remove duplicates.

Suppose a file exists with a list of breakfast cereals to sort. This file contains a number of duplicates. This is saved in the file `breakfast.txt`.

    Cornflakes
    Sultana Bran
    Weetabix
    Sultana Bran
    Cornflakes
    Shredded Wheat
    Cherrios
    Weetabix

By using the `-u` option this file can be sorted and stripped of duplicates.

    sort -u breakfast.txt
    Cherrios
    Cornflakes
    Shredded Wheat
    Sultana Bran
    Weetabix

## How to sort by month

To sort by month pass the `-M` option to `sort`. This will write a sorted list to standard output ordered by month name.

Suppose the following file exists and is saved as `months.txt`.

    February
    January
    March
    August
    September

Using The `-M` option with `sort` allows us to order this file.
  
    sort -M months.txt
    January
    February
    March
    August
    September

## How to sort by items not at the beginning of the line

To sort by items not at the beginning of the line pass the `-k` option to `sort` along with a number of value of the field to sort on. This will write the result to standard output.

Suppose a file exists with a list of orders that is saved as `orders.txt`.

    1023 AcmeCo "Bouncey Castle"
    1003 FooCo "Fluffy Toy"
    1013 AcmeCo "Edible Hat"
    1042 FooCo "Whoopie Cushion"

The file needs to be sorted by the name of the company that placed them. By using the `-k` option and passing it a number of the key this can be achieved.

    sort -k 2 orders.txt
    1023 AcmeCo "Bouncey Castle"
    1013 AcmeCo "Edible Hat"
    1003 FooCo "Fluffy Toy"
    1042 FooCo "Whoopie Cushion"

## How to sort a CSV file

To sort by a delimiter pass the `-t` option to `sort` along with the delimiter value. For a CSV file this would be `,`. This can be combined with the `-k` option to sort on fields within a CSV. The result will be written to standard output.

Suppose a file exists with a list of cheeses that is saved as `cheeses.csv`.

    2,Maroilles,1.13
    3,Stinking Bishop,1.65
    1,Brie de Meaux,1.99
    4,Munster,1.29

The file may be sorted by the name of the cheese using a combination of the `-k` and `-t` options.

    sort -k 2 -t , cheese.csv
    2,Maroilles,1.13
    3,Stinking Bishop,1.65
    1,Brie de Meaux,1.99
    4,Munster,1.29

To sort on the most expensive cheese the numeric and reverse options can be used.

    sort -k 3 -t , -n -r  cheese.csv
    1,Brie de Meaux,1.99
    3,Stinking Bishop,1.65
    4,Munster,1.29
    2,Maroilles,1.13
    

## Further reading

* [sort man page][1]
* [Unix sort command][2]
* [Linux and Unix sort command help and examples][3]
* [sort Wikipedia Entry][4]
* [15 examples of sort command in Linux][5]
* [Linux sort command examples][6]

[1]: http://linux.die.net/man/1/sort
[2]: http://www.softpanorama.org/Tools/sort.shtml
[3]: http://www.computerhope.com/unix/usort.htm
[4]: https://en.wikipedia.org/wiki/Sort_(Unix)
[5]: http://www.theunixschool.com/2012/08/linux-sort-command-examples.html
[6]: http://alvinalexander.com/unix/edu/examples/sort.shtml
[7]: /images/articles/sort.png "Linux and Unix sort command"

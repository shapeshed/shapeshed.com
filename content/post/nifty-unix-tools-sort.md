{
  "slug": "unix-sort",
  "title": "Linux and Unix Sort command tutorial with examples",
  "date": "2011-03-21T00:00:00+00:00",
  "lastmod": "2016-07-26T00:00:00+00:00",
  "description": "A series of how to examples on using sort, a UNIX tool for sorting lines of text files",
  "tags": [
    "UNIX"
  ]
}

## How to sort alphabetically

Let us suppose that we have a file with the following list of metal bands that we want to sort in alphabetical order. The file is saved as `bands.txt`.

    Motörhead
    ACDC
    Sepultura
    Carcass
    Opeth

The `sort` command allows us to sort these alphabetically.

    sort bands.txt
    ACDC
    Carcass
    Motörhead
    Opeth
    Sepultura

## How to sort in reverse order

If you want to sort in reverse order you can pass the `-r` flag. Using the same list of metal bands from the previous example here is a demonstration.

    sort -r bands.txt
    Sepultura
    Opeth
    Motörhead
    Carcass
    ACDC

## How to sort by number

Let us suppose that you have a file with a list of items of clothing that has a number at the start of the line and you want to sort these numerically. The file is saved as `clothes.txt`.

    3. Brown shoes
    5. Blue tie
    1. White shirt
    11. Jeans
    4. Underpants

By passing `sort` the `-n` flag we can order these numerically.

    sort -n clothes.txt
    1. White shirt
    3. Brown shoes
    4. Underpants
    5. Blue tie
    11. Jeans

## How to sort mixed-case text 

If your text has uppercase and lowercase content by default sort will order uppercase first. Let us suppose we have the following list of names in a file called `names.txt`.

    Sam
    sally
    Sarah
    steven

By default the sort tool will sort uppercase characters first

    sort names.txt
    Sam
    Sarah
    sally
    steven

To sort and ignore case use the `-f` flag.

    sort -f names.txt
    sally
    Sam
    Sarah
    steven

## How to check if a file is already sorted

If you looking to see if a file is already sorted you can use sort with the `-c` flag. Let us suppose we have the following file called `cars.txt`.

    Audi
    Cadillac
    BMW
    Dodge 

The sort tool can tell us if this file is sorted and which lines are out of order.
  
    sort -c cars.txt
    sort: cars.txt:3: disorder: BMW

If there is no output then the file is considered to be already sorted. 

## How to sort and remove duplicates

Sort allows you to remove duplicates when sorting using the `-u` flag. Let us suppose that we have a list of breakfast cereals to sort that contains a number of duplicates. This is saved in the file `breakfast.txt`.

    Cornflakes
    Sultana Bran
    Weetabix
    Sultana Bran
    Cornflakes
    Shredded Wheat
    Cherrios
    Weetabix

By using the `-u` flag this file can be sorted and stripped of duplicates.

    sort -u breakfast.txt
    Cherrios
    Cornflakes
    Shredded Wheat
    Sultana Bran
    Weetabix

## How to sort by month

Sort has the ability to order lines that start with a month. Suppose we have the following file called `months.txt`.

    February
    January
    March
    August
    September

Using The `-M` flag with sort allows us to order this file.
  
    sort -M months.txt
    January
    February
    March
    August
    September

## How to sort by items not at the beginning of the line

Sometimes you may have data that you want to sort where the data point you want to sort on is not at the beginning of the line. Consider this file of orders that is saved as `orders.txt`.

    1023 AcmeCo "Bouncey Castle"
    1003 FooCo "Fluffy Toy"
    1013 AcmeCo "Edible Hat"
    1042 FooCo "Whoopie Cushion"

We want to sort so that we can see orders by the company that placed them. We can use the `-k` flag to sort by key and pass it a number to say which key we want to use.

    sort -k 2 orders.txt
    1023 AcmeCo "Bouncey Castle"
    1013 AcmeCo "Edible Hat"
    1003 FooCo "Fluffy Toy"
    1042 FooCo "Whoopie Cushion"

## How to sort a CSV file

A common use of `sort` is to sort a CSV file. The `sort` command can support sorting on a particular filed using `-k` as above and you can combine this with the `-t` flag to denote the field separator. For a CSV file this would be a comma. Let us suppose we have thea file with a list of cheeses in it that we have saved as `cheeses.csv`.

    2,Maroilles,1.13
    3,Stinking Bishop,1.65
    1,Brie de Meaux,1.99
    4,Munster,1.29

We can sort this file based on the name of the cheese as follows.

    sort -k 2 -t , cheese.csv
    2,Maroilles,1.13
    3,Stinking Bishop,1.65
    1,Brie de Meaux,1.99
    4,Munster,1.29

If we wanted to sort on the most expensive we can also use the numeric and reverse flags that were explained earlier.

    sort -k 3 -t , -n -r  cheese.csv
    2,Maroilles,1.13
    3,Stinking Bishop,1.65
    1,Brie de Meaux,1.99
    4,Munster,1.29

## Further reading

* [sort man page][1]
* [Unix sort command][2]
* [Linux and Unix sort command help and examples][3]
* [sort Wikipedia Entry][4]
* [15 examples of sort command in Linux][5]
* [Linux sort command examples][6]

[1]: http://linu.die.net/man/1/sort
[2]: http://www.softpanorama.org/Tools/sort.shtml
[3]: http://www.computerhope.com/unix/usort.htm
[4]: https://en.wikipedia.org/wiki/Sort_(Unix)
[5]: http://www.theunixschool.com/2012/08/linux-sort-command-examples.html
[6]: http://alvinalexander.com/unix/edu/examples/sort.shtml

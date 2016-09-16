{
  "slug": "unix-join",
  "title": "Linux and Unix join command tutorial with examples",
  "date": "2016-08-10T00:00:00+00:00",
  "description": "A series of how to examples on using join, a UNIX tool to join lines of two files on a common field.",
  "image": "images/articles/join.png",
  "tags": [
    "UNIX"
  ]
}

![join man page](/images/articles/join.png)

## What is the join command in UNIX?

The `join` command in UNIX is a command line utility for joining lines of two files on a common field. It can be used to join two files by selecting fields within the line and joining the files on them. The result is written to standard output.

## How to join two files

To join two files using the `join` command files must have identical join fields. The default join field is the first field delimited by blanks. For the following example there are two files `foodtypes.txt` and `foods.txt`.
  
    cat foodtypes.txt
    1 Protein
    2 Carbohydrate
    3 Fat

    cat foods.txt
    1 Cheese 
    2 Potato
    3 Butter

These files share a join field as the first field and can be joined. 

    join foodtypes foods.txt
    1 Protein Cheese
    2 Carbohydrate Potato
    3 Fat Butter

## How to join two files on different fields

To join files using different fields the `-1` and `-2` options can be passed to `join`. In the following example there are two files `wine.txt` and `reviews.txt`.

    cat wine.txt
    Red Beaunes France
    White Reisling Germany
    Red Riocha Spain

    cat reviews.txt
    Beaunes Great!
    Reisling Terrible!
    Riocha Meh
    
These files can be joined by specifying the fields that should be used to join the files. Common to both files is the name of the wine. In `wine.txt` this is the second field. In `reviews.txt` this is the first field. The files can be joined using `-1` and `-2` by specifying these fields.
    
    join -1 2 -2 1 wine.txt reviews.txt
    Beaunes Red France Great!
    Reisling White Germany Terrible!
    Riocha Red Spain Meh

## How to sort before joining

Join expects that files will be sorted before joining. For this example suppose there are two files from the previous example are not sorted.

    cat wine.txt
    White Reisling Germany
    Red Riocha Spain
    Red Beaunes France

    cat reviews.txt
    Riocha Meh
    Beaunes Great!
    Reisling Terrible!

Running `join` on these files results in an error becuase the files are not sorted.

    gjoin -1 2 -2 1 wine.txt reviews.txt
    join: wine.txt:3: is not sorted: Red Beaunes France
    join: reviews.txt:2: is not sorted: Beaunes Great!
    Riocha Red Spain Meh
    Beaunes Red France Great!

The [sort][1] command can sort the files before passing to join.


    join -1 2 -2 1 <(sort -k 2 wine.txt) <(sort reviews.txt)
    Beaunes Red France Great!
    Reisling White Germany Terrible!
    Riocha Red Spain Meh
   
## How to specify a field separator for joining

To specify a field separator for joining using the `join` command use the `-t` option. An example is a CSV file where the separator is `,`. In the following example there are two files `names.csv` and `deposits.csv`.

    cat names.csv
    1,John Smith,London
    2,Arthur Dent, Newcastle
    3,Sophie Smith,London

    cat transactions.csv
    £1234,Deposit,John Smith
    £4534,Withdrawal,Arthur Dent
    £4675,Deposit,Sophie Smith

Using the `-t` option the comma can set as the delimiter. 

    join -1 2 -2 3 -t , names.csv transactions.csv
    John Smith,1,London,£1234,Deposit
    Arthur Dent,2, Newcastle,£4534,Withdrawal
    Sophie Smith,3,London,£4675,Deposit

## How to specify the output format

To specify the output format of join use the `-o` option. This allows the order of fields that will be shown in the output to be defined, or for only certain fields to be shown. 

In the previous example the output we as follows.

    John Smith,1,London,£1234,Deposit
To specify the order the list of fields are passed to `-o`. For this example this is ` -o 1.1,1.2,1.3,2.2,2.1`. This formats the output in the order desired.

    join -1 2 -2 3 -t , -o 1.1,1.2,1.3,2.2,2.1 names.csv transactions.csv
    1,John Smith,London,Deposit,£1234
    2,Arthur Dent, Newcastle,Withdrawal,£4534
    3,Sophie Smith,London,Deposit,£4675

## Further reading

* [join man page](http://linux.die.net/man/1/join)
* [Examples of the unix join command](http://www.albany.edu/~ig4895/join.htm)
* [The UNIX School: join command](http://www.theunixschool.com/2012/01/join-command.html)

[1]: /unix-sort/

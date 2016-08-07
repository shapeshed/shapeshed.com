{
  "slug": "jq-json",
  "title": "JSON on the command line with jq",
  "date": "2016-08-05T00:00:00+00:00",
  "image": "images/articles/jq.png",
  "description": "A series of how to examples on using jq, a command-line JSON processor",
  "tags": [
    "UNIX"
  ]
}

![jq - JSON formatting tool][6]

`jq` is a fantastic command-line JSON processor. It plays nice with UNIX pipes and offers extensive functionality for interrogating, manipulating and working with JSON file. 

## How to pretty print JSON

`jq` can do a lot but probably the highest frequency use for most users is to pretty print JSON either from a file or after a network call. Suppose that we have a file `names.json` containing the following json.

    [{"id": 1, "name": "Arthur", "age": "21"},{"id": 2, "name": "Richard", "age": "32"}]

`jq` can pretty print this file using the `.` filter. This takes the entire input and sends it to standard output. Unless told not to `jq` will pretty print making JSON readable. 


    jq '.' file.json
    [
      {
        "id": 1,
        "name": "Arthur",
        "age": "21"
      },
      {
        "id": 2,
        "name": "Richard",
        "age": "32"
      }
    ]

## How to use pipes with jq

Because `jq` is UNIX friendly it is possible to pipe data in and out of it. This can be useful for using jq as a filter or interacting with other tools. In the following pipeline `cat` pipes the file into `jq` and this is piped onto `less`. This can be very useful for viewing large JSON files.

    cat file.json | jq '.' | less

## How to find a key and value

To find a key and value `jq` can filter based on keys and return the value. Suppose we have the following simple JSON document saved as `dog.json`.

    {
      "name": "Buster",
      "breed": "Golden Retriever",
      "age": "4",
      "owner": {
        "name": "Sally"
      },
      "likes": [
        "bones",
        "balls",
        "dog biscuits"
      ]
    }

`jq` can retrieve values from this document by passing key names. Multiple keys can by passed separated by commas. 
    
    jq '.name'
    [
      "Buster"
      jq '.breed,.age'
      "Golden Retriever",
      "4" 
    ]

To search for nested objects chain values using the dot operator just as you would in JavaScript.
  
    jq '.owner.name'
    "Sally"

## How to find items in an array

To search for items in arrays use bracket syntax with the index starting at 0.

    jq '.likes[0]'
    "bones"

Multiple elements of an array may also be returned.

    echo '["a","b","c","d","e"]' | jq '.[2:4]'
    [
      "c",
      "d"
    ]

## How to combine filters

`jq` can combine filters to search within a selection. For the following JSON document suppose that the names need to be filtered. 

    [
      {
        "id": 1,
        "name": "Arthur",
        "age": "21"
      },
      {
        "id": 2,
        "name": "Richard",
        "age": "32"
      }
    ]

This can be achieved with a pipe with the `jq` filter.

    jq '.[] | .name' names.json
    "Arthur"
    "Richard"

## How to transform JSON

`jq` can be used for more than just reading values from a JSON object. It can also transform JSON into new data structures. Returning to the `dog.json` example earlier a new array can be created containing the name and likes as follows.

    jq '[.name, .likes[]]' dog.json
    "Buster",
    "Bones",
    "balls",
    "dog biscuits"

This can be very useful in data transform pipelines to shift JSON data from one structure to another. 

## How to transform data values within JSON

`jq` can also operate on data within JSON objects. Suppose the following JSON file exists and is saved as `inventory.json`.

    { "eggs": 2, "cheese": 1, "milk": 1 }

`jq` can be used to perform basic arithmetic on number values. 

    jq '.eggs + 1' inventory.json
    3

## How to remove keys from JSON

`jq` can remove keys from JSON objects. This outputs the JSON object without the deleted key. Suppose the following JSON is saved as `cheeses.json`.
  
    { "maroilles": "stinky", "goat": "mild" }

`jq` can remove keys as follows leaving just wonderful stinky cheese.

    jq 'del(.goat)' cheeses.json
    { "maroilles": "stinky" }
    
    
## How to map values

`jq` can map values and perform an operation on each one. In the following example each item in an array is mapped and has two subtracted.

    echo '[12,14,15]' | jq 'map(.-2)'
    [
      10,
      12,
      13
    ]

## How to wrangle JSON how you want

`jq` has many more advanced features to help manipulating and wrangling JSON however you want to. For more run `man jq`.

## Further reading

* [jq project page][1]
* [jq manual][5]
* [jq is sed for JSON][2]
* [bash that JSON (jq)][3]
* [Parsing JSON with jq][4]

[1]: https://stedolan.github.io/jq/
[2]: https://robots.thoughtbot.com/jq-is-sed-for-json
[3]: http://blog.librato.com/posts/jq-json
[4]: http://www.compciv.org/recipes/cli/jq-for-parsing-json/
[5]: https://stedolan.github.io/jq/manual/
[6]: https://shapeshed.com/images/articles/jq.png

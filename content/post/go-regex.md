{
  "slug": "golang-regex",
  "title": "Regular expressions in Go",
  "date": "2016-08-21T00:00:00+00:00",
  "description": "Series of how to examples on using the regexp standard library in Go. Includes string, string index, string submatch, string submatch index and replace examples.",
  "tags": [
    "Go"
  ]
}

## What is the regex package in Go?

The `regex` package is part of the Go standard library and implements regular expression search and pattern matching. The package implements the [RE2][1] syntax and is the same general syntax used by Perl and Python. It can operate on strings or bytes. 

## How to use a regular expression in Go

To use a regular expression in Go it must first be parsed and returned as a `Regexp` object. 

    r, err := regexp.Compile("^foo")
    if err != nil {
        log.Fatal(err)
    }

When using the `Compile` method if the regular expression is not parsed successfully an error is returned that needs to be handled. The `MustCompile` method is similar but panics if that parsing of the regex fails.

    // the compiler panics if this fails
    r := regexp.MustCompile("^foo")

Once the regular experession has been parsed and returned it can be used with the methods provided by the `regexp` package. The `regexp` package supports 


## How to find a string

To find a string use the `FindString` method. This returns the left most match of the regular expression. If nothing is found an empty string is returned. 

    package main

    import (
        "fmt"
        "regexp"
    )

    func main() {
        re := regexp.MustCompile("ck$")
        fmt.Println(re.FindString("hack"))
        fmt.Println(re.FindString("cricket"))
    }

Running this returns the following. [Run on Go Playground][2]

    ck


    Program exited.

## How to find a string index

To find a string index use the `FindStringIndex` method. This returns the left most match of the regular expression as a two-element slice. If nothing is found an nil value is returned. 

    package main

    import (
        "fmt"
        "regexp"
    )

    func main() {
        re := regexp.MustCompile("tel")
        fmt.Println(re.FindStringIndex("telephone"))
        fmt.Println(re.FindStringIndex("carpet"))
        fmt.Println(re.FindStringIndex("cartel"))
    }

Running this returns the following. [Run on Go Playground][3]

    [0 3]
    []
    [3 6]

    Program exited.

## How to find a string submatch

To find a string submatch use the `FindStringSubmatch` method. This returns the left most match of the regular expression and an of the submatches. If nothing is found an nil value is returned. 

    package main

    import (
        "fmt"
        "regexp"
    )

    func main() {
        re := regexp.MustCompile("h([a-z]+)king")
        fmt.Println(re.FindStringSubmatch("hacking hiking"))
        fmt.Println(re.FindStringSubmatch("licking"))
    }

Running this returns the following. [Run on Go Playground][4]

    [hacking ac]
    []

    Program exited.

## How to find a string submatch index

To find a string index use the `FindStringSubmatchIndex` method. This returns a slice of the index positions of a match and any substring match. If nothing is found an nil value is returned. 

    package main

    import (
        "fmt"
        "regexp"
    )

    func main() {
        re := regexp.MustCompile("h([a-z]+)king")
        fmt.Println(re.FindStringSubmatchIndex("hacking hiking"))
        fmt.Println(re.FindStringSubmatchIndex("licking"))
    }

Running this returns the following. [Run on Go Playground][5]

    [0 7 1 3]
    []

    Program exited.

## How to replace all occurrences of a string

To replace all occurrence of a string use the `ReplaceAllString` method. This returns a copy of of the original string with replacements made. If not match is found the original string is returned. 

    package main

    import (
        "fmt"
        "regexp"
    )

    func main() {
        re := regexp.MustCompile("ise")
        s := "ize"
        fmt.Println(re.ReplaceAllString("realise", s))
        fmt.Println(re.ReplaceAllString("organise", s))
        fmt.Println(re.ReplaceAllString("analyse", s))
    }


Running this returns the following. [Run on Go Playground][7]

    realize
    organize
    analyse

    Program exited.

    

## Example - scraping HTML

In the following example the `regexp` package is used to scrape the contents of `h3` tags from a page. The raw html is parsed against a regex to find the `h3` tags, then any HTML is stripped before being escaped and sent to standard output. 

    package main

    import (
        "fmt"
        "html"
        "io/ioutil"
        "net/http"
        "regexp"
    )

    func main() {
        resp, err := http.Get("https://petition.parliament.uk/petitions")
        if err != nil {
            fmt.Println("http get error.")
        }
        defer resp.Body.Close()
        body, err := ioutil.ReadAll(resp.Body)
        if err != nil {
            fmt.Println("http read error")
            return
        }

        src := string(body)

        r, _ := regexp.Compile("\\<h3\\>.*\\</h3\\>")
        rHTML, _ := regexp.Compile("<[^>]*>")
        titles := r.FindAllString(src, -1)

        for _, title := range titles {
            cleanTitle := rHTML.ReplaceAllString(title, "")
            fmt.Println(html.UnescapeString(cleanTitle))
        }

    }

This returns the contents of all `h3` tags on the page if you want to see what UK Citizens are petitioning their government about. 

    EU Referendum Rules triggering a 2nd EU Referendum
    Give the Meningitis B vaccine to ALL children, not just newborn babies.
    Block Donald J Trump from UK entry
    ...

Note that this can also be achieved with the [html parser][9] available in the Go supplementary network libraries.

    package main

    import (
        "fmt"
        "golang.org/x/net/html"
        "net/http"
    )

    func main() {
        resp, err := http.Get("https://petition.parliament.uk/petitions")
        if err != nil {
            fmt.Println("http get error.")
        }
        defer resp.Body.Close()
        doc, err := html.Parse(resp.Body)
        if err != nil {
            fmt.Println("http read error")
            return
        }

        var f func(*html.Node)
        f = func(n *html.Node) {
            if n.Type == html.ElementNode && n.Data == "h3" {
                fmt.Println(n.FirstChild.FirstChild.Data)
            }
            for c := n.FirstChild; c != nil; c = c.NextSibling {
                f(c)
            }
        }
        f(doc)

    }

## Further reading

* [Golang Regexp Package][8]

[1]: https://github.com/google/re2/wiki/Syntax
[2]: https://play.golang.org/p/brKyB7stpN
[3]: https://play.golang.org/p/28WarHRt7C
[4]: https://play.golang.org/p/3pZeF5hr9q
[5]: https://play.golang.org/p/1antu-HbON
[6]: https://play.golang.org/p/HIEg7u2r0I
[7]: https://play.golang.org/p/ahEcVeqs8b
[8]: https://golang.org/pkg/regexp/
[9]: https://godoc.org/golang.org/x/net/html

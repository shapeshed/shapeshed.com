{
  "slug": "copy-a-file-in-go",
  "title": "Copy a file in Go",
  "date": "2017-09-10T00:00:00+00:00",
  "description": "How to copy a file in Go. The ioutil package does not offer a shorthand way of copying a file. Instead the os package should be used.",
  "tags": [
    "Go"
  ]
}

## No shorthand method

The [`ioutil`][1] package offers some of the common operations needed when working with files but nothing for copying files. Go tries to keep things lightweight so as operations become more complex the [`os`][2] package should be used. The `os` package operates at a slightly lower level and as such expects that files are explicitly closed after opening them. Reading the source code of the `os` package shows that many of the functions in the `ioutil` package are wrappers around the `os` package and remove the requirements to explicitly close files. 

## Copying a file

To copy a file is therefore a case of glueing together a few functions from the `os` package. The process is 

* Open the file that should be copied 
* Read the contents
* Create and open the file that the contents should be copied into 
* Write to the new file
* Close both files

## Code example

The following shows an example of copying a file in Go.

    package main

    import (
      "io"
      "log"
      "os"
    )

    func main() {
      from, err := os.Open("./sourcefile.txt")
      if err != nil {
        log.Fatal(err)
      }
      defer from.Close()

      to, err := os.OpenFile("./sourcefile.copy.txt", os.O_RDWR|os.O_CREATE, 0666)
      if err != nil {
        log.Fatal(err)
      }
      defer to.Close()

      _, err = io.Copy(to, from)
      if err != nil {
        log.Fatal(err)
      }
    }

## Code example explaination

The code example can be explained as follows. 

* The `Open` function from the `os` module is used to read a file from disk.
* A defer statement is used to close the file once the script has finished all other execution.
* The `OpenFile` function is used to open a file. The first argument is the name of the file to be opened or created if it does not exist. The second argument represents the flags to be used on the file. In this case it is read and write and should be created if it does not exist. Finally the permissions on the file are set. 
* Another defer statement is used to close this file after other execution has finished. 
* The `Copy` function is then used from the `io` package. This copies from the source file and writes it to the destination. 

## Further reading

* [Golang ioutil package][1]
* [Golang io package][2]
* [Rejected merge request for a CopyFile function for ioutul][3]

[1]: https://golang.org/pkg/io/ioutil/
[2]: https://golang.org/pkg/os/
[3]: https://github.com/golang/go/issues/8868

{
  "title": "Getting started with Go",
  "date": "2014-03-14T14:26:38+00:00",
  "description": "Time to learn another language because I've got a restless brain. Next up Go.",
  "tags": [
    "Go"
  ]
}

## Installation

Go is simple to install. You can install it on a Mac with 

    brew install go

I'm on Arch Linux and go is available in the main repositories. [Packages][2] are available for most Linux distros and you can always [compile from source][3] if you want.

    pacman -S go

On Windows there is an [.msi installer][1].

After you've installed go you can get some help with 

    go help

## The inevitable Hello World

As with every programming language you'll want to run a hello world. Create a file 'hello-world.go' and add the code below.

    package main

    import "fmt"

    func main() {
      fmt.Println("Hello World")
    }

You can run the code with 

    go run hello-world.go

You can also build your hello world program into a binary

    go build hello-world

You can now run the compiled code with 

    ./hello-world

Now time to start learning!

[1]: https://code.google.com/p/go/downloads/list?q=OpSys-Windows+Type%3DInstaller
[2]: http://go-lang.cat-v.org/packages
[3]: http://golang.org/doc/install/source

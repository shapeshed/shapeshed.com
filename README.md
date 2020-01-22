# Source code for shapeshed.com

![ci](https://github.com/shapeshed/shapeshed.com/workflows/Continuous%20Integration/badge.svg)
![deployment](https://github.com/shapeshed/shapeshed.com/workflows/Deployment/badge.svg)

This is the source code for [shapeshed.com][1].

## Installation

The site uses [hugo][2]. Refer to [installation instructions][3] for Hugo. 

The theme used is [shapeshed-minimal][6]. To install it

    mkdir themes
    git clone git@github.com:shapeshed/shapeshed-minimal.git themes/shapeshed-minimal

## Site generation

Once Hugo is installed generate the site with

    hugo

You can also run a server if you'd like to view it in a browser

    hugo serve

## Development

For developing the site there is a further dependency of [minify][4]. The `Makefile` uses the [cli][5] version of the tools with binaries available for Windows, Linux and OSX.  

The Makefile assumes you are running on a modern Linux distribution (I use Arch) but really just wraps building and deployment so you will probably want to roll your own for that. 

## Deployment

To build and deploy the site 

    make build && make deploy

[1]: https://shapeshed.com
[2]: https://gohugo.io/
[3]: https://gohugo.io/overview/installing/
[4]: https://github.com/tdewolff/minify
[5]: https://github.com/tdewolff/minify/tree/master/cmd/minify 
[6]: https://github.com/shapeshed/shapeshed-minimal

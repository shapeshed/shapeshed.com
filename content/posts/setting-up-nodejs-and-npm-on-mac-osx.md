+++
date = "2010-08-30T00:00:00+01:00"
description = "Node.js is gaining a lot of speed and is an exciting new development framework. Here's a quick overview of how to get Node.js working on OSX along with npm, the package manager for node."
slug = "setting-up-nodejs-and-npm-on-mac-osx"
tags = ["Node.js", "JavaScript"]
title = "Setting up Node.js and npm on Mac OSX"

+++

Update: There are now [packages available][12] for OSX and Windows if you prefer a one click install for Node.js and NPM. To install from source you probably know what you are doing but this [article might help][13]. 

## Install Homebrew

[Homebrew][1] is the package manager that Apple forgot. Written in Ruby it allows you to quickly and easily compile software on your Mac. Instructions for installing Homebrew are in the [README][2] so I won't repeat them here. You will need to install Developer Tools for Mac which you are installed as part of [Xcode][3]. Xcode is available for free - it is a pretty hefty download but you'll need it.

## Install Node.js via homebrew

Once Homebrew is installed you can go ahead and install Node.js

    brew install node

Easy! Now create a file called server.js and paste in the example server code

    var http = require('http');
    http.createServer(function (req, res) {
      res.writeHead(200, {'Content-Type': 'text/plain'});
      res.end('Hello World\n');
    }).listen(8124, "127.0.0.1");
    console.log('Server running at http://127.0.0.1:8124/');

Save the file and from the console run

    node server.js

Now you can visit http://127.0.0.1:8124/ with your favourite browser and you are up and running with server side JavaScript.

At this point it is probably a good idea to consult the excellent [Node.js documentation][4]. This will help you understand what Node.js is and what it can do. 

## Installing npm

npm is Node's package manager. It is now installed automatically with Node.js so there is no need to do a separate installation.

If you are developing anything in Node.js there is a good chance there is already a library to help you. It might be a module to connect to MySQL, a templating library or a utility library.

You can search for modules like this

    npm search [searchterm]

So to search for underscore do this

    npm search underscore

There is also a [website for npm][14] where you can search for packages.

## Installing modules

Now we are set up we can install Node modules using npm. [Express][6] is a good place to start - it is a Node framework inspired by [Sinatra][7]. 

    npm install express

This provides a solid base to start developing with Node.js including [jade][8] the haml inspired Node tempting engine. There is more [excellent documentation][9] available for express too.

That's it - go create!

[1]: http://github.com/mxcl/homebrew
[2]: http://github.com/mxcl/homebrew/blob/master/README.md
[3]: http://developer.apple.com/technologies/xcode.html
[4]: http://nodejs.org/api
[5]: http://github.com/isaacs/npm
[6]: http://expressjs.com/
[7]: http://www.sinatrarb.com/
[8]: http://jade-lang.com/
[9]: http://expressjs.com/guide.html
[10]: http://blog.izs.me/post/3295261330/on-npm-and-homebrew
[11]: https://github.com/shapeshed/dotfiles/blob/master/bashrc
[12]: http://nodejs.org/download
[13]: /compiling-nodejs-from-source-on-ubuntu-10-04/
[14]: https://npmjs.org/

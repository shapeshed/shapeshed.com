+++
date = "2014-03-25T11:53:07+00:00"
description = "A major strength of Node.js is great cross-platform support. With a little effort you can make sure your code will run on Windows, Linux and OSX."
slug = "writing-cross-platform-node"
tags = ["Node.js"]
title = "Writing cross-platform Node.js"

+++

## Cross-platform if you want

Node.js is cross-platform meaning it works on Windows, OSX and Linux. A large number of the Node.js community write Node.js on OSX and then deploy to Linux servers. Because OSX and Linux are based on UNIX this tends to just work. Windows support is a first-class citizen in Node.js and if you learn to use Node.js in the right way you can make sure that you can welcome your Windows friends to your code party.

## Paths

The biggest issue you will run into is paths. Node.js does a great job of taking care of most of this for you but if you build paths in the wrong way you'll run into problems on Windows.

Consider you are doing some string concatention to build a path for example.

    var foo = 'foo';
    var bar = 'bar';
    var filePath = foo + '/' + bar + '/';

Whilst forward slashes will work ok on Windows if you do string concatenation you miss out on the protection that the path module in Node.js gives you.

The [path][1] module gives you all of the tools you need to handle cross-platform paths. For this example we need `path.join`.

    var filePath = path.join(foo, bar);
    // 'foo/bar' on OSX and Linux
    // 'foo\\bar' on Windows

## Use `path.resolve` to traverse the filesystem

Using `path.resolve` lets you move around the file system but maintain cross platform compatibility. As per the documentation you can think of it as a series of `cd` commands that output a single path at the end.

    path.resolve('../', '/../', '../')
    // '/home' on Linux
    // '/Users' on OSX
    // 'C:\\Users' on Windows

## Use `path.normalize` to create reliable paths

If you find yourself doing things like this

    var filePath = '/home/george/../folder/code';

You should be using `path.normalize`. This will present you with the correct path on whatever platform you are using.

    var filePath = path.normalize('/home/george/../folder/code'); 
    // '/home/folder/code'

## Use `path.join` to join folder names

As we saw before with the string concatenation example kittens can die if you use string concatenation.

If you need to join paths together use `path.join`. This will also normalize the result for you.

    path.join('foo', '..', 'bar', 'baz/foo');
    // 'bar/baz/foo' on OSX and Linux
    // 'bar\\baz\\foo' on Windows

## Scripts in package.json

Let's say you have the following executable script `npm-postinstall` in the bin folder of your project. 

    #!/usr/bin/env node
    console.log('node modules installed!');

If you define scripts to be run in your package.json you will find that Windows will choke if you rely on a Node.js shebang.

    {
      "name": "some-app",
      "version": "0.0.1",
      "authors": [
        "George Ornbo <george@shapeshed.com>",
      ],
      "scripts": {
        "postinstall": "./bin/npm-postinstall"
      }
    }

The solution is to use the node executable.

    {
      "name": "some-app",
      "version": "0.0.1",
      "authors": [
        "George Ornbo <george@shapeshed.com>",
      ],
      "scripts": {
        "postinstall": "node bin/npm-postinstall"
      }
    }

This works for all platforms rather than just OSX and Linux.

## Join shell commands with a double ampersand instead of a semi-colon

If you are working with any form of executing command-line programs, and you like to execute more than one in a single go, you would probably do so like this (let's use the basic act of creating a folder and cd'ing into it for brevity):

    shell.exec('mkdir folder_name; cd folder_name');
    
Unfortunately, that does not work on Windows. Instead, use this:

    shell.exec('mkdir folder_name && cd folder_name');
    
## Cross Platform Newline Characters

We all know how troublesome newline characters are accross platforms. Some platforms use '\n', others use '\r', and the rest use both. If you are struggling to get the newline character to work in your log statements or strings on multiple platforms, then you might consider a solution that uses nasty regular expressions to match the correct newline character that you want. Usually, that would look like this: `/(?:\r\n|[r\n])/`. Yuck. Here's a better approach. The `OS` module has an `EOL` constant attached to it that when referred, will output the correct newline character for the operating system.

  var os = require('os'),
      EOL = os.EOL;
      
  console.log('This text will print' + EOL + 'on three lines' + EOL + 'no matter the OS');

Thanks to [Declan de Wet][6] for the above two tips.

## Temporary files

If you need to write files to a `tmp` folder use `os.tmpdir()` to ensure you write to the correct tmp file location for you platform. Thanks to [alessioalex][5] for this tip. 

## Home directories

On \*nix your home directory is process.env.HOME but in Windows the home directory is proces.env.HOMEPATH. You can smooth this out with

    var homedir = (process.platform === 'win32') ? process.env.HOMEPATH : process.env.HOME;

The [module-smith][8] module takes care of this for you so if you are interested in writing cross-platform modules consider using this. 

Thanks to [indexzero][7] for this tip. 

## Use the os module for more control

If you need even more control you can get the operating system platform and CPU architecture you are running on react accordingly with the [os module][3].

    var os = require('os');
    os.platform(); // equivalent to process.platform
    // 'linux' on Linux
    // 'win32' on Windows (32-bit / 64-bit)
    // 'darwin' on OSX
    os.arch();
    // 'x86' on 32-bit CPU architecture
    // 'x64' on 64-bit CPU architecture

## Conclusion

One of the major strengths of Node.js is the ability to deploy your code on any platform and to work with almost any development platform. With a bit of knowledge you can make cross-platform compatibility happen out of the box and avoid having to write the 'make x compatible on x' ticket.

## References

* [Core path module][1]
* [Core os module][3]
* [Windows and Node: Writing Portable Code][2]
* [Tips for Writing Portable Node.js Code][8]

[1]: http://nodejs.org/api/path.html
[2]: http://dailyjs.com/2012/05/24/windows-and-node-4/
[3]: http://nodejs.org/api/os.html
[4]: http://nodejs.org/api/os.html#os_os_tmpdir
[5]: https://github.com/alessioalex
[6]: http://declandewet.com
[7]: https://github.com/indexzero
[8]: https://www.npmjs.org/package/module-smith
[9]: https://gist.github.com/domenic/2790533

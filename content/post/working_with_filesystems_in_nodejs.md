{
  "layout": "post",
  "slug": "working-with-filesystems-in-nodejs",
  "title": "Working with filesystems in Node.js",
  "date": "2013-03-08T08:38:51+00:00",
  "description": "Node's fs module gives you a great cross-platform toolkit for working with filesystems. With a few third-party modules it becomes everything you need",
  "tags": [
    "Node.js",
    "JavaScript"
  ]
}

## Different ways to read a file

Node provides three different ways to read a file through the `fs` module.

* Synchronously
* Asynchronously
* As a stream

To read a file synchronously you can do this

    var data = fs.readFileSync('/path/to/some/file.txt','utf8');

To read a file asynchronously you can do this

    fs.readFile('/path/to/some/file.txt', function (err, data) {
      if (err) throw err;
      console.log(data);
    });

Finally to read a file as a stream you can do this

    var readStream = fs.createReadStream('/path/to/some/file.txt');

The difference in these are fundamental to how node works. The synchronous read will halt your program until the read has finished. The asynchronous read lets your program get on with other things and makes the data available via the callback. Reading a file as a stream makes the data available as soon as chunks of it are ready and lets you pipe it through other streams too. 

The `fs` module provides most things that you need. If you are a UNIX user the [api][8] should be familiar to you.

## Just enough but missing some things

The `fs` module provides a good toolkit for working with the filesystem but some operations are missing. If you do anything moderately complex with the `fs` module you will realise that you will either have to start getting into nested callback operations or look to third party modules to help you out. Thankfully there are some excellent (and small) third-party modules available.

## Rimraf 

[Rimraf][1] provides an `rm -rf` for node. If there are times when you want to recursively delete files this is a tool that does one thing well. 

    rimraf('/some/folder', function(err) {
      if (err) { throw err; }
      // done
    })

## mkdirp

If you are a UNIX user you are probably used to doing `mkdir -p /some/directory/path`. This will create all the directories in the path if they don't exist. If you are just using the `fs` module this is difficult to do but the [mkdirp][2] module comes to the rescue.

    mkdirp('/some/directory/path', function (err) {
      if (err) { throw err; }
      // done
    });

## chmodr

[chomdr][3] does what you would expect `chmod -R` or recursively changing file or folder permissions. 

    chmodr("/some/folder", 0777, function (err) {
      if (err) { throw err; }
      // done
    })

## chown

[chown][3] recursively changes the ownership of files and folders like `chown -R` in UNIX. 

    chownr("/some/folder", 501, 20, function (err) {
      if (err) { throw err; }
      // done
    })

## ncp

Sooner or later you will want to do a recursive copy like `cp -R` in UNIX. This is tricky with the `fs` module but a module called [ncp][5] can help you achive that.

    ncp('/dir/to/copy/from', '/dir/to/copy/to', function (err) {
      if (err) { throw err; }
      // done
    });

## Other tools

There are wealth of other tools available. Check [npm][6] for `fs` module extensions and other goodies. Personally I favour modules that do one thing well but there are a number of modules that extend the `fs` module with more methods if that is your kind of thing.

## Conclusion

Node's `fs` module gives you enough to work with filesystems and provides a single API to smooth out differences between operating systems. The third-party module ecosystem picks things up from there and plugs a few gaps to make node a very capable tool for working with filesystems. Personally I think it is great that more functionality isn't shoved into core modules. Experience of standard libraries like [Net:HTTP][7] in Ruby suggest that core is where things go to rot and third-party libraries are often better anyway. 

[1]: https://github.com/isaacs/rimraf
[2]: https://github.com/substack/node-mkdirp
[3]: https://github.com/isaacs/chmodr
[4]: https://github.com/isaacs/chownr
[5]: https://github.com/AvianFlu/ncp
[6]: https://npmjs.org/browse/keyword/filesystem
[7]: http://ruby-doc.org/stdlib-2.0/libdoc/net/http/rdoc/Net/HTTP.html
[8]: http://nodejs.org/api/fs.html


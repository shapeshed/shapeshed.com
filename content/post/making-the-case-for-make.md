{
  "title": "Making the case for make",
  "date": "2014-01-08T16:42:56+00:00",
  "description": "Make gives you access to many tiny, powerful UNIX tools and shouldn't be overlooked as a build tool.",
  "tags": [
    "JavaScript",
    "Node.js",
    "Unix"
  ]
}

## Harness tiny UNIX tools

Make is the original UNIX build tool. It existed a long time before [gulp][2], or [grunt][3]. Loved by some, loathed by others it is at least worth being aware of how `make` works, what the strengths are and where it falls short.

Make is available on UNIX-like systems. That means OSX, BSD and Linux. It exposes any system command meaning that you can run system commands and execute arbitrary scripts. There is no doubt that tools like gulp and grunt are inpsired by or at least a reaction to `make`. 

To use `make` you create a Makefile and then run `make [what to run]` from the terminal. In the following examples it is assumed `make build` will be run from the terminal.

## Concatenating Files

A common build task is to concatenate various files into a single file. In the tradition of UNIX single line commands this is easy.

    build: mkdirs concat-css

    mkdirs:
      @mkdir -p ./build/css

    concat-css:
      @cat ./src/stylesheets/*\.css > ./build/css/application.css

That's it - five lines of code. 

UNIX tools already exist to make directories and combine files and they are fast because more often than not the underlying tools are C based. 

## Minifying CSS

We can extend the previous example to minify the CSS using the [cssmin][5] node module to minify the css too.

    build: mkdirs concat-css min-css

    mkdirs:
      @mkdir -p ./build/css

    concat-css:
      @cat ./src/stylesheets/*\.css > ./build/css/application.css.tmp

    min-css:
      @./node_modules/cssmin/bin/cssmin ./src/css/application.css.tmp > ./build/css/application.css && rm ./build/css/application.css.tmp

## Copying files

UNIX has many tools for copying files around the filesystem. One of those tools is [rsync][4]. It lets you synchronise folders on your own filesystem or even over the network.

    build: copy-files

    copy-files:
      @rsync -aq ./src/ ./build

If you want to exclude files or folders you can do it like this

    build: copy-files

    copy-files:
      @rsync -aq --exclude='_*' ./src/ ./build

This will exclude any folder names prefixed with \_.

## Uglifying JavaScript

Foo. Assuming you've concatenated your JavaScript files in the same way the css example did it becomes a one line command. In this example I'm using the [uglifyjs][6] node module.

    build: uglifyjs 

    uglifyjs:
      @./node_modules/uglify-js/bin/uglifyjs ./build/js/main.js.tmp > ./build/js/main.js && rm ./build/js/main.js.tmp

## Strengths

UNIX encourages small, distinct tools. A Makefile allows you to pick the best tool for the job. If it runs on UNIX it runs on Make. There is no need to create a wrapper or integrate with a build framework. In this sense it allows you to choose the best tool for the job and you can throw out the idea that you have to write *everything* in JavaScript.

It is fast. In all tests I've run locally using system commands via a Makefile is always faster than using a build framework.

It is simple. If you can complete a task in five lines of code there is less to go wrong and it is easier to understand.

## Weaknesses

Probably the biggest weakness is that Make is not cross platform. So if you have a windows developer in your team they will have to jump through some hoops to get it working. Make can also become unmaintainable as it is just one big file. Of course you can break tasks down to individual bash scripts that get called in the Makefile.

Managing dependencies is a manual process. For node modules you can use npm to make sure a particular version is available but for UNIX tools you are on your own. Some UNIX tools vary between platforms both in terms of where they are located and what they allow you to do. GNU sed is different from BSD sed for example. 

Another weakness is that it is not JavaScript. I've seen developers shaking their head at Makefiles as soon as they see system commands or lines of code that don't start with the word var. This is more of a cultural thing than anything to do with technology but if you are working in a team or accepting contributions to open source projects you might find people just refuse to use `make`. 

## Bash - another option

For a super lightweight build system you can also just craft your own bash scripts and ignore Make altogether. 

## Conclusion

There is a tendency within any programming community to want to do everything in the community's language. But sometimes the problem has already been solved by men with beards in the 1970's. If you can park the hipster hacker mentality there are tools that have been around for a long time that are stable and fast that already solve your problem. The main thing is to keep it small and distinct. If you know a little UNIX maybe you should try `make` or a small bash script as your build tool.

## References 

* [Make man page][1]
* [Gulp][2]
* [Grunt][3]

[1]: http://linux.die.net/man/1/make 
[2]: http://gulpjs.com/
[3]: http://gruntjs.com/
[4]: https://rsync.samba.org/ 
[5]: https://github.com/jbleuzen/node-cssmin
[6]: http://lisperator.net/uglifyjs/

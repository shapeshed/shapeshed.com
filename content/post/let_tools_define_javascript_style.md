{
  "layout": "post",
  "title": "Let tools define JavaScript style",
  "date": "2013-03-04T19:12:47+00:00",
  "description": "JavaScript's permissive syntax means style debates are easy to run into. This post details how tools can be used to encapsulate your opinion and how this can be integrated into a build process.",
  "tags": [
    "JavaScript"
  ]
}

## No rules

One of the reasons that people love/hate JavaScript so much is that there are so many different ways that you can do something. Reading through the source code of node modules and JavaScript libraries universally there is difference. The difference comes from the language itself. JavaScript gives you tools to solve the same problem in many ways.

Working in a small team or on an open source project this can be a problem. You might recieve a pull request that has the following style

    var express = require('express')
      , routes = require('./routes')
      , user = require('./routes/user')
      , http = require('http')
      , path = require('path');

The branch you are pulling into has the following style.

    var express = require('express'),
        routes = require('./routes'),
        user = require('./routes/user'),
        http = require('http'),
        path = require('path');

Both are valid and developers will argue passionately for both. Because JavaScript is permissive the smallest item like a semicolon can lead to [impassioned pleas][1] and [detailed posts][2] about how you can and should be using semicolons. So which style is correct? Whichever one you think is correct. Put simply it comes down to opinion.

## How you document opinion

How you document your opinion on JavaScript style is up to you. Some create excellent [style guides][3], others [write books][4]. In the bowels of IRC channels and Twitter messages are flying back and forth even as we speak about what you should and shouldn't do in JavaScript. However you choose to do it it is still just opinion if the syntax is legal.

## The only rule

The only rule for me is to respect the author of the project you are contributing to. If you are the author you can define the style. If you are not the author you should respect the style they have chosen. If you submit a pull request to an open source project it should be in exactly the same style as the project. Once merged my code should be invisible in terms of style. 

Clearly for small teams it makes sense to have this discussion up front, have an arm wrestle and agree. But unless you enjoy trolling and having pull requests politely rejected just do the sane thing and respect a diversity of style. 

## Opinion from tools

JavaScript tooling is improving all the time and linting tools are now very capable at encapsulating your opinion. [JSHint][5] and [JSLint][6] are both excellent tools that not only lint your code for common mistakes but also let you specify a large amount of style. As this is a common requirement you can enapsulate this in a `.jshintrc` file and carry it round your projects. A `.jshintrc` file is a JSON file that contains your preferences about how the linter should behave. If you want to lint that strict mode should be used all the time just do this

    "strict": true

There are [many options][7] you can configure and the chances are you already have opinions about what they should be. Once you have your opinions documented you can integrate your opinion into your build process. Grunt is a good choice for this. First install the command line inteface for grunt.

    npm install -g grunt-cli

Add dependencies to your `package.json` file.

    "devDependencies": {
      "grunt": "0.4.0",
      "grunt-contrib-jshint": "0.2.0",
    }

Then specify what you want to lint and where to find your `.jshintrc` file.

    module.exports = function (grunt) {

      grunt.initConfig({
        jshint: {
          files: [
            'Gruntfile.js',
            'lib/**/*.js',
            'package.json',
            'test/**/*.js',
            '.jshintrc'
          ],
          options: {
            jshintrc: '.jshintrc'
          }
        }
      });

      grunt.loadNpmTasks('grunt-contrib-jshint');

      grunt.registerTask('build', ['jshint']);

    };

Now if you run `grunt build` your code will be linted according to the preferences you specified in your `.jshintrc` file. It now becomes trivial to run this on your Continuous Integration server. So something like [Travis][8] can check pull requests are in line with your expectations before you have to have a flame war debate about semicolons. You can also use watcher scripts to lint your code as you develop, just as you would with tests.

## Conclusion

JavaScript is a beautiful soup that lets developers solve a single problem many different ways and use many different styles. The permissive syntax means that code can look completely different between two different developers. Arguments will rage long into the night about the best way to solve a problem but at least in terms of style this is something that should be respected. If I submit a pull request to your project it should be invisible after merge. If you give me tools to help validate that much the better. 

[1]: http://blog.izs.me/post/2353458699/an-open-letter-to-javascript-leaders-regarding
[2]: http://dailyjs.com/2012/04/19/semicolons/
[3]: https://github.com/airbnb/javascript
[4]: http://eloquentjavascript.net
[5]: http://www.jshint.com
[6]: http://www.jslint.com
[7]: http://www.jshint.com/docs/#options
[8]: https://travis-ci.org

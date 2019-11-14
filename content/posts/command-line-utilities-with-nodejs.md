{
  "slug": "command-line-utilities-with-nodejs",
  "title": "Command Line Utilities with Node.js",
  "date": "2014-01-02T17:00:57+00:00",
  "description": "Node.js is a great platform for creating small command line utilities, especially where I/O occurs.",
  "tags": [
    "Node.js",
    "JavaScript"
  ]
}

## Write command line utilities with Node.js

An underused feature of Node.js is the ability to write command-line scripts. This gives you the full power of Node.js as a network programming platform and the brilliance of npm to allow you to share your scripts. I recently wrote  [weatherme][2] a command line app to display data from forecast.io. Compared to writing bash scripts it was a really pleasant experience and I think people should be using Node.js for creating CLI tools more, especially where I/O is involved.

## The basics

To create an executable Node.js script all you need is a Node.js shebang at the top of the script and then some code to execute.

    #!/usr/bin/env node

    console.log('hello world');

Assuming you are on a UNIX like system you can do this to make the script executable

    chmod u+x yourscript

Now you can run it and you should see 'hello world' printed.

    ./yourscript
    hello world

## Handling arguments

As you get beyond basic scripts you'll want to pass arguments into the script. The arguments passed to a script are available as `process.argv`.

If you pass arguments to the simple example above and add `console.log(process.argv)` you'll see the arguments are available as an array. For example if you run

    ./yourscript -g -f 

You get 

    [ 'node', '/home/george/yourscript', '-f', '-g' ]

To remove 'node' and the path to your script it is common to do something like this

    var args = process.argv.slice(2);

## Exit codes

Node.js plays very nice with UNIX but as a developer you too need to be aware of exit codes. If a script exits without an error the exit code should be 0. If it exits with an error it should be 1 or higher. A crude example follows.

    if (err) {
      process.exit(1);
    } else {
      process.exit(0);
    }

## Piping data

If you've used shell scripting one of the most powerful features is the ability to pipe data from one command to the next. For example to list node processes on a UNIX type system you can do this

    ps aux | grep 'node'

This lists all processes on the system and pipes it to the grep command. This filters only lines with node.

You receive piped data in a Node.js shell script like this

    process.stdin.resume();
    process.stdin.setEncoding('utf8');
    process.stdin.on('data', function(data) {
      process.stdout.write(data);
    });

Now you can do this and you should see foo printed

    echo 'foo' | ./yourscript

This is really powerful as it opens up a wealth of other tools to your Node.js script. You might want to pipe data from a system command, a Ruby script, whatever.

## UNIX signals

Node.js has great UNIX support including for Signals. This means you can send a script a signal and get it to do something. In the following example the script does nothing but idle until it gets a SIGINT.

    process.stdin.resume();
  
    process.on('SIGINT', function () {
      console.log('Got a SIGINT. Goodbye cruel world');
      process.exit(0);
    });

If you run this script you can either send it a SIGINT by pressing CTRL-C on your keyboard or you can send it a signal after finding out the pid of the process.

    ps aux | grep yourscript

You can then send a SIGINT signal like this

    kill -s SIGINT [process_id]

Signals are another really powerful feature that allow other parts of a UNIX ecosystem to interact with your script. 
  

## Some useful libraries

After a while you'll find yourself repeating a lot of code. The Node.js community has already done a lot of work for you here. The two libaries I would recommend for writing command line scripts are [commander][7] and [optimist][8]. Both of them perform very similar things with commander having a few more features and offering a slicker api. Personally I really like optimist as I like my tools small and compact but both are really good. Other libraries you might want to look at include [cli][9], [nopt][10], [Inquirer.js][12], [node-argp][13] and [stateful-process-command-proxy][14]

## Conclusion

Particularly if you are on a UNIX type system Node.js offers an excellent platform for creating CLI tools. Especially if you are doing any kind of I/O Node is a great choice. The fact that it plays nice with UNIX pipes and signals means that it can exist quite happily along side other tools. Node can also spawn [child processes][11] so you can easily shell out to any other tool on the system making it really flexible.

In short I think people should be using Node.js more for CLI tools and using npm to share them!

## References 

* [Write your shell scripts in JavaScript, via Node.js][1]
* [Node.js Process Documentation][3]
* [Unix and Node: Command-line Arguments][4]
* [Unix Node Pipes][5]
* [Unix Node Signals][6]

[1]: http://www.2ality.com/2011/12/nodejs-shell-scripting.html
[2]: https://github.com/shapeshed/weatherme
[3]: http://nodejs.org/api/process.html
[4]: http://dailyjs.com/2012/03/01/unix-node-arguments/
[5]: http://dailyjs.com/2012/03/08/unix-node-pipes/
[6]: http://dailyjs.com/2012/03/15/unix-node-signals/
[7]: https://github.com/visionmedia/commander.js
[8]: https://github.com/substack/node-optimist
[9]: https://github.com/chriso/cli
[10]: https://github.com/isaacs/nopt
[11]: http://nodejs.org/api/child_process.html
[12]: https://github.com/SBoudrias/Inquirer.js
[13]: https://github.com/gagle/node-argp
[14]: https://github.com/bitsofinfo/stateful-process-command-proxy

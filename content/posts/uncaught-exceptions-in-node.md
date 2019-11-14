{
  "slug": "uncaught-exceptions-in-node",
  "title": "Uncaught Exceptions in Node.js",
  "date": "2012-11-14T00:00:00+00:00",
  "description": "Dealing with uncaught exceptions in Node.js is not straightforward",
  "tags": [
    "JavaScript",
    "Node.js"
  ]
}

## The problem of uncaught exceptions

Because Node.js runs on a single process uncaught exceptions are an issue to be aware of when developing applications. Node.js follows a callback pattern where an error object is the first argument and data is the second argument. It is not uncommon to see examples in the documentation where an error is thrown if an error is returned by the callback.

    var fs = require('fs');

    fs.readFile('somefile.txt', function (err, data) {
      if (err) throw err;
      console.log(data);
    });

If you run this and assuming you have no file called 'somefile.txt' an error will be thrown.

    Error: ENOENT, open 'somefile.txt'

This has the effect of crashing the process and bringing down you whole application. This is by design. Node.js does not separate your application from the server. 

## How to deal with uncaught exceptions

So what's the best way of dealing with uncaught exceptions? There are many opinions floating around on this.

* You application shouldn't have uncaught exceptions. This is clearly insane.
* You should let your application crash, find uncaught exceptions and fix them. This is clearly insane.
* You should swallow errors silently. This is what lots of people do and it is bad.
* You should let your application crash, log errors and restart your process with something like [upstart][1], [forever][3] or [monit][2]. This is pragmatic.
* You should start using domains to handle errors. Clearly the way to go, although this is an experimental feature of Node.

Let's look at these in a bit more detail.

### An application without uncaught exceptions

This opinion is completely bizarre to me. Applications will always have exceptions at some stage and will probably have uncaught exceptions. If you hold this opinion you push error handling onto your users and are likely to get some late night calls that the server has gone down.

### Let your application crash

The only defence I can find in this opinion is the fail fast argument. You are going to fix your application quickly if it unavailable. If an application without uncaught exceptions is denial letting your application crash is acceptance. But you are still pushing exception handling onto your users.

### Swallow errors silently

Lots of people do this:

    process.on('uncaughtException', function (err) {
      console.log(err);
    })

This is bad. When an uncaught exception is thrown you should consider your application in an unclean state. You can't reliably continue your program at this point. 

[Felix Geisend&ouml;rfer][6] who originally asked for this event to be added to the core is now advocating the [its removal][7]. 

### Let your application crash, log and restart

With this approach you simply let your application crash in the event of an uncaught exception and use a tool like forever or upstart to restart it (almost) instantly. Because node will write the exception to STERR your can redirect this to a log file that you can use it to assess errors at a later time. The disadvantages of this are that for i/o where the error might be outside your codebase it doesn't really offer an elegant way to deal with scenarios like temporary outages or errors with networked i/o. It is a big hammer to crack a nut - restart the process and try again. If you combine this strategy with the [cluster module][4] you can have node automatically restart any children than throw an exception and log the error.

    var cluster = require('cluster');

    var workers = process.env.WORKERS || require('os').cpus().length;

    if (cluster.isMaster) {

      console.log('start cluster with %s workers', workers);

      for (var i = 0; i < workers; ++i) {
        var worker = cluster.fork().process;
        console.log('worker %s started.', worker.pid);
      }

      cluster.on('exit', function(worker) {
        console.log('worker %s died. restart...', worker.process.pid);
        cluster.fork();
      });

    } else {

      var http = require('http');
      http.createServer(function (req, res) {
        res.end("Look Mum! I'm a server!\n");
      }).listen(3000, "127.0.0.1");

    }

    process.on('uncaughtException', function (err) {
      console.error((new Date).toUTCString() + ' uncaughtException:', err.message)
      console.error(err.stack)
      process.exit(1)
    })

### Using Domains

[Domains][5] are an experimental feature added in Node 0.8 to make handling exceptions more flexible and more sophisticated. Here is the same example from earlier where an exception will be thrown if a file does not exist. By using domains you can fire an error event for a particular domain and use different exception handlers for different scenarios. This allows you to handle exceptions depending on where they occur. If exiting the process with an error status was a hammer to crack a nut this is a surgical knife that gives you full control. 

    var domain = require('domain');
    var d = domain.create();
    var fs = require('fs');

    d.on('error', function(err) {
      console.error(err);
    });

    d.run(function() {
      fs.readFile('somefile.txt', function (err, data) {
        if (err) throw err;
        console.log(data);
      });
    });

### Conclusion

If you are running Node.js in production you need to at least have an opinion about what to do with uncaught exceptions. For now I suspect most people are restarting their application (maybe gracefully) when an exception is thrown. Domains offer the ability for an application to be more intelligent about what to do when an error is thrown. Exception handlers might choose to clean up after an error is thrown, close some connections or if worst comes to the worst exit the process. The point is you can choose. 

It is probably time I dropped the hammer and picked up the surgical knife. 

[1]: http://upstart.ubuntu.com/
[2]: http://mmonit.com/monit/
[3]: https://github.com/nodejitsu/forever
[4]: http://nodejs.org/api/cluster.html
[5]: http://nodejs.org/api/domain.html
[6]: http://felixge.de/
[7]: https://github.com/joyent/node/issues/2582

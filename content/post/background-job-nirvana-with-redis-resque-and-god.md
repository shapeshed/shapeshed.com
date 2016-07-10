{
  "slug": "background-job-nirvana-with-redis-resque-and-god",
  "title": "Background job nirvana with Resque, Redis and God",
  "date": "2010-09-08T00:00:00+01:00",
  "description": "Recently a requirement came up to add a background job queue to a Rails application. Thanks to a couple of excellent open source libraries I was up and running in no time.",
  "tags": [
    "Ruby",
    "Rails"
  ]
}

## Resque

[Resque][5] is a Ruby library that lets you place jobs on queues and process them later. It was created by [defunkt][4] and is in production use on [Github][10]. The documentation is excellent. I'm using Resque on a Rails app but it can be used with any Rack application. 

First you need to install [Redis][7]. On OSX this is trivial with [homebrew][6]

    brew install redis

If you installed Redis with homebrew it spits out some helpful information about how to start Redis on boot or you can start the server with 

    redis-server

The installation notes for Resque are excellent so I won't repeat them here - head over to the [README][8].

## Booting the GUI

Resque ships with an great GUI that lets you track jobs and workers. To launch it from the root of your site run

    resque-web

Then you'll probably want to spawn some workers

    COUNT=5 QUEUE=* rake resque:workers

In the GUI you should now see 5 workers waiting to do your bidding

![Workers in the Resque GUI][9]

Now you can start sending jobs to Resque and watch your workers eat them up. The GUI also provides a great way to review failures. The stack trace is even included!

## Settings for production

There are a few issues to consider in production. Firstly if your Redis server is used by other applications you might want to specify a namespace for the application to use. You can do this by adding the following to an initialiser after Redis is configured.

    Resque.Redis.namespace = "resque:YourApp"

As Redis supports running multiple databases on a server it may be possible to specify which database to use but that wasn't a requirement for me. I couldn't find anything in the documentation about this. If anyone knows anything about this let me know and I'll update the post. 

In production it will be important that Redis and the workers have high availability. Redis can easily be configured to start on reboot but [God][2] can also monitor a live system and restart Redis if necessary. God is another Ruby based library for monitoring services on a server. The configuration files are written with Ruby so it is easy to extend it to whatever you'd like. Using God we can easily make sure our workers are well-managed and that if Redis does go down it will be restarted. There is even an [example script][1] in Resque that will get you started with managing workers. 

With God running on the server we can be sure that Redis and our workers will have high availability, or that we'll know about it quickly if not. 

## General win

Adding a highly available and robust background queue to the application took less than a day. Thanks to [defunkt][4] and [mojombo][3] for their excellent open source libraries!

[1]: http://github.com/defunkt/resque/blob/master/examples/god/resque.god
[2]: http://god.rubyforge.org/
[3]: http://tom.preston-werner.com/
[4]: http://chriswanstrath.com/
[5]: http://github.com/defunkt/resque/
[6]: http://github.com/mxcl/homebrew
[7]: http://code.google.com/p/redis/
[8]: http://github.com/defunkt/resque/blob/master/README.markdown
[9]: https://shapeshed.com/images/articles/resque_workers.png
[10]: http://github.com


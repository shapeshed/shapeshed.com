+++
date = "2011-09-12T00:00:00+01:00"
description = "A walkthrough on how to manage Unicorn worker processes using Monit"
tags = ["UNIX", "Rails", "Ruby"]
title = "Managing Unicorn Workers with Monit"
+++

## Riding Unicorns

For many reasons I like using [Unicorn][1] as a web server for Ruby apps. [Ryan
Tomayko][2] wrote a [great article][3] and the many Unix features that it has.
It has the killer feature of supporting hot restarts so you can deploy new
releases with zero downtime. This means that in most cases you can deploy as
often as you want and end users won't even notice.

## More power == more responsibility

With all of the great stuff that comes with Unicorn there is more configuration
to do. This is the point at which the less intrepid opt for [Passenger][5], that
to be fair is stil a good option. But if you want a web server that uses great
features of Unix and enables hot restarts you should persevere.

For Unicorn you need to set up a reverse proxy with nginx. I've [written
before][4] about how to do that if you need a steer. You'll also need to use
upstart or script in /etc/init.d/ to manage Unicorn. There are a few scripts
around on the web. I've posted the one that I use up as [a gist on Github][10].
You can then use something like this in your capistrano recipes to do a hot
restart.

```ruby
namespace :deploy do
  task :restart do
    sudo "/etc/init.d/unicorn upgrade"
  end
end
```

This sends a `USR2` signal to the Unicorn master process to upgrade itself. It
will create a new master process and then switch over when it is ready. See -
zero downtime!

## Up the workers

The Unicorn master process looks after workers and will reap workers that die
from broken apps. In my scenario I was working on a memory constrained box and I
wanted to make sure that workers did not consume too much memory. I like to use
[Monit][6] to monitor processes. You can also use [god][7] or [bluepill][8] but
I've found these tools consume much more memory that Monit. Call me old
fashioned but I like to use Unix tools if they are available over Ruby.

So I want to monitor the Unicorn workers that are a child processes of the
master Unicorn process. Bluepill supports monitoring child processes but it
turns out this is easy enough to do with Monit.

Unicorn's config file has an after_fork method that allows you to write out the
pid of a worker. Here's how

```ruby
after_fork do |server, worker|
  defined?(ActiveRecord::Base) && ActiveRecord::Base.establish_connection
  child_pid = server.config[:pid].sub('.pid', ".#{worker.nr}.pid")
  system("echo #{Process.pid} > #{child_pid}")
end
```

If you want to see my full [unicorn.conf][11] it is here. This will write out
the pid of each worker `/tmp/pids/unicorn.[pid_id].pid`, so now we can use Monit
to watch it.

## Adding in Monit

Now that we have the pids of workers and an init.d script that can manage
workers too (see kill_worker) we can use Monit to keep everything in check. The
only downside is that you need to tell Monit about each worker process that you
have. If you are spawning and reaping Unicorn workers dynamically with `TTIN`
and `TTOU` this probably isn't going to work for you. But if the numbers of
workers are fixed you are good.

```sh
check process unicorn_worker_0
    with pidfile /path/to/your/app/shared/pids/unicorn.0.pid
    start program = "/bin/cat /dev/null"
    stop program = "/etc/init.d/unicorn kill_worker 0"
    if mem is greater than 175.0 MB for 1 cycles then restart
    if cpu is greater than 22% for 2 cycles then alert
    if cpu is greater than 25% for 1 cycles then restart
```

Monit will watch the worker for memory growth and kill it off if it consumes too
much. The unicorn master will spawn a new worker when it is killed so it is a
neat solution to keep things running.

Much of this article was derived from Andrew Grim's article ['Where Unicorns go
to die: Watching unicorn workers with monit'][9], so thanks to Andrew for the
pointers.

[1]: http://unicorn.bogomips.org/
[2]: http://tomayko.com/
[3]: http://tomayko.com/writings/unicorn-is-unix
[4]: /building-a-rails-development-server/
[5]: http://www.modrails.com/
[6]: http://mmonit.com/monit/
[7]: http://god.rubyforge.org/
[8]: https://github.com/arya/bluepill
[9]:
  http://www.stopdropandrew.com/2010/06/01/where-unicorns-go-to-die-watching-unicorn-workers-with-monit.html
[10]: https://gist.github.com/1221753
[11]: https://gist.github.com/1221753#file_unicorn.rb

{
  "layout": "post",
  "title": "Instant Rails dev environments with Tmuxinator and Foreman",
  "date": "2011-07-06T00:00:00+01:00",
  "description": "How to start an entire development environment with a single command",
  "tags": [
    "Unix",
    "Rails"
  ]
}

## The problem

To begin working on a Rails app I need to do things like starting a server, starting a console, ensure background processes are running, start a terminal window so I can watch logs, start a text editor etc etc.

Doing all this is tedious. Wouldn't it be nice if we could just do something like?
    
    start_myapp

Well you can!

## Tmux

[Tmux][2] is a 'terminal multiplexer'. What the hell's that? It basially allows you to create terminal sessions - similar to [GNU Screen][3] where you can detach from a session and come back later. If you are not familiar with tmux there are a few good resources available

* [A quick tmux (terminal multiplexer) screencast (a better GNU screen)][4]
* [Love, hate, & tmux][5]
* [TMUX - The Terminal Multiplexer (Part 1)][6]
* [TMUX - The Terminal Multiplexer (Part 2)][7]

You can install tmux with homebrew

    brew install tmux

It takes a little reading and configuring but is well worth effort if you are a heavy terminal user. 

## Tmuxinator

[Tmuxinator][8] is an excellent gem that lets you define the layouts of your tmux sessions. 

You can install tmuxinator from RubyGems

    gem install tmuxinator

By defining a yaml file we can layout things exactly how we want them.

    project_name: myapp
    project_root: ~/Sites/myapp
    tabs:
      - zsh: 
      - vim: vim .
      - foreman: bundle exec foreman start
      - git: git pull
      - console: bundle exec rails console
      - server: bundle exec rails server
      - logs: tail -f log/development.log

Then you can start your session with `start_myapp` and your layout will be ready for you. Here's a screenshot from the documentation:

![Tmux session][13]

There's excellent documentation on using tmuxinator in the [project README][9]

## Foreman

Enter the final piece of the jigsaw - [foreman][10]. Foreman is a gem that lets you manage background processes associated with your application through a Procfile. You just add any processes you want to be started into the Procfile and you are done. Here's an example

    worker: bundle exec rake resque:work QUEUE=sweep_orders 
    apn_sender: bundle exec rake apn:sender 
    resque_scheduler: bundle exec rake resque:scheduler
    resque_web: bundle exec resque-web --foreground --server thin --port $PORT --no-launch
    sphinx: bundle exec rake ts:run_in_foreground

You can then start these process by running

    foreman start

The processes will run in the foreground and spit out any logs messages to standard output - perfect for development.

Using foreman you can add a tab to tmuxinator that will start your processes and have a nice log of what they are doing. We have a neat way of starting any background processes in our app within the context of our unified tmux development environment.

So with one command we can set things up exactly the way we want and get straight into developing. 

## Alternatives

This technique will also work well for screen and regular terminal users with the [Screeninator][11] and [Terminitor][12] gems so if you are not sold on tmux you can still use it. 

[1]: http://freelancing-god.github.com/ts/en/
[2]: http://tmux.sourceforge.net/
[3]: http://www.gnu.org/software/screen/
[4]: http://peterc.org/blog/2010/216-tmux.html
[5]: http://robots.thoughtbot.com/post/2166174647/love-hate-tmux
[6]: http://blog.hawkhost.com/2010/06/28/tmux-the-terminal-multiplexer/
[7]: http://blog.hawkhost.com/2010/07/02/tmux-%E2%80%93-the-terminal-multiplexer-part-2/
[8]: https://github.com/aziz/tmuxinator
[9]: https://github.com/aziz/tmuxinator/blob/master/README.md
[10]: https://github.com/ddollar/foreman
[11]: https://github.com/jondruse/screeninator
[12]: https://github.com/achiu/terminitor
[13]: http://shapeshed.com/images/articles/tmuxinator.jpg

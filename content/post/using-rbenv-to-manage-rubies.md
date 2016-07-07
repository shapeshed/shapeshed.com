{
  "title": "Using rbenv to manage rubies",
  "date": "2011-10-12T00:00:00+01:00",
  "description": "How I use rbenv to manage rubies and integrate with other tools",
  "tags": [
    "Unix",
    "Rails",
    "Ruby"
  ]
}

## rbenv is great

If you haven't seen [rbenv][1] yet I highly recommend it. It is a small collection of shell scripts that lets you manage rubies on UNIX type machines. To date I've used [rvm][2] to install versions of ruby and manage gemsets. Don't get me wrong - I'm hugely greatful to the work that has gone into the rvm project and it is still a great tool. But I prefer the UNIX philosophy of doing one thing well and rbenv embraces that. I also really like that with rbenv you just need to amend your PATH and you are done. It follows UNIX conventions making integration with other UNIX tools easier - for me at least. 

## rbenv basics

We have a dev machine at work which runs a variety of Sinatra and Rails projects (including a Rails 1 project). As such these projects need lots of different versions of Ruby. To date I've used rvm to manage this and it has worked well but I always came up against issues when trying to integrate tools like Monit, puppet or init.d scripts. So I bit the bullet and switched to rbenv.

Each app has a UNIX user so rbenv is installed locally for each user when logged in as the user account

    cd
    git clone git://github.com/sstephenson/rbenv.git .rbenv

You need to load rbenv into the shell and you are good to go

    echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
    echo 'eval "$(rbenv init -)"' >> ~/.bashrc
    source ~/.bashrc

If you have installed [ruby-build][3] you can then install rubies with `rbenv install`.

    rbenv install 1.9.3-rc1

You can set a global ruby for the user account with

    rbenv global 1.9.3-rc1

And you can also use an `.rbenv-version` file to set the version. I choose to use this in projects and check it into git.

## Deployment with capistrano

I like that rbenv doesn't try and manage rubies for you - we have [bundler][4] for that. I deploy as the same user as the app accounts so I just need to add the following to my cap recipe to use rbenv since I'm already including `require 'bundler/capistrano'`.

    set :default_environment, {
      'PATH' => "/home/youruser/.rbenv/shims:/home/youruser/.rbenv/bin:$PATH"
    }

This loads rbenv into the shell that capistrano uses. That's pretty much all you need to use your rbenv installed ruby.

Following a [thread on github][5] you can also apply a clever technique to allow you switch versions of ruby by pushing a new `.rbenv-version` file with capistrano. From version 1.1rc bundler allows you to specify a shebang for binstubs. To use this add the following to your capistrano recipe.

    set :bundle_flags, "--deployment --quiet --binstubs --shebang ruby-local-exec"

This generates executables in the bin folder of your Rails app which reference `ruby-local-exec` as the shebang. This command will execute whichever ruby is specified in the `.rbenv-version file`. In my case I have an init.d script to manage unicorn that references bin/unicorn. If I wanted to upgrade the ruby used by the app I would install it on the remote machine and then just update my `.rbenv-version` file commit, cap deploy and I'm done. 

## Integrating with other tools

I like to use [monit][6] to monitor processes. Monit exexutes scripts with a very limited shell but since rbenv follows UNIX conventions we can easily create a small bash script to load rbenv into the path and then do what we want.

Here's the script I'm using for starting a resque\_worker

    #!/usr/bin/env bash
    USER=youruser
    APP_PATH=/srv/yourapp.com/current
    PATH=/home/$USER/.rbenv/bin:/home/$USER/.rbenv/shims:$PATH 
    RAILS_ENV=production 

    cd $APP_PATH
    RAILS_ENV=$RAILS_ENV bin/rake environment resque:work& > $APP_PATH/log/resque_worker.log 
    echo $! > $APP_PATH/tmp/pids/resque_worker.pid

Then my monit task looks like this

    check process yourapp_resque_worker
        with pidfile /srv/yourapp.com/current/tmp/pids/resque_worker.pid
        start program = "/bin/sh -c '/home/youruser/bin/start_resque_worker.sh'" as uid youruser and gid youruser
        stop program = "/bin/sh -c 'cd /srv/yourapp.com/current && kill -s quit `cat tmp/pids/resque_worker.pid` && rm -f tmp/pids/resque_worker.pid; exit 0;'"

## Better separation

By using rbenv, bundler, capistrano and monit together we have great separation between what these tools do

* rbenv manages rubies 
* bundler manages gems
* capistrano manages deployments
* monit monitors processes

This feels clean and manageable to me. 

By using binstubs with the `ruby-local-exec` shebang we also separate our app from versions of rubies, init.d and monit scripts, making it super easy to upgrade. 

## Thanks rvm, onwards with rbenv

I'm really grateful to Wayne E Seguin and the work he has put into rvm and I hope the project continues to thrive. rbenv fits the way I work though and I'm really enjoying using it. It makes piecing tools like puppet, monit, init.d scripts, capistrano and bundler much easier, so a big thanks to [Sam Stephenson][7] for creating it.

[1]: https://github.com/sstephenson/rbenv
[2]: https://rvm.io/
[3]: https://github.com/sstephenson/ruby-build
[4]: http://gembundler.com/
[5]: https://github.com/sstephenson/rbenv/issues/101
[6]: http://mmonit.com/monit/
[7]: http://sstephenson.us/

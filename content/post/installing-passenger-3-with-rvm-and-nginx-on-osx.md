{
  "title": "Installing Passenger 3 with RVM and Nginx on OSX",
  "date": "2010-10-21T00:00:00+01:00",
  "description": "A multi-ruby development environment on Nginx is easier than ever with the release of Passenger 3",
  "tags": [
    "Rails",
    "Ruby",
    "Nginx"
  ]
}

## Nginx

My preferred way of installing nginx on OSX is using [homebrew][1]. You need to compile it with passenger support

brew install nginx --with-passenger

## RVM

[RVM][3] makes it easy to manage multiple rubies. Installation is easy 

    bash < <( curl http://rvm.beginrescueend.com/releases/rvm-install-head )

You can then install different versions of ruby. In this case let's install [Ruby Enterprise Edition][2]

    rvm install ree

Then we can make Ruby Enterprise Edition the default Ruby on this machine with 

    rvm --default ree

## Passenger

This is the most tricky part of the install. To start you'll need the passenger gem 

    gem install passenger

We need to use the nginx source code for this process. If your homebrew setup is a default one run

    tar -xzf /Users/george/Library/Caches/Homebrew/nginx-0.8.53.tar.gz

Note your version of nginx may be different from this!

Then we need to run the nginx passenger module installer

    passenger-install-nginx-module

The default install downloads an entirely new binary for Nginx - a bit annoying. If you choose option 2 you'll be able to choose the source you've downloaded with homebrew. For the source directory choose the one we've just extracted 

    /Users/george/Library/Caches/Homebrew/nginx-0.8.53

Then choose to install Nginx to (if you've used the default homebrew install)

    /usr/local/Cellar/nginx/0.8.53/sbin

Hit return on the next two prompts. Drink tea whilst it compiles. 

The installer spits out some configuration for you. Open up /usr/local/etc/nginx/nginx.conf in your favourite text editor and paste this in.

Then you just need to create a virtual host

    server {
        listen 80;
        server_name foo.local;
        root /webapps/foo.com/public;
        passenger_enabled on;
    }

Provided you've added foo.local to your /etc/hosts file you should be able to start the server and see your site using 

    sudo nginx

## Running multiple virtual hosts

Passenger 3 adds a killer feature - the ability to run a standalone passenger and proxy using Nginx and TCP sockets. The process for this is to first setup a virtual host to proxy through to a socket

    upstream bar_upstream {
        server unix:/tmp/bar.local.socket;
    }

    server {
        listen 80;
        server_name bar.local;
        root /webapps/bar.local/public;
        location / {
            proxy_pass http://bar_upstream;
        }
    }

Then start a standalone instance of Passenger. This downloads and complies a new binary of Nginx for some reason

    passenger start --socket /tmp/bar.local.socket -d --nginx-version 0.8.53

This is explained in more detail on the [Phusion Blog][5]. Because the standalone passenger is invoked within an RVM context it is completely possible to have different ruby versions and gemsets. TOTAL WIN!

It should then be trivial use something like [Monit][4] to make sure that the process for virtual hosts is running and start / stop it. 

This setup can be applied to a Linux server too to create a flexible Rails stack with multiple hosts, Rubies and gemsets. 

[1]: http://github.com/mxcl/homebrew
[2]: http://www.rubyenterpriseedition.com/
[3]: http://rvm.beginrescueend.com/rvm/install/
[4]: http://mmonit.com/monit/
[5]: http://blog.phusion.nl/2010/09/21/phusion-passenger-running-multiple-ruby-versions/

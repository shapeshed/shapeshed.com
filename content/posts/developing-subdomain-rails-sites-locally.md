+++
date = "2010-07-29T00:00:00+01:00"
description = "Developing local Rails sites with subdomains can be a pain but thanks to a couple of public URLs it can be much simpler."
tags = ["Rails"]
title = "Developing subdomain Rails sites locally"
+++

## The problem

If you are developing a Rails site locally with subdomains and you boot your
application from WEBrick then you'll get a URL like http://0.0.0.0:3000. The DNS
for this resolves to your local machine so you'll be able to see the site
straight away with zero configuration.

The problem arises if you are developing an application that relies on
subdomains. So a user can create an account and access the application at
something like http://myaccount.example.com/. To get this working we need to a
bit of work.

## Solution 1 - WEBrick

To test subdomains you can just add a record to your hosts file. On Unix style
systems you can generally find this at /etc/hosts

```sh
127.0.0.1   theateam.example.com
```

This will resolve the domain to the application running on your localhost, but
you'll still need to apply the port number. So accessing
http://theateam.example.com:3000 will serve the site. You'll need to do the
logic as to what to show based on the subdomain in your application of course.

This solution is quicker to setup but has the disadvantage of having to add a
new record to your hosts file each time you create a subdomain.

## Solution 2 - Passenger

A much better way is to serve your site locally from Passenger. If you deploy
using Passenger you have the added advantage of developing on the same platform
that you'll be deploying to.

First you'll need to [install Passenger][1]. This is reasonably straightforward:

```sh
gem install passenger
```

Followed by

```sh
passenger-install-apache2-module
```

There will be some instructions after the second command that you'll need to add
passenger.conf file. Once that's done you need to set up the virtual host.

I've covered [serving sites locally on OSX][2] before so if you need a brush up
consult that article.

[Tim Pope][4] recognised the problem of subdomains and [registered the domain
smackaho.st][3] and pointed it to 127.0.0.1. This means it will resolve to your
local machine without any configuration. This means that we can set up a virtual
host based on this domain and use a wildcard to also serve subdomains on that
domain. Here's how my virtual host setup looks:

```apache
<VirtualHost *:80>
  <Directory /Users/george/Sites/mysite>
  Options +FollowSymlinks +SymLinksIfOwnerMatch
  AllowOverride All
  </Directory>
  DocumentRoot /Users/george/Sites/mysite/public
  ServerName smackaho.st
  ServerAlias *.smackahost.st
  RackEnv development
  # RailsEnv development # for Rails 2.x.x apps
</VirtualHost>
```

Restart Apache and you should be good to go

sudo apachectl restart

Now any subdomain you visit on smackahost.st will be served from your Rails
application. No need to keep adding subdomains to your hosts file.

There is also another domain that serves the same purpose if you prefer it -
lvh.me.

## Further reading

- [Installing Passenger][1]
- [tbaggery - Smack a Ho.st][3]
- [Setting up local websites on Snow Leopard][2]
- [Subdomains in Rails 3][4]

[1]: http://www.modrails.com/install.html
[2]: /setting_up_local_websites_on_snow_leopard/
[3]: http://tbaggery.com/2010/03/04/smack-a-ho-st.html
[4]: http://railscasts.com/episodes/221-subdomains-in-rails-3
[4]: http://tbaggery.com/

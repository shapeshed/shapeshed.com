+++
date = "2010-03-10T00:00:00+00:00"
description = "If you spend a lot of time in the console using Hirb is a great way to work faster and improve the output"
tags = ["Rails"]
title = "Easing Rails development with Hirb"

+++

## Rails Console

When developing in Rails I spend a lot of time in the console. If you are a Rails developer you know you can fire it up in rails 2.3.x with

    script/console

Once in the console you can do lots of things like run ActiveRecord queries

    >> User.find_by_last_name('Ornbo')
    => #<User id: 17283, login: "gornbo", email: "george@shapeshed.com", crypted_password: "05b80fd4308e8590d2892aeb774bb3a993053e26357a1a8938b...", password_salt: "rDRzbrh-YmgpTTTDGhQC", persistence_token: "109b4284438cd9c0238ebf1ffc6aea8091c8ad756c345677c2d...", single_access_token: "hqP7auU76mHQkpLxhqVI", perishable_token: "pwUKq8id1PhgCOhPkxIU", login_count: 4, failed_login_count: 0, last_request_at: "2010-03-09 18:09:35", current_login_at: "2010-03-08 11:17:13", last_login_at: "2010-03-08 10:52:05", current_login_ip: "127.0.0.1", last_login_ip: "127.0.0.1", deleted: nil, created_at: "2010-03-04 12:37:38", updated_at: "2010-03-09 18:09:35", first_name: "George", last_name: "Ornbo", photo_file_name: "avatar.jpg", photo_content_type: "image/jpeg", photo_file_size: 4268, photo_updated_at: "2010-03-04 18:15:30">
  
Ick. That's not hugely readable.

## Hirb to the rescue

[Hirb][1] is a gem that makes the console more user friendly. In hirb's words is is

> A mini view framework for console/irb that's easy to use, even while under its influence. Console goodies include a no-wrap table, auto-pager, tree and menu.

Returning to our previous version hirb makes the output useful

    >> User.find_by_last_name('Ornbo')
      User Load (40.2ms)   SELECT * FROM `users` WHERE (`users`.`last_name` = 'Ornbo') LIMIT 1
    +-------+------------+-----------+
    | id    | first_name | last_name |
    +-------+------------+-----------+
    | 17283 | George     | Ornbo     |
    +-------+------------+-----------+
    1 row in set

Nice. We've got the query and a concise, readable view.

So how do we get it to work? Documentation is available round the web but takes a little piecing together so here it is in one place.

## Installing Hirb

This is easy enough. Just run 

    sudo gem install hirb

To use hirb in Rails when you are using the console add a few lines to .ircbc. 

    vi ~/.irbrc

Then the following to the file 

    if ENV['RAILS_ENV']
      require 'rubygems'
      require 'hirb'
      require 'active_record'
      Hirb.enable
      ActiveRecord::Base.logger = Logger.new(STDOUT)
    end

Save and quit.

Now go into the console and run a query. You'll see that the output should be changed to use hirb. If your records have lots of columns you'll likely see

    ** Error: Too many fields for the current width. Configure your width and/or fields to avoid this error. Defaulting to a vertical table. **

So you'll need to customise it..

## Customising Hirb

You can set which columns are shown in the console and other options in a hirb.yml file. In the /config folder of your rails app create a file called hirb.yml. A feature that I really like is that you can specify which columns show for models. So for this example I can specify what shows for the User model using

    :output:
      User:
        :options:
          :fields:
            - id
            - first_name
            - last_name

Now when I run the query only those fields will show in the console as we saw earlier.  

    >> User.find_by_last_name('Ornbo')
      User Load (40.2ms)   SELECT * FROM `users` WHERE (`users`.`last_name` = 'Ornbo') LIMIT 1
    +-------+------------+-----------+
    | id    | first_name | last_name |
    +-------+------------+-----------+
    | 17283 | George     | Ornbo     |
    +-------+------------+-----------+
    1 row in set

In the project I'm working on I've created a configuration for each model so I only see what I need to see when working in the console. 

There are lots more options available - refer to the [Rdocs][2] for more good stuff. I've found hirb really useful so encourage you to give it a go. 

## Related links

* [Tagaholic: Hirb - Irb On The Good Stuff][3] - Great introduction to using Hirb
* [Hirb Github Repo / README][1] - The README and Source
* [Hirb RDocs][2] - The lowdown on Hirb
* [Railscast demonstrating Hirb][4] - Ryan Bates shows hirb in action

[1]: http://github.com/cldwalker/hirb
[2]: http://tagaholic.me/hirb/doc/
[3]: http://tagaholic.me/2009/03/13/hirb-irb-on-the-good-stuff.html
[4]: http://railscasts.com/episodes/176-searchlogic

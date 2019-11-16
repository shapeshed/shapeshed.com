+++
date = "2009-03-16T00:00:00+00:00"
description = "A tutorial on how to publish an ExpressionEngine website using Git and Capistrano."
tags = ["Linux", "ExpressionEngine"]
title = "Deploying ExpressionEngine with Git and Capistrano"

+++

## Prerequisites

I'm going to make a few assumptions in this article. Firstly that you are working on a POSIX compliant operating system. That might be OSX or Linux. This article does not support Windows although you might be able to get it working using <a href="http://www.chiark.greenend.org.uk/~sgtatham/putty/">Putty.</a> Secondly I'm assuming that you are comfortable working with the shell (in this case bash). 

## Software requirements 

* Git on the local and remote machine. <a href="http://git-scm.com/download/">Installation instructions here.</a>
* Ruby is installed on your local machine. (It ships with OSX).
* Capistrano is installed on your local machine. <a href="http://www.capify.org/getting-started/basics/">Installation options here.</a>
* <a href="/journal/using_shared_keys_with_ssh_on_centos_5/">SSH shared keys are set up between local and remote keys</a>
You have SSH access to your web server. 


## Capifying ExpressionEngine

In order to prepare ExpressionEngine for use with Capistrano we need to shift our folder structure around a tiny bit. For my development I normally have all my ExpressionEngine files in one folder. For Capistrano to be able to do the magic we need to move all public files to a folder called public. Then we also need to create a folder called config.

So now my site folder structure looks like this:

    - mysite.com
      - public (holds ExpressionEngine files)
      - config

Optionally you can add a README file for other developers to get quick information on the project. So now it looks like this

    - mysite.com
      - public
      - config
      - README

Then when you are in the mysite.com directory run the following command:

    capify .

This creates two files `Capfile` and `config/deploy.rb`. The latter is the one we are interested in - we'll come back to that when we configure deployment. 

## Source control

So now we've got a folder structure and our source code in the right folders. We are going to add the whole thing to git. In the the mysite.com directory run. (I assuming you have a bare git repo to push your commit to somewhere). You can find more information on setting up a bare git repo <a href="http://toolmantim.com/articles/setting_up_a_new_remote_git_repository">here.</a>  

    git init
    git add .
    git commit -m 'initial commit'
    git remote add origin git@yourserver.com:foo 
    git push origin master

Great - so now we've got a Capified folder structure and the source code in Git. 

## Publishing the website

We need to edit the `/config/deploy.rb` file. Here's my Capistrano recipe. 

    set :application, "mysite.com"

    set :repository,  "ssh://yourserver.com:/var/git/foo.git"
    set :scm, "git"
    set :branch, "master"

    set :deploy_to, "/var/www/vhosts/#{application}"
    set :deploy_via, :remote_cache
    set :copy_strategy, :checkout
    set :keep_releases, 3
    after "deploy:update", "deploy:cleanup" 
    set :use_sudo, false
    set :copy_exclude, [".git/*"] 
    set :copy_compression, :bz2

    role :app, "mysite.com"
    role :web, "mysite.com"
    role :db,  "mysite.com", :primary => true

    desc "This is here to overide the original :restart"
    deploy.task :restart, :roles => :app do
      # do nothing but overide the default
    end

Set the relevant paths and setting, save the file and you are done. 

## And deploy

Deploying an ExpressionEngine website is now just a case of 

    cap deploy

This does the following:

* Fetches the latest commit from your git repository
* Checks this against the remote cache and updates if necessary
* Copies the release to a new release in /releases
* Updates the symlink in current to the new release

That's it. The latest greatest version of your website is published.

## Advantages

Since moving to Capistrano for deployment I've saved a massive amount of time. I no longer have to track which files have changed and manually transfer them using FTP when a client is ready to deploy. I simply type one line on the command line and git does the heavy lifting for me. 

I can easily and quickly roll back if there are any problems.

## Shared folders

Advanced users might wish to use the Shared folder feature of Capistrano. This is a folder that shares content across releases. One example of this would be the FCKEditor folder that contains all the necessary code to generate a rich text editor. I don't particularly need to version this so I've extracted this from source control and it is in the shared folder. 

## More information

I appreciate that this tricky to set up so for more information the following links might be useful

* <a href="http://www.madebymany.co.uk/using-capistrano-with-php-specifically-wordpress-0087">Using Capistrano with PHP, specifically Wordpress</a>
* <a href="http://devblog.imedo.de/2008/6/23/wordpress-deployment-with-capistrano-2-and-git">Wordpress Deployment with Capistrano 2 and git</a>


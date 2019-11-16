+++
date = "2008-03-03T00:00:00+00:00"
description = "A tutorial on how to back up files on Linux using Amazon's S3 service. The end result is a cost-effective synchronised remote backup service."
tags = ["Linux"]
title = "Automating backups with Amazon S3 on Linux"

+++

## Backup Architecture

For the purpose of this tutorial we are going to design a simple backup service for a Linux server (in this case Centos 5). By reading further documentation you can customise your backup exactly how you would like to, but for now we are going to backup virtual host files to Amazon S3 using s3sync, a ruby script, and write to a log file once it is complete. The usual disclaimer applies here - no responsibility will be taken for following these instructions so use at your own risk. The server paths in the example are for Centos 5 so you may need to change these according to your own distribution. 

## Amazon S3

Amazon's S3 is a great service allowing developers to store and access files at very low cost. It is a viable option as a remote backup server and using the extremely handy s3sync the heavy lifting work has already been done for you. First you'll need an <a href="http://aws.amazon.com/s3">Amazon S3 account</a>. Once you have that in place to set things up you'll need your access key ID and your secret access key. To find these go to Your Web Services Account and choose AWS Access Identifiers.

## On your server

To use s3sync you need ruby to be installed. I found openssl was already installed on my server but you may need to get that too if you want to use ssl connections (you can use yum for this too). 

To get ruby use yum:

    yum install ruby

Once has installed check the version using

    ruby -v

You should see something like

    ruby 1.8.5 (2006-08-25) [i386-linux]

To use s3sync you need a version at 1.8.4 upwards. This tutorial assumes you download this to your home directory. If not you will need to change the paths in the example. The examples use "your-user" so you will obviously need to change that to whichever user you are using. Let's start by downloading, extracting s3sync and then removing the download:

    wget http://s3.amazonaws.com/ServEdge_pub/s3sync/s3sync.tar.gz
    tar xzf s3sync.tar.gz
    rm s3sync.tar.gz

Now you'll need to set up the configuration with the access keys you have from s3

    cd s3sync
    mkdir /etc/s3conf
    cp s3config.yml.example /etc/s3conf/s3config.yml
    vi /etc/s3conf/s3config.yml

Edit the file with the following lines

    aws_access_key_id: ------Your Access Key here ------
    aws_secret_access_key: ---- Your Secret Access Key here ------
    ssl_cert_dir: /home/your-user/s3sync/certs

Now we need to set up the SSL certificates so we can connect on a secure connection. I had some trouble setting up my certificates (I think because I am in Europe) so I used <a href="http://blog.eberly.org/2006/10/09/how-automate-your-backup-to-amazon-s3-using-s3sync/">John Eberly's example</a> and it worked fine. 

    mkdir /home/your-user/s3sync/certs
    cd /home/your-user/s3sync/certs
    wget http://mirbsd.mirsolutions.de/cvs.cgi/~checkout~/src/etc/ssl.certs.shar
    sh ssl.certs.shar

## Connecting to S3

You should be set up now to access S3. There are two scripts you can use to administer and set up your backups. Both s3sync and s3cmd are well documented at <a href="http://s3sync.net/wiki">s3sync</a> but I will take you through a basic setup. 

First we are going to set up a bucket for this server (as we may wish to back up others in the future). 

    cd /home/your-user/s3sync
    # Create the bucket (add -s to use ssl)
    ruby s3cmd.rb createbucket shapeshed.com

For this backup I'm going to backup my vhosts directory. Here's the command I use (I'm still in /home/your-user/s3sync).

    ruby s3sync.rb -r -s -v --exclude="cache$|captchas$" --delete /var/www/vhosts/ shapeshed.com:/vhosts > /var/log/s3sync

Let's go through the options

* `-r` This tells the script to act recursively including everything in the folder
* `-s` This tells the script to use SSL. We certainly want to do this if there is any sensitive information being transmitted and I'd recommend doing this by default anyway.
* `-v` This tells the script to be verbose, meaning it should show output all messages to the terminal.
* `--exclude="cache$|captchas$"` This tells the script to exclude certain folders or files based on a regular expression. In this example I want to exclude any folders called cache or captchas.
* `/var/www/vhosts/` This is path to the folder that you want to back up. Bear in mind that this backs up everything in the folder.
* `--delete` This tells the script to delete any obsolete files. So it will remove files you have deleted on your local server from the mirror.
* `shapeshed.com:/vhosts` This is first the bucket that you want to use (this is the one we created earlier), and then the prefix you would like. I'm backing up my vhosts so vhosts is a good one for me.
* `> /var/log/s3sync` This tells the script to log the output into a log file. This is optoinal but I like to keep an eye on things. You'll need to make sure your user has permissions to write to the file or the script will error. This is crude logging as it will only log the last sync.

You can run the script with a dry run by using the additional `--dryrun` flag and this will show you everything the script will do without it actually doing it. You can also use the `-d` flag to debug the script. Depending on the size of your folder syncing can take some time so be patient. That's it - you now have a remote backup of your files that is likely to cost cents rather than dollars per month. If any files or folers are subsequently removed from or added to `/var/www/vhosts/` when you run the script again your remote copy will be updated to mirror your folder.

## Automating the task

To take all the administration out of this task you can automate the backup using cron. First we need to put the command into file so cron can use it.

    mkdir /home/your-user/shell_scripts
    cd /home/your-user/shell_scripts
    # Create and edit the file
    vi s3backup.sh

Copy the script you want to run as a cron job into this file, ensuring you specify the full path to your ruby script. Rember to add `#!/bin/bash` or whichever shell you use at the top of the script.

    #!/bin/bash
    ruby /home/your-user/s3sync/s3sync.rb -r -s -v --exclude="cache$|captchas$" --delete /var/www/vhosts/ shapeshed.com:/vhosts > /var/log/s3sync

Save this file and then set up the cron job

    crontab -e
    # Add the following line. This runs the backup every Sunday at 6am
    0 6 * * 0 /home/your-user/shell_scripts/s3backup.sh


The backup will now run at 6am every Sunday without any further input from you. You can check the script is running ok by checking `/var/log/s3sync` (if you have created it). If you want to do it more frequently just change the cron timings.

## Problems?

I understand this is a slighly fiddly config set up for newcomers to Linux. I'm an intermediate Linux user and found everything I needed at <a href="http://s3sync.net/wiki">s3sync.net</a>. There is excellent documentation as well as a forum where you can search for common problems and ask for help if you need it. This is an open source project so bear in mind that developers will probably point you to the documentation first so be sure to read it.



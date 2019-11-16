+++
date = "2009-09-04T00:00:00+01:00"
description = "A short tutorial on setting up local websites on Snow Leopard."
tags = ["OSX", "Apache", "PHP"]
title = "Setting up local websites on Snow Leopard"

+++

Not keen on the command line? Using something like [MAMP][1] may be a better option for you. I'm using vi to edit the files but feel free to use your text editor of choice (TextMate, emacs etc). 

## Step 1 - Creating your site

On OSX websites are stored in /Users/yourname/Sites so it is a good idea to store your site in there. Let's create a site in there. Note you'll need to change yourname in the example to whatever your name is. 

    cd /Users/yourname/Sites 
    mkdir mysite.com 
    cd mysite.com 
    printf "My awesome site" > index.html 

Great - we've created our site. Now let's set up Apache.

## Step 2 - Setting up Apache

First we need to allow virtual hosts by uncommenting a line in the Apache config file 

    sudo vi +/'# Virtual hosts' /etc/apache2/httpd.conf

Change 

    #Include /private/etc/apache2/extra/httpd-vhosts.conf

to  

    Include /private/etc/apache2/extra/httpd-vhosts.conf

Save the file and exit

## Step 3 - Adding the virtual host

Now we can add the virtual host 

    sudo vi /etc/apache2/extra/httpd-vhosts.conf

Add the following to the end of the file. Remember to change 'yourname' to whatever your name is and also 'mysite.com' to whatever your site folder name is. ServerName is the name you will use to access the site from a browser so if you want something specific change it.  

    <VirtualHost *:80> 
      <Directory /Users/yourname/Sites/mysite.com> 
        Options +FollowSymlinks +SymLinksIfOwnerMatch
        AllowOverride All 
      </Directory> 
      DocumentRoot /Users/yourname/Sites/mysite.com 
      ServerName mysite.local 
    </VirtualHost> 

## Step 4 - Setting your hosts file

As there is no DNS associated with your site we need to set this. 

    sudo vi /etc/hosts

Add the following. This relates to the ServerName you set in the Step 2 

    127.0.0.1 mysite.local

## Step 4 - Start Apache

Now we just need to start apache 

    sudo apachectl start

If you see  

    org.apache.httpd: Already loaded

Then it is already running so restart it using  

    sudo apachectl restart

Now open a browser and visit [http://mysite.local/][2] (or whatever ServerName you set). All being well you should see a page displaying "My awesome site"

## Step 5 - Enable PHP

If you need PHP then this needs to be enabled. You can do this using 

    sudo vi +/php5_module /etc/apache2/httpd.conf

Change 

    #LoadModule php5_module libexec/apache2/libphp5.so

to 

    LoadModule php5_module libexec/apache2/libphp5.so

Then save and exit. Finally we need to restart apache: 

    sudo apachectl restart

Now lets see if PHP is running ok: 

    cd /Users/yourname/Sites 
    cd mysite.com 
    printf "<?php phpinfo() ?>" > index.php 

Now if you open a browser and visit http://mysite.local/index.php you should see the phpinfo() page. Apache is set to serve index.html before index.php so if you delete the index.html you will also be able to access the phpinfo() page at http://mysite.local.

All done! To add further sites just repeat steps 3, 4 and 5.

 [1]: http://www.mamp.info/en/index.html
 [2]: http://mysite.local

{
  "title": "Domain forwarding in Apache",
  "date": "2008-02-16T00:00:00+00:00",
  "description": "Here's a short tutorial on one way to forward one domain to another in Apache, keeping Google happy as we go along.",
  "tags": [
    "Linux",
    "Apache"
  ]
}

## The disclaimer bit

First of all this tutorial is based on Apache 2.2 on Centos 5. No responsibility will be taken for things going wrong so use at your own risk!

## What we want to achieve

Let's say we have a client who wants to forward three domains to one. For this example let's use: 

* www.ilovemymonkeys.com 
* www.monkeysarecool.com 
* www.monkeysrockmyworld.com 

The domain the client wants all of these forwarded to is 

* www.monkeyworld.com 

## Is it really worth it?

Well not really no. If you can persuade the client it is probably best to park these additional domains that have been registered. There is not going to be a great deal of benefit, if any, for SEO. But if you really need to do it here's how. 

## What you'll need

This article assumes you have command line access to your box. If you don't then you'll need to contact your hosting company and explain your requirements

## Virtual hosts

It is likely you'll be using [Name Based Virtual Hosts][1] in Apache. If you haven't set up Virtual Hosts it is a great way to manage sites so be sure to read up on it. Presuming you have an entry for `monkeyworld.com` we need to edit/create it in our virtual hosts file. The location of where you should place this varies depending on what flavour of Linux you are running. On Centos 5 you can create a file in `/etc/httpd/conf.d` with the appendix .conf and it will be picked up when Apache is started.  

    vi /etc/httpd/conf.d/httpd-vhosts.conf 

Edit the file as follows.

    NameVirtualHost *:80 
    # Monkey World 
    <VirtualHost *:80> 
      <Directory /var/www/vhosts/monkeysarecool.com/httpdocs> 
        AllowOverride All 
      </Directory> 
        DocumentRoot /var/www/vhosts/monkeysarecool.com/httpdocs 
        ServerName www.monkeysarecool.com 
        ServerAlias ilovemonkeys.com monkeysarecool.co.uk monkeysrockmyworld.co.uk 
        ServerAlias www.ilovemonkeys.com www.monkeysarecool.co.uk www.monkeysrockmyworld.co.uk 
        Include /var/www/vhosts/monkeysarecool.com/conf/vhost.conf 
    </VirtualHost> 

You'll see the lines Server Alias have listings for the domains both with `www` and without. This ensures you can receive requests with and without `www`. I like to put them on separate lines so I can see I have what's happening.

Finally there is an Include line. This points to an additional configuration file for the domain. You could use an `.htaccess` file here but if you have root access to the box it is much more efficient performance wise to put it in an additional configuration file.

## Forwarding the domain

So far we've set up requests for Apache to serve up `monkeyworld.com` for our additional domains. You could leave it like this and restart Apache to have the same content served up on these domains. This is a bad thing for Google though and it is likely your rankings will slip down with duplicate content on multiple domains. 

So we want to forward the domain. To do that lets open our additional configuration file: 

    vi /var/www/vhosts/monkeysarecool.com/conf/vhost.conf

Edit the file as follows.

    RewriteEngine On
    RewriteCond %{HTTP_HOST} ^(monkeyworld.com|ilovemonkeys.com|monkeysarecool.co.uk|monkeysrockmyworld.co.uk) [NC] 
    RewriteRule ^(.*)$ http://www.monkeyworld.com$1 [R=301,L]

    RewriteCond %{HTTP_HOST} ^(www.ilovemonkeys.com|www.monkeysarecool.co.uk|www.monkeysrockmyworld.co.uk) [NC] 
    RewriteRule ^(.*)$ http://www.monkeyworld.com$1 [R=301,L]

We're using Apache's [mod_rewrite][2] to send redirect requests and return a 301 Moved Permanently Header. This should help Google and any other bots to understand what we're doing. Again I like separate entries for with and without `www` but that's personal preference.

Save this file. We should be done but before restarting Apache let's test that we haven't made any syntax errors that will stop the server from starting up. 

    /etc/init.d/httpd configtest

If you get "Syntax OK" you are good to restart the server: 

    /etc/init.d/httpd restart

All done! So now when you hit `www.ilovemonkeys.com`, `monkeysarecool.co.uk` or `monkeysrockmyworld.co.uk` you will be forwarded `www.monkeyworld.com`, with the address being changed as well.

 [1]: http://httpd.apache.org/docs/2.2/vhosts/
 [2]: http://httpd.apache.org/docs/2.2/mod/mod_rewrite.html

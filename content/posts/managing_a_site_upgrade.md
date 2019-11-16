+++
date = "2007-11-16T00:00:00+00:00"
description = "Upgrading a site can be a nerve-wracking process. But it doesn't have to be. Here are some tips to make the whole process easier."
tags = ["Apache", "Opinion"]
title = "Managing a site upgrade"

+++

## Backups

Before you start take a backup of absolutely everything. You should assume that your upgrade will fail and you should be able to roll back quickly in the event of problems. Back up your database and source code. This article is a guide and no responsibility will be taken!

## Users

Firstly and most importantly you will want to minimise disruption to users. Perform the maintenance at a time when site traffic is low. You can check your access logs to see when this is. For the UK between 6 a.m and 8 a.m is a good time. 
Create a friendly maintenance page informing users what is going on and when they can expect the site to be back online. Many maintenance pages lose the look and feel of the site - this for me is lazy and you should maintain your look and feel. Give a long estimate incase anything goes wrong. If there is anything critical that users won't be able to perform during the upgrade offer an alternative means of communication

## Search Engines

Although the site is likely to be offline for a very short time we need to keep search engines happy and let them know what is happening. We'll come onto it later but we'll use a temporary redirect to tell search engines that the site pages not being available is not permanent.

## Clients

If you are performing an upgrade for a client make sure you communicate closely with them. They should be aware of what you are doing, when it will occur and how long it will take. Explain the reasons for the upgrade and assure them that backups are being taken and a plan is in place if anything goes wrong.

## Security

During the life of an upgrade it is possible that errors will occur and that paths and other sensitive information may be shown to users. Further on in this article we'll be using an .htaccess file to redirect everyone else to a maintenance page. This means if there are any errors the rest of the world won't see them.

## Hiding the upgrade

When you are ready upload the maintenance page to your server. Check it is ok. We will now hide the site and redirect everyone to the maintenance page using an .htaccess file. Using a texteditor create the following file and save it as .htaccess 

    # Don't redirect the redirect
    RewriteCond %{REQUEST_URI} !/maintenance.html$
    # Allow access to the stylesheet
    RewriteCond %{REQUEST_URI} !/css/screen.css$
    # Allow access to the site from your IP
    RewriteCond %{REMOTE_HOST} !^000.000.000.000
    RewriteRule $ /maintenance.html [R=302,L]

You need to replace 000.000.000.000 with your IP address. You can find out your IP address [here][1]. So if your IP address is 123.456.789.123 you should change it to 123.456.789.123. If you are using any image files on your maintenance page you will also need a rule to allow those files to be served.

In the rewrite rule we are using a 302 redirect. This is a temporary redirect so any Search Engines will know that this is not permanent. When you are happy upload the .htaccess file to the root of your site. You should be able to see the site but anyone outside your IP should get redirected to the maintenance page. You can test this by temporarily changing the IP address. You should then also be redirected. Remember to change it back when you are done!

So you now have a hidden site that you can work on safe in the knowledge that everyone else is seeing the maintenance page. Upload your new files and database and get it working! If you have problems you should have your backups to roll back.

All being well when you have your site working you can remove the lines above from your .htaccess file to open the site up! Not that nerve-wracking now was it?

 [1]: http://www.whatsmyip.org/

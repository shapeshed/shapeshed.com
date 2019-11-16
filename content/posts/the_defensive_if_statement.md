+++
date = "2008-03-03T00:00:00+00:00"
description = "The if statement is probably the most common in any programming language. But using it with a defensive philosphy can make applications more bulletproof and extensible."
tags = ["Opinion"]
title = "The Defensive If Statement"

+++

## A hostile environment

The web is an extremely hostile environment. Users on the web can access sites in a myriad of different ways causing a huge number of variables including:

*   The browser they are using and the capabilities of that browser
*   Local preferences on the browser 
*   Broadband connection speed
*   Screen Resolution

But the list of variables is not just limited to users. Servers have hugely different configurations and can also cause headaches.

So how do you deal with all these variables?

## I know best

The "I know best" philosophy suggests that developers know more things than they don't in the design environment. They design applications with the idea that they understand the design environment and the variables within it. The application is tested for the requirements at that time and matches these requirements so everyone is happy. So what's the problem?

The problem is when the application grows, changes or moves environments. The fact that the application has not anticipated change is a fundamental flaw in the application design and one that can be negated by simply coding defensively. 

## Coding defensively

Coding defensively can help limit these issues by anticipating issues and accounting for them. It is proactive coding rather than reactive coding. By assuming nothing you are actually anticipating problems and dealing with them before they happen. It is likely that in many cases you won't see the error when it happens as you have already anticipated it and dealt with it. 

## An example

Let's take the example of an Apache .htaccess file. It is common for many web developers to use the .htaccess file to redirect pages with Rewrite rules.

For example removing www: 

    Options +FollowSymLinks
    RewriteEngine On
    RewriteBase /
    RewriteCond %{HTTP_HOST} !^yourdomain\.com$ [NC]
    RewriteRule ^(.*)$ http://yourdomain.com/$1 [R=301,L]

The issue is if the mod_rewrite module is not available in Apache you'll get a nice 500 Internal Error message. But you can prevent this with a simple if statement: 

     <IfModule mod_rewrite.c>
    # put any rules relating to the mod_rewrite module here 
    </IfModule>

If the module is not available it will be ignored, so no error. It is a simple if statement that avoids an error. 

## A cross-language philosophy

This article is less about examples and more about the idea of using an if statement to test for things that may or may not be available. Here's an example in Javascript where we are looking for an element with the id "clickme". Have a look at this code: 

    var clickme = document.getElementById("clickme");
    clickme.onclick = function(){
      // run some code
    } 

There's two points at which this script could fail. Firstly if the browser doesn't support getElementByID and secondly if an element with the id of clickme does not exist. We can fix that with a couple of defensive if statements: 

    if(!document.getElementById) { return; }
    var clickme = document.getElementById("clickme");
    if (!clickme) { return; }
    clickme.onclick = function(){
      // run some code
    }

Via a couple of defensive if statements we have bulletproofed the script. It anticipates things that might not be available and provides an exit strategy if they are not. If the browser does not support getElementById the script will exit and if an element with the id of clickme is not present it will also exit. So you won't a javascript error. This is also good for future-proofing the code. The markup on the page may well change and if the element with the id of clickme is removed the script will not error. 

## A simple philosophy

The defensive if statement is a simple philosphy that assumes nothing but accounts for everything. Whilst you would be a robot if you anticipated everything you will make your application more maintainable and bulletproof by thinking about this whilst you are designing and creating your application. The benefits are numerous and it is such a simple idea to adapt you would be a fool not to.

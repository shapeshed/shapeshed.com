+++
date = "2009-01-15T00:00:00+00:00"
description = "If you missed the post on the Yahoo Developer Network blog, YQL now supports microformats. This is a great addition to the YQL."
tags = ["Yahoo"]
title = "YQL supporting microformats"

+++

## Yahoo Query Language

If you haven't seen the [Yahoo Query Language][1] you should definitely check it out. It has a [handy console][2] where you can test queries and for anyone who writes SQL on a regular basis it should be pretty straight forward to construct a query and see the results that you get. It will even generate the REST query for you to drop into your scripts, outputting a choice of XML or JSON. You can look through the many APIs that Yahoo offer including Flickr, Upcoming.

## A supra-API

Any developer who uses APIs on a regular basis knows that understanding and interrogating APIs is made more difficult by that fact that no standards exist for methods and syntax within APIs. YQL pulls together APIs to allow you to interrogate a variety of APIs through a standardised language. Yahoo call this YQL but for all intents and purposes it is SQL. So to query Flickr for photos of London that are geotagged you could use. 

    select * from flickr.photos.search where has_geo="true" and text="london" 

This generates the REST query 

    %}http://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20flickr.photos.search%20where%20has_geo%3D%22true%22%20and%20text%3D%22london%22&format=xml

You can use this to get data however you like - JavaScript, CLI, PHP or whichever server-side language you prefer.

## Adding semantic markup

Adding Microformats adds a rich layer of semantic information to this supra-API. YQL [supports joins][3] so already we can create views of data from multiple sites using this service. Welcome to "View Source" your way for data.

## Why this is good

When I started working on the web six years ago I thought of the web as a giant fileserver that was grossly underused in terms of access to data. In recent years I've realised that it is actually a giant network that can read, write and learn from other nodes. APIs have emerged as an initial way to share data between sites but for this to truly emerge, we need a standard means of sharing data and ultimately of granting permissions. The web community have worked through, and are still working through standards in client side technologies, but APIs are still at the beginning. YQL should be commended for using technologies that work very well on a local network to apply them to the internet in general. I for one can't wait to get hacking with Microformats in the YQL. More reason that you should [start using Microformats][4].

[1]: http://developer.yahoo.com/yql/
[2]: http://developer.yahoo.com/yql/console/
[3]: http://jonathantrevor.net/?p=40
[4]: http://microformats.org/

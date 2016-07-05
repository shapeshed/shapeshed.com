{
  "layout": "post",
  "title": "Populating forms with YQL, jQuery and Microformats",
  "date": "2009-02-16T00:00:00+00:00",
  "description": "YQL recently began supporting Microformats. This is great because we can do useful things easily like populate form data without even refreshing the page.",
  "tags": [
    "Yahoo",
    "JavaScript",
    "Microformats"
  ]
}

## Demo

Not interested in the explanation? [Skip to the demonstration][1] to see it working

## How the example works

The example uses jQuery to fetch JSON using YQL which in turn gets the data from Microformats enabled pages. Three things and lots of clever brains joining together to make semantic data goodness. If you'd like to look through the source you can download it or fork it from [Github.][2]

## YQL + Microfomats = WIN

YQL is a neat implementation by [Yahoo!][3] that provides a layer over selected APIs and data from across the web. For most web developers the syntax will be familiar as it is pretty much standard SQL. It returns either XML or JSON and removes the pain of interrogating and parsing API data. Recently it was announced that YQL [would support Microformats][4]. Great - so developers now have easy access to Microformats data without having to build complicated parsers.

## What does that mean?

Well the possibilities are endless. That's the power of the [semantic web][5]. But for this example I'm going to suppose that Microformats really are a way to solve the problem of having your personal information distributed around the web in various locations. Being distributed is not really a problem but when the only authority for the information is an individual human it is. Having to change instances of your information manually becomes a maintenance headache - your data can easily be forgotten and go out of date.

Why not instead use a Microformats enabled HTML page that can be interrogated by a parser (in this instance YQL) to update or populate information? Much like DNS nameservers but for personal information. So when I want to fill out a form I can enter a URL, hit a button and the work is done. The information is stored in one place, and is maintained by the authority (me) and then distributed around the internet by machines. Hurrah - the robots are taking over.

## Imagine the possibilities

Given that personal data is tied to the unique identifier of a URL it doesn't really matter where information is stored. It might be my last.fm account, my facebook page or my personal website. Finally personal data can be stored in one place. 

Granted this model needs an additional layer to say where the authority lies. On forms a human (me) can physically put the URL in, but there is no reason why a DNS model couldn't work for this. If we can embrace open standards and a model that works well for domain names we could have a workable system for personal information.

## Issues

Yes - there are issues of standards, privacy, security, and permissions but [some][6] [clever][7] [people][8] are already tackling those. If I don't have to put my details into every single site, every single time I'll be happy. We are getting there...

You can see [the demonstration][1] or [fork the code from GitHub][2].

 [1]: http://shapeshed.com/examples/hcardme/
 [2]: http://github.com/shapeshed/hcardme/tree/master
 [3]: http://www.yahoo.com/
 [4]: http://developer.yahoo.net/blog/archives/2009/01/yql_with_microformats.html
 [5]: http://en.wikipedia.org/wiki/Semantic_Web
 [6]: http://microformats.org/
 [7]: http://openid.net/
 [8]: http://oauth.net/

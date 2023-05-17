+++
date = "2008-01-30T00:00:00+00:00"
description = "I'm currently taking part in a study at the University of East London looking at making the web more accessible to users with Intellectual Disabilities. Along with Lisa Haskel I'm looking at ways to use image library APIs to help improve accessibility for ID users.\n"
tags = ["AJAX", "JavaScript", "DOM", "Accessibility"]
title = "Using Flickr to help users with Intellectual Disabilities"
+++

## Background

[Inclusive New Media Design][1] is a research project which aims to identify the
best ways to encourage web designers and developers to build websites accessible
to people with Intellectual Disabilities. In a hugely interesting first session
I heard Simon Evans talk on the whole question of defining intellectual
disabilities and how ID users use and interpret the web. I must confess it was
not something I knew a great deal about but Simon holds a wealth of knowledge in
this area and was very good at communicating it.

During the first session we looked a few of the sites available to ID users and
how symbols form a key part of being able to use and interpet the web. A few of
the providers include:

- [Widgit Literacy][2]
- [PCS][3]
- [Makaton][4]
- [Change Picture Bank][5]

You can see how symbols are used at [Symbol World][6]. The idea is that words
are associated with symbols making them easier to understand for ID users.
Symbols are not free though - they come with a commercial license making it
difficult to create parsers, bookmarks or browser extensions without paying a
huge fee.

## An Idea

During the workshop Lisa Haskel mentioned she had created a script to pull
images from Yahoo's image API to show images for words. Could this be a viable
alternative for symbols or could a simliar technique be used to convert pages
into ID friendly symbol based pages? For now it seems licensing makes the symbol
approach a non-starter but it certainly is possible to call an API for words and
get images back.

## A very alpha implementation

In the spirit of releasing early and often here's an alpha release of the idea.
The script sends an AJAX call to Flickr's API and gets a response for each of
the words in the sting submitted. This is then written to the page via some DOM
scripting. Nothing amazing at this stage but it is more about the idea.

You can see [the example here][7] (Firefox only at the moment) and download the
[source code here][8]. It is released under a [Creative Commons
Attribution-Noncommercial-Share Alike 3.0 Unported License][9] so feel free to
build on it if you wish.

![Fetching images from Flickr for users with Intellectual Disabilities][10]

At this stage it would seem to work very well for nouns but not so well for
other words.

## To do

In terms of a feature list I can see the following being useful:

- Checking against a list of stop words and serving images based on those words.
  E.g. Me could show an image of the user
- Splicing the API call with another data source. This may be an RSS feed of
  news items so ID users can read the news
- Provide some local caching so the more it is used the more a local dataset if
  built
- Providing some way of rating images returned if that is appropriate
- Creating a bookmark or automated plugin so that ID user do not have to invoke
  the script

I'm not sure all of these ideas are in line with licensing but we'll have to
see. Hopefully a few more ideas will come out of the next workshop and from ID
users there too.

## Ideas?

What do you think? Is this a total non-starter or is this worth persuing?

[1]: http://www.inclusivenewmedia.org/
[2]: http://www.widgit.com/symbols/index.htm
[3]: http://www.mayer-johnson-symbols.com/
[4]: http://www.makaton.org/
[5]: http://www.changepeople.co.uk/
[6]: http://www.symbolworld.org/
[7]: /examples/inmd/
[8]: /downloads/inmd_0.1.zip
[9]: http://creativecommons.org/licenses/by-nc-sa/3.0/
[10]: /images/articles/inmd_alpha.jpg

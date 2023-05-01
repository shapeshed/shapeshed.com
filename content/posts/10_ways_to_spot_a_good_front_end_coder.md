+++
date = "2007-05-14T00:00:00+01:00"
description = "Front-end coding is certainly a craft and there are some amazing people doing it. When I visit a good site I often rummage around in the undergrowth to learn from the Masters. Here are ten practices I commonly see from the best coders.  "
tags = ["XHTML", "Opinion", "Web Standards", "CSS"]
title = "10 ways to spot a good front-end coder"
+++

## It looks good naked

On good sites I find that the page will still makes sense with stylesheets
turned off. If it does make sense then it is a good sign that the document has
been coded semantically. This is good news for search engines, accessibility and
maintainability. Good coders will always use the right HTML tools for the job,
and you can see this by turning styles off.

If you are browsing using Firefox you can turn stylesheets off by hitting CTRL
Shift S on Windows or Apple Shift S on OSX

## It scales well

I always like to see if I can increase the font size on a design. I look to see
that the design scales without the layout breaking. Often design items like
curved boxes do not enlarge with text. The best coders will make sure that
design elements scale without breaking. Dan Cederholm formed much of this
philosophy in his excellent book [Bulletproof Web Design.][1]

If you are using Firefox you can increase the font by pressing CTRL ++ on
Windows or Apple Shift + on OSX.

## It prints well

I check whether there is a print stylesheet in the code and then preview it to
see how it is designed. A carefully thought out print stylesheet is a strong
sign of a talented coder. Print stylesheets are a real strength of CSS and it is
a great shame if they are not used.

In Firefox you can preview how a page prints by going to File > Print Preview on
Windows or File > Print > Print Preview on OSX.

## No images? No problem.

I look for the site to continue to be usable with images turned off and for
meaningful alt text to have been given to the images. This is good for users who
browse with images turned off and improves the accessibility and SEO of the
site.

If you install the [Web Developer Toolbar][2] for Firefox you can have a look at
sites with images turned off. Go to Images > Disable Images > All Images.

## Love for typography

I always like to look closely at the typography on a site. If a little care and
attention has been given to the type it really makes a difference. I find that
typography is a good sign of coders who give an extra polish to their work.

## It [almost] validates

If I like a site eventually I will glance to the bottom right of my browser
where two plugins give me more clues to the quality of the code. [HTML Tidy][3]
and [Firebug][4] sit there quietly and show whether there are any HTML or
Javascript errors. I'm not obsessed with validation but if a site is error free,
or just has a few errors it is always a good sign.

## It works ok without Javascript

If I find some AJAX or event driven elements on a page I like to see what
happens when Javascript is turned off. If someone has gone to the trouble of
making sure the site degrades well without Javascript then this is another
excellent sign.

You can turn Javascript off using the [Web Develper Toolbar][2] in Firefox. Go
to Disable > Disable Javascript > All Javascript.

## The document size is reasonable

Checking the size of the document gives me an idea of how quickly the page is
likely to load. I look for a document size of under 175k, and ideally much
lower, so that the site will load quickly and that the user won't suffer long
download times. Making sure the page load time is acceptable is a skill in
itself and on a very rich site it is often an education to see how it is done.

You can check the document size using the [Web Develper Toolbar][2] in Firefox.
Go to Information > View Document Size.

## CSS is commented

Looking at the CSS file on good sites I often find a clearly commented
stylesheet. This is a great sign that the site has been coded with
maintainability in mind. A quick glance at ids and classes given to divs is
another way to see a good coder. With good coders you will usually be able to
understand where the div is without viewing the source.

## Microformats in the house

Microformats have emerged as an excellent way to give HTML documents extra
semantic meaning. Finding microformats on a site is a sign that the latest
developments in HTML are being followed. It is a sign that the coder knows their
stuff and that they are likely to stay on top of future developments.

You can see if a site has microformats by using the [Firefox Tails Export
plugin.][5]

Our industry is unique in that you can see the inner working of someone's work
at any time from anywhere. Learning from others by looking over and appreciating
their work is a great way to improve skills.

How do you assess good front end coding?

[1]: http://www.simplebits.com/publications/bulletproof/
[2]: http://chrispederick.com/work/web-developer/
[3]: http://users.skynet.be/mgueury/mozilla/
[4]: http://www.getfirebug.com/
[5]: https://addons.mozilla.org/en-US/firefox/addon/2240

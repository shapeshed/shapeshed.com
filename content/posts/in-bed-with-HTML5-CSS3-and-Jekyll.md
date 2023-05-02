+++
date = "2009-11-05T00:00:00+00:00"
description = "I've redesigned my portfolio site to take advantage of HTML5, CSS3 and Jekyll, a static site generator."
slug = "in-bed-with-HTML5-CSS3-and-Jekyll"
tags = ["HTML5", "CSS3", "Ruby", "Personal"]
title = "In bed with HTML5, CSS3 and Jekyll"
+++

## Oh no - not again!

One of the main drivers of wanting to redesign was a desire to move to HTML5.
The <a href="http://dev.w3.org/html5/spec/">specs</a> are coming along nicely
and browser support is surprisingly good. Internet Explorer is the least HTML5
friendly (i.e. no support) but thankfully clever
<a href="http://ejohn.org/blog/html5-shiv/">people</a> have
<a href="http://remysharp.com/2009/01/07/html5-enabling-script/">already solved
this</a>. By adding the following into your <code>&lt;head&gt;</code> element
Internet Explorer will interpret HTML5 correctly. If you can sleep at night with
the understanding that it won't work for IE users with no JavaScript then there
is nothing stopping you.

```html
<!--[if IE]>
  <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->
```

## If you can see this...

<iframe src="https://player.vimeo.com/video/33020750?title=0&amp;byline=0&amp;portrait=0" width="640" height="480" allowFullScreen></iframe>

<a href="https://vimeo.com/33020750">HTML5 is alive</a> from
<a href="https://vimeo.com/shapeshed">George Ornbo</a> on
<a href="https://vimeo.com">Vimeo</a>.

..you are in the future.

HTML5 brings the ability for browsers to play video natively. No need for any
third party players - it just plays. Granted
<a href="http://www.microsoft.com/windows/Internet-explorer/default.aspx">some
browsers</a> aren't quite up to speed but there are ways around this and I'll
blog about this shortly. Most readers of this blog use a browser that is
compatible with HTML5 video. For those that don't use a compatible browser they
can always download the video and watch it offline.

To convert videos from the .flv format I was using I wrote a
<a href="http://gist.github.com/223459">shell script</a>. This converts the
files to HTML5 compatible .mp4 and .ogv formats. If you want to use it you'll
need <a href="http://ffmpeg.org/">ffmpeg</a> and
<a href="http://v2v.cc/~j/ffmpeg2theora/">ffmpeg2theora</a>. All videos on this
site now use HTML5.

## Moved to Jekyll

I've moved the site to
<a href="http://wiki.github.com/mojombo/jekyll">Jekyll</a>, a static site
generator written in <a href="http://www.ruby-lang.org/">Ruby</a>. I'd already
<a href="http://shapeshed.github.com/">created one site</a> using Jekyll and had
felt liberated by it. With the help of Ruby Zen Master
<a href="http://jaseandtonic.com/">Jason Cale</a> I've been learning more Ruby.
I'm used to the command line so working with text files feels right to me. I've
also moved the comments on this site to <a href="http://disqus.com/">Disqus</a>.
It has always felt slightly wrong that I own other peoples comments and that
they cannot edit or remove them. Disqus addresses this by giving comment authors
ownership of what they write (if they choose to login of course). I moved
comments over from <a href="http://expressionengine.com/">ExpressionEngine</a>
using <a href="http://gist.github.com/202802">this script</a>.

I'm still a big fan of ExpressionEngine and
<a href="http://rubyonrails.org">Rails</a> for client sites but the fact I can
easily publish a medium sized blog as a static site makes Jekyll extremely
attractive to me. There no performance better than a static site and there is
nothing more secure than a site with just HTML.

If you'd like to learn more about Jekyll check out the
<a href="http://wiki.github.com/mojombo/jekyll">GitHub repository</a> and/or
read Tom Preston-Werner's post
<a href="http://tom.preston-werner.com/2008/11/17/blogging-like-a-hacker.html">Blogging
Like a Hacker</a>.

## Progressive enhancement and browser support

Using CSS3 means that users with more capable browsers will have a better
experience. But I've taken measures to tweak the design for Internet Explorer
users in particular and the site is compatible with IE6 upwards. Even so I've
added the <a href="http://shapeshed.github.com/ie6-notice/">IE6 Notice</a> that
I created to the site to encourage IE6 users to upgrade.

I've never had a problem with less capable browsers being served a slightly
different site. I happily used <code>-moz-border-radius</code> and
<code>-webkit-border-radius</code> on the previous incarnation of this site.

![Vienna Screenshot][1]

## Desktop and web design

I'll admit here that I have an itch about making a compelling desktop experience
on the web. Web technologies are evolving and the browser is progressively
absorbing more of the tasks that were traditionally the domain of the desktop.
The new design is unashamedly inspired by OSX and the desktop applications
therein. Basically I wanted to see how close I could get to a desktop interface
on the web, and I feel I've got pretty close.

## Realigning the business

Previously I've pimped myself as a full-service agency. In reality I'm a one man
shop and my most rewarding work has come when I have been hired as a specialist
as part of a larger team. I've also been creating more web applications as
opposed to traditional content sites and I'm keen to to move deeper into
programming and interface design rather than just support content sites for
small to medium sized businesses. I'd really like to start talking more too and
I think removing the facade of being an 'agency' will help that. I'm going to
have to learn to come out of the shadows though..

My first ever talk is next week at the
<a href="http://www.meetup.com/londoneers/calendar/11667855/">London
ExpressionEngine Meetup</a>. Come along!

[1]: /images/articles/border_radius_comparison.webp

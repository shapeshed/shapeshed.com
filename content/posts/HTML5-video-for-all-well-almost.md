+++
date = "2009-11-09T00:00:00+00:00"
description = "How to use HTML5 video and make it work for Internet Explorer"
slug = "html5-video-for-all-well-almost"
tags = ["HTML5"]
title = "HTML5 video for all (well almost)"
+++

Can't wait? You can view the <a href="/examples/video-for-all/">example here</a>
or <a href="/downloads/video-for-all.zip">download</a>
it here. Excuse my ugly mug..

## In-browser video

HTML5 brings the ability to <a href="/journal/HTML5-video-element/">play video
natively in the browser</a> without any requirements for third party plug-ins
like <a href="http://get.adobe.com/flashplayer/">Flash</a> or
<a href="http://silverlight.net/">Silverlight</a>. Developers rejoiced until
they realised that whilst Webkit and Gecko browsers have support Internet
Explorer is yet to implement any aspect of HTML5. Queue much crying into a
hankerchief.

But all is not lost. You can still use HTML5 video for capable browsers and fall
back to Flash for Internet Explorer. Here's how:

## The markup

```html
<!--[if IE]>
  <script src="http://ajax.googleapis.com/ajax/libs/swfobject/2.2/swfobject.js"></script>
<![endif]-->
<video id="player" controls>
  <source src="path/to/your/movie.mov" />
  <source src="path/to/your/movie.ogv" />
  To view this video you need the latest version of
  <a href="http://www.apple.com/safari/">Safari</a>,
  <a href="http://www.mozilla.com/firefox/">Firefox</a> or
  <a href="http://www.google.com/chrome">Chrome</a>. Alterantively download the
  videos and watch them offline.
  <a href="path/to/your/movie.mov">Windows / Mac (mp4)</a>,
  <a href="path/to/your/movie.ogv">Linux (ogv)</a>
</video>
<!--[if IE]>
  <script type="text/javascript">
    var flashvars = {};
    var params = {
      allowscriptaccess: "true",
      file: "../video/mov/movie.mov",
    };
    var attributes = {};

    swfobject.embedSWF(
      "swf/player.swf",
      "player",
      "640",
      "480",
      "9.0.0",
      flashvars,
      params,
      attributes
    );
  </script>
<![endif]-->
```

## Explanation

We're using
<a href="http://msdn.microsoft.com/en-us/library/ms537512(VS.85).aspx">conditional
comments</a> to serve IE using
<a href="http://code.google.com/p/swfobject/">SWFObject</a> and the
<a href="http://www.longtailvideo.com/">LongTail Player</a>, everyone's favorite
method of embedding flash unobtrusively. HTML5 capable browsers get to play the
video using the video element, whilst IE will fall back to the old skool flash
player. Providing your video is encoded correctly it will also play on the
iPhone. So almost everyone (I'll come onto that in a minute) is a winner. This
degrades well too - non-compatible browsers (older Gecko & Webkit, IE & Opera)
are invited to download the video to view offline.

## Why don't you just use flash?

Given the ubiquity of flash that's a good question. The answer is I like open
standards that anyone can use. It makes publishing content easier and the web in
general more interoperable. Open = Good. If you want to know more buy me a beer
and I'll bore you for an hour or so. Making it easy and cheap to publish and
share content is the whole point of the web for me. Open standards go a long way
to making that happen.

## Issues

There are still some issues to be resolved with this technique and if you have
any solutions please haalp! I'm a <del>damsel</del> developer in distress.

### Opera

Firstly <a href="http://www.opera.com/">Opera</a> is still yet to implement
HTML5 video in their major releases. They have implemented video in a number of
Labs projects but to date (as far as I know) this technique won't work in
Opera's mainstream releases. If anyone knows more about the state of HTML5 Video
at Opera I'd love to know - I can't find much on the web other than a statement
of intent from
<a href="http://dev.opera.com/articles/view/a-call-for-video-on-the-web-opera-vid/">November
2007</a>.

### iPhone

The iPhone will play correctly encoded videos natively but it is a bit more
picky. The
<a href="http://developer.apple.com/safari/library/documentation/AppleApplications/Reference/SafariWebContent/CreatingVideoforSafarioniPhone/CreatingVideoforSafarioniPhone.html#//apple_ref/doc/uid/TP40006514-SW1">Safari
Reference Guide</a> has more information on encoding video for the iPhone. If
you want to use this technique for video on the iPhone you'll need to pay
attention to the spec and adjust your videos accordingly. In particular your
video can't be bigger than 640 x 480 at 30 fps. From the specs I can't see any
way around these limitations.

## Encouraging stuff

Look what we've done - open video for most and a viable alternative for Internet
Explorer users. I'm sure the clever bods at Opera will catch up soon and we are
done. Internet Explorer might just catch up in 2013, but at least with this
method they don't miss out on watching your video.

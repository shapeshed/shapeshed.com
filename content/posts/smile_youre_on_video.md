+++
date = "2010-05-20T00:00:00+01:00"
description = "In a big step for the open web Google open sourced the VP8 video codec yesterday at the I/O conference in San Francisco."
tags = ["Google", "HTML5"]
title = "Smile You're on Video"
+++

## An attempt to solve the video issue

The video tag is now well established in [HTML5 specification][16]. I've
[written previously][3] about cross-browser problems, namely the complete lack
of support in Internet Explorer and that different codecs are used by different
browser vendors. To use HTML5 to serve video and access all users web authors
face using two different methods (flash and the video tag). On top of that
authors are currently required to export two different video formats to support
differing codecs.

When I created [this demo][2] I it was great that I could now use a browser API,
rather than a third party plugin. But the fact I was doing more work to use this
method and duplicating videos seemed a bit counter intuitive. What happened to
don't repeat yourself?

From a developer perspective anyone that has worked with [ffmpeg][4] soon
realises the complexity of different video formats, frame rates, video sizes and
codecs. But from an end user perspective (and that is always the most important)
creating a video for use on the web is still a bewildering prospect. Of course
you can use a service like [Vimeo][5] or [YouTube][6] but video is such an
integral part of the web that it should be possible to easily create content for
the web, and it should be open.

## Enter Google on a white horse

It would seem Google agrees that video should be open. Earlier this year Google
purchased On2 Technologies, a video compression business and with it the [VP8
video codec][7]. In the week that [Microsoft launched a patent suit][8] against
Salesforce and Adobe and Apple [continue][9] to [squabble][10] about who is
really open Google did something incredible. They open sourced the VP8 codec.
That's the VP8 codec they acquired for $124.6 million. Opera and Mozilla are
[also][11] [on board][12] with this effort which leaves just Apple, who are
championing the H.264 format. Even Microsoft will be [supporting VP8 in
IE9][18].

It will be interesting to see how Apple respond. They have invested heavily in
the H.264 codec for both their desktop and browser products. With Google Chrome
being based on Webkit and covered by a BSD license, Apple could presumably
leverage the work that Google has already done for their Safari browser. If
Apple hold out it looks probable that web authors would continue to have to
publish two video formats to ensure cross-browser compatibility leaving us in
much the same boat.

## A good day for the open web

This announcement should be celebrated as a step forward for the open web.
Google have shared a commercial product under a BSD license that they paid over
millions of dollars for in the interests of the web as a whole. At a time when
other companies are arguing about how open they really are Google can have their
moment in the sun.

## Related links

- [Google I/O YouTube channel][13] - Watch the keynote
- [Opera builds for VP8][12] - Download links under the second paragraph
- [Microsoft to support VP8 in IE9][18] - Supported if the codec is installed
- [Firefox WebM builds for VP8][14] - WebM enabled Nightly builds for Firefox
- [WebM and VP8 land in Chromium][15] - Chromium announcement on VP8
- [Working draft of HTML5 video spec][17] - Current work in progress for the
  HTML5 video spec

[1]: /HTML5-video-element/
[2]: /examples/HTML5-video-element/
[3]: /HTML5-video-for-all-well-almost/
[4]: http://www.ffmpeg.org/
[5]: https://vimeo.com/
[6]: https://www.youtube.com/
[7]: http://en.wikipedia.org/wiki/VP8
[8]: http://37signals.com/svn/posts/2341-microsoft-patent-trolls-salesforce
[9]: http://www.apple.com/hotnews/thoughts-on-flash/
[10]:
  http://www.nowpublic.com/tech-biz/adobe-apple-ad-campaign-we-love-apple-open-letter-apple-2616766.html
[11]: http://blog.mozilla.com/blog/2010/05/19/open-web-open-video-and-webm/
[12]: http://dev.opera.com/articles/view/opera-supports-webm-video/
[13]: https://www.youtube.com/googledevelopers
[14]: http://nightly.mozilla.org/webm/
[15]: http://blog.chromium.org/2010/05/webm-and-vp8-land-in-chromium.html
[16]: http://www.whatwg.org/specs/web-apps/current-work/
[17]: http://www.whatwg.org/specs/web-apps/current-work/multipage/video.html
[18]:
  http://windowsteamblog.com/windows/b/bloggingwindows/archive/2010/05/19/another-follow-up-on-html5-video-in-ie9.aspx

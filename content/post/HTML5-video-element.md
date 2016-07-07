{
  "slug": "HTML5-video-element",
  "title": "The HTML 5 Video Element",
  "date": "2009-06-05T00:00:00+01:00",
  "description": "HTML 5 makes adding video to your site a great deal easier with video tag. Issues of videos codecs, browser support and accessibility need to be resolved but somewhere down the line video will get a whole lot easier. ",
  "tags": [
    "HTML5",
    "Browsers"
  ]
}

Not interested in the explanation? [Go straight to the example.][1]

## Current best practice

Current best practice is to use [SWFObject][2] to write a player like the [JW FLV Media Player][3] or [Flow Player][4]. Both of these are Flash players so if users don't have Flash or JavaScript they get no video. Web authors can offer alternative HTML content through this method but it has always felt clunky.

## A shiny new element

Enter HTML 5 and the video element. No need to use a third party player - video is available within the HTML specification. Here's how you would add a video to your page: 

    <video src="/video/your_video.ogg" controls="true">
    Your browser doesnt support the video tag. You can <a href="/video/your_video.ogg">download the video here.</a>
    </video>

The following attributes are available:

    <dl>
      <dt>src</dt>
      <dd>The gives the address of the video</dd>
      <dt>poster</dt>
      <dd>This gives the address of an image to show when video data is not available</dd>
      <dt>autobuffer</dt>
      <dd>This hints to the user agent that the content is likely to be used</dd>
      <dt>autoplay</dt>
      <dd>This auto starts the video</dd>
      <dt>loop</dt>
      <dd>This will loop the video</dd>
      <dt>controls</dt>
      <dd>Choose whether to show video controls or not</dd>
      <dt>width</dt>
      <dd>The width of the video</dd>
      <dt>height</dt>
      <dd>The height of the video</dd>
    </dl>


## Issues

There are ongoing issues that need to be resolved, not least of which is browser support. Currently Firefox supports the ogg codec whilst Safari supports h.264. Opera is also supporting the .ogg format. Secondly anyone who has worked with videos will understand the plethora of codecs. Some of these are open formats, others are proprietary. For the proprietary codecs browser vendors will need to decide whether to fork out for expensive licenses or just support open codecs. Finally the accessibility question needs to be addressed. Should accessibility be embedded in the browser player (subtitles, transcript) or should this be handled another way?

## Likely to be a while

Ubiquitous support for the video element is likely to be a long way off but at some point using video on a site is going to be much easier and developers won't need to rely on third party players - it will be part of the browser. 

[See the HTML 5 video demo.][1]

## Further reading

*   [HTML 5 Working Draft - The Video Element][6] 
*   [YouTube’s HTML5 Page][7]
*   [The Dailymotion HTML5 Demo][8] 
*   [The HTML5 Video Tag's Fatal Flaw][9] 

 [1]: http://shapeshed.com/examples/HTML5-video-element/
 [2]: http://blog.deconcept.com/swfobject/
 [3]: http://www.longtailvideo.com/players/jw-flv-player/
 [4]: http://flowplayer.org/
 [5]: /video/your_video.ogg
 [6]: http://www.whatwg.org/specs/web-apps/current-work/#video
 [7]: http://www.youtube.com/html5
 [8]: http://blog.dailymotion.com/2009/05/27/watch-videowithout-flash/
 [9]: http://sandfly.net.nz/blog/2009/05/the-html5-video-tags-fatal-flaw/

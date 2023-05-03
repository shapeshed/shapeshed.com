+++
author = "George Ornbo"
date = "2013-12-16T20:26:00Z"
original = "http://pebblecode.com/blog/christmas-hugs-hug-humanity/"
slug = "christmas-hugs-hug-humanity"
tags = ["Christmas"]
title = "Christmas Hugs - Hug Humanity"
+++

### Hugs for everyone

It is Christmas. A time to give out love to all humanity. Even the ones you
don’t really like. Christmas Hugs is a simple idea that you can use your browser
and a webcam to record a short 2 second hug and share it with humanity.

### Make a hug and share it

The idea is simple. Allow the browser access to you webcam or camera and record
a hug in two seconds.

This isn’t an app that is going to make you feel sexy or rich. It will make you
smile though. Here’s what some people made.

![](/images/articles/hugs1.gif)

![](/images/articles/hugs2.gif)

![](/images/articles/hugs3.gif)

![](/images/articles/hugs4.gif)

The project is different because the video and the creation of the hug is all
done in the browser through HTML5 APIs and JavaScript. It showcases what is
possible in the browser and what can be achieved with Web Standards and no
plugins.

### The technical bit

The app uses the
[getUserMedia API](http://dev.w3.org/2011/webrtc/editor/getusermedia.html) to
use a webcam or camera on the user’s device. The video stream is piped to a
video element. A canvas context then has an image drawn to it from a frame in
the video at regular intervals. Then
[gif.js](http://jnordberg.github.io/gif.js/) library reads the canvas context
again at regular intervals, spawns a couple of web workers and creates an
animated gif from the images.

###  Challenges

The client-side part of the application was completed relatively quickly. Within
a few hours it was generating an animated gif and rendering it to the browser.
Another hour or later there was a super simple RESTful API to allow hugs to be
shared with other people. Things were going well. We then started to render the
hugs on the browser only to see that they were not animating. This was a bug.
Some head scratching later it became clear that the dataURI being generated was
wrong. gif.js gives you a blob and finally the FileReader API allowed us to
solve it and the DataURL was generated correctly.

```javascript
gif.on('finished', function(blob) {
  var reader = new FileReader();
  reader.onload = function(e){
    api.model.save({
      dataUri: reader.result
    });
  };
  reader.readAsDataURL(blob);
};
```

###  Potential Features

- Push new hugs in realtime to connected clients
- Supporting rating hugs
- Pagination
- Create a ‘wall of hugs’.
- Promote a hug of the day.

###  Credits

- [Aaron Patterson](http://tenderlovemaking.com/) and
  [chat.meatspac.es](https://chat.meatspac.es/) for the insipiration.
- [Gif.js](http://jnordberg.github.io/gif.js/) for a the client-side gif
  generation.
- [This Mozilla article](https://hacks.mozilla.org/2013/07/the-making-of-face-to-gif/)
  for providing a few pointers.

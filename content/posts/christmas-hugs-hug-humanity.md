+++
author = "George Ornbo"
date = "2013-12-16T20:26:00Z"
original = "http://pebblecode.com/blog/christmas-hugs-hug-humanity/"
slug = "christmas-hugs-hug-humanity"
tags = ["Christmas"]
title = "Christmas Hugs - Hug Humanity"

+++

<h3>Hugs for everyone</h3>

<p>It is Christmas. A time to give out love to all humanity. Even the ones you don&rsquo;t really like. Christmas Hugs is a simple idea that you can use your browser and a webcam to record a short 2 second hug and share it with humanity.</p>

<h3>Make a hug and share it</h3>

<p>The idea is simple. Allow the browser access to you webcam or camera and record a hug in two seconds.</p>

<iframe width="420" height="315" src="//www.youtube.com/embed/2wfBzkEVMUs" allowfullscreen></iframe>

<p>This isn&rsquo;t an app that is going to make you feel sexy or rich. It will make you smile though. Here&rsquo;s what some people made.</p>

<p><img src="https://31.media.tumblr.com/936f5cf444a1e728112d056fb86811e9/tumblr_inline_mxwvki657q1qz7kgs.gif" alt=""/><img src="https://31.media.tumblr.com/3973d7cfd6511965d9eeb9f5b9b4a483/tumblr_inline_mxwvljLikA1qz7kgs.gif" alt=""/><img src="https://31.media.tumblr.com/6dd0d26a726ecf7e97d4266141b4e70a/tumblr_inline_mxx117pu8J1qz7kgs.gif" alt=""/><img src="https://31.media.tumblr.com/b77b14c0d42fa18ba331b38927973c13/tumblr_inline_mxwvmaWXOZ1qz7kgs.gif" alt=""/></p>

<p>The project is different because the video and the creation of the hug is all done in the browser through HTML5 APIs and JavaScript. It showcases what is possible in the browser and what can be achieved with Web Standards and no plugins.</p>

<h3>The technical bit</h3>

<p>The app uses the <a href="http://dev.w3.org/2011/webrtc/editor/getusermedia.html">getUserMedia API</a> to use a webcam or camera on the user&rsquo;s device. The video stream is piped to a video element. A canvas context then has an image drawn to it from a frame in the video at regular intervals. Then <a href="http://jnordberg.github.io/gif.js/">gif.js</a> library reads the canvas context again at regular intervals, spawns a couple of web workers and creates an animated gif from the images.</p>

<h3> Challenges</h3>

<p>The client-side part of the application was completed relatively quickly. Within a few hours it was generating an animated gif and rendering it to the browser. Another hour or later there was a super simple RESTful API to allow hugs to be shared with other people. Things were going well. We then started to render the hugs on the browser only to see that they were not animating. This was a bug. Some head scratching later it became clear that the dataURI being generated was wrong. gif.js gives you a blob and finally the FileReader API allowed us to solve it and the DataURL was generated correctly.</p>

<pre><code>gif.on('finished', function(blob) {
  var reader = new FileReader();
  reader.onload = function(e){
    api.model.save({
      dataUri: reader.result
    });
  };
  reader.readAsDataURL(blob);
};
</code></pre>

<h3> Potential Features</h3>

<ul><li>Push new hugs in realtime to connected clients</li>
<li>Supporting rating hugs</li>
<li>Pagination</li>
<li>Create a &lsquo;wall of hugs&rsquo;.</li>
<li>Promote a hug of the day.</li>
</ul><h3> Credits</h3>

<ul><li><a href="http://tenderlovemaking.com/">Aaron Patterson</a> and <a href="https://chat.meatspac.es/">chat.meatspac.es</a> for the insipiration.</li>
<li><a href="http://jnordberg.github.io/gif.js/">Gif.js</a> for a the client-side gif generation.</li>
<li><a href="https://hacks.mozilla.org/2013/07/the-making-of-face-to-gif/">This Mozilla article</a> for providing a few pointers.</li>
</ul>

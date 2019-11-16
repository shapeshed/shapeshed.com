+++
author = "George Ornbo"
date = "2014-11-05T20:37:00+00:00"
original = "http://pebblecode.com/blog/pumpi-a-raspberry-pi-in-a-pumpkin/"
slug = "pumpi-a-raspberry-pi-in-a-pumpkin"
tags = ["hacks"]
title = "Pumpi - A raspberry pi in a pumpkin"

+++
<p>pebble {code}&rsquo;s latest hack day theme was hardware. It happened to fall on Halloween. So the natural thing to do was to combine Halloween and hardware. So why not put a Raspberry Pi in a pumpkin and make it make some scary sounds?</p>

<p><img src="https://31.media.tumblr.com/92d4d992253bb941abe19f89ea486d4b/tumblr_inline_nel2kiawb91qz7kgs.jpg" alt=""/></p>

<h2>Making an LED flash</h2>

<p>I was new to working with the GPIO on the Raspberry Pi and after a brief effort to get an analogue sensor working I decided to go back to basics and get an LED flashing. This turned out to be the hardest part of the hack. After briefly failing to compile python and node modules (not enough memory) I began to despair. Thankfully around about this time new employee <a href="https://github.com/jazlalli">Jaz Lalli</a> turned up. We found <a href="http://wiringpi.com/">Wiring Pi</a> a GPIO interface written in C.</p>

<p>Taking the example code we knocked up a script to blink the LED</p>

<pre><code>#include &lt;wiringPi.h&gt;
int main (void)
{
  wiringPiSetup () ;
  pinMode (0, OUTPUT) ;
  for (;;)
  {
    digitalWrite (0, HIGH) ; delay (500) ;
    digitalWrite (0,  LOW) ; delay (500) ;
  }
  return 0 ;
}
</code></pre>

<p>It didn&rsquo;t work. We soon realised that the GPIO number was wrong and the pin map we&rsquo;d be referring to didn&rsquo;t match the GPIO library. After fixing that we were set and quickly added five more LEDs all blinking in unison.</p>

<h2>The Pumpkin</h2>

<p><a href="https://twitter.com/tobyhunt">Toby Hunt</a> stepped up and went to our local supermarket and carved the pumpkin. By this stage we had flashing red lights inside the carved pumpkin.</p>

<h2>Adding sound</h2>

<p>The initial idea was to use a proximity sensor to trigger a sound whenever anyone walked by the pumpkin. We found some scary sounds and thought we were all set. There was one problem though - we didn&rsquo;t have a proximity sensor.</p>

<p>Instead we decided to make it possible to tweet at the pumpkin using a hashtag. The pumpkin would read out the tweet.</p>

<p>To listen for tweets was quite straightforward - a node script listened on the api for the hashtag #pumpkinpi. In terms of reading out the sound we first tried <a href="http://www.cstr.ed.ac.uk/projects/festival/">Festival</a> to read out the tweets. This was ok but the voice was far too friendly. We needed spookiness.</p>

<p>Jaz discovered this script to convert text to speech via the Google translate api</p>

<pre><code>#!/bin/bash
say() { local IFS=+;/usr/bin/mplayer -ao alsa -really-quiet -noconsolecontrols "http://translate.google.com/translate_tts?tl=en&amp;q=$*"; }
</code></pre>

<p>This worked really well but again the voice was too friendly. As far as our research went there is no way to change the voice on this api. After some research we discovered that mplayer can play the audio at half speed with the following flag <code>-speed 0.5</code>. This was terrifying!</p>

<p>The hack was complete.</p>

<blockquote class="instagram-media" data-instgrm-captioned data-instgrm-version="3" style=" background:#FFF; border:0; border-radius:3px; box-shadow:0 0 1px 0 rgba(0,0,0,0.5),0 1px 10px 0 rgba(0,0,0,0.15); margin: 1px; max-width:658px; padding:0; width:99.375%; width:-webkit-calc(100% - 2px); width:calc(100% - 2px);"><div style="padding:8px;"><div style=" background:#F8F8F8; line-height:0; margin-top:40px; padding:50% 0; text-align:center; width:100%;"> <div style=" background:url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACwAAAAsCAMAAAApWqozAAAAGFBMVEUiIiI9PT0eHh4gIB4hIBkcHBwcHBwcHBydr+JQAAAACHRSTlMABA4YHyQsM5jtaMwAAADfSURBVDjL7ZVBEgMhCAQBAf//42xcNbpAqakcM0ftUmFAAIBE81IqBJdS3lS6zs3bIpB9WED3YYXFPmHRfT8sgyrCP1x8uEUxLMzNWElFOYCV6mHWWwMzdPEKHlhLw7NWJqkHc4uIZphavDzA2JPzUDsBZziNae2S6owH8xPmX8G7zzgKEOPUoYHvGz1TBCxMkd3kwNVbU0gKHkx+iZILf77IofhrY1nYFnB/lQPb79drWOyJVa/DAvg9B/rLB4cC+Nqgdz/TvBbBnr6GBReqn/nRmDgaQEej7WhonozjF+Y2I/fZou/qAAAAAElFTkSuQmCC); display:block; height:44px; margin:0 auto -44px; position:relative; top:-22px; width:44px;"></div></div><p style=" margin:8px 0 0 0; padding:0 4px;"> <a href="https://instagram.com/p/u0oVPQgqf9/" style=" color:#000; font-family:Arial,sans-serif; font-size:14px; font-style:normal; font-weight:normal; line-height:17px; text-decoration:none; word-wrap:break-word;" target="_top">Fruits of our labour @pebblecode hack day. Blinking jackolantern that reads out tweets. Natch.</a></p><p style="font-family:Arial,sans-serif;color:#c9c8cd; font-size:14px; line-height:17px; margin-bottom:0; margin-top:8px; overflow:hidden; padding:8px 0 7px; text-align:center; text-overflow:ellipsis; white-space:nowrap;">A video posted by Jasdeep Lalli (@jazlalli) on <time style=" font-family:Arial,sans-serif; font-size:14px; line-height:17px;" datetime="2014-10-31T15:44:05+00:00">Oct 10, 2014 at 8:44am PDT</time></p></div></blockquote>

<script async defer src="//platform.instagram.com/en_US/embeds.js"></script>

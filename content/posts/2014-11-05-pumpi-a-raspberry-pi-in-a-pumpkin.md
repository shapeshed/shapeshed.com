+++
author = "George Ornbo"
date = "2014-11-05T20:37:00+00:00"
original = "http://pebblecode.com/blog/pumpi-a-raspberry-pi-in-a-pumpkin/"
slug = "pumpi-a-raspberry-pi-in-a-pumpkin"
tags = ["hacks"]
title = "Pumpi - A raspberry pi in a pumpkin"
+++

pebble {code}’s latest hack day theme was hardware. It happened to fall on
Halloween. So the natural thing to do was to combine Halloween and hardware. So
why not put a Raspberry Pi in a pumpkin and make it make some scary sounds?

![](/images/articles/tumblr_inline_nel2kiawb91qz7kgs.jpg)

## Making an LED flash

I was new to working with the GPIO on the Raspberry Pi and after a brief effort
to get an analogue sensor working I decided to go back to basics and get an LED
flashing. This turned out to be the hardest part of the hack. After briefly
failing to compile python and node modules (not enough memory) I began to
despair. Thankfully around about this time new employee
[Jaz Lalli](https://github.com/jazlalli) turned up. We found
[Wiring Pi](http://wiringpi.com/) a GPIO interface written in C.

Taking the example code we knocked up a script to blink the LED

```c
#include <wiringPi.h>
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
```

It didn’t work. We soon realised that the GPIO number was wrong and the pin map
we’d be referring to didn’t match the GPIO library. After fixing that we were
set and quickly added five more LEDs all blinking in unison.

## The Pumpkin

[Toby Hunt](https://twitter.com/tobyhunt) stepped up and went to our local
supermarket and carved the pumpkin. By this stage we had flashing red lights
inside the carved pumpkin.

## Adding sound

The initial idea was to use a proximity sensor to trigger a sound whenever
anyone walked by the pumpkin. We found some scary sounds and thought we were all
set. There was one problem though - we didn’t have a proximity sensor.

Instead we decided to make it possible to tweet at the pumpkin using a hashtag.
The pumpkin would read out the tweet.

To listen for tweets was quite straightforward - a node script listened on the
api for the hashtag #pumpkinpi. In terms of reading out the sound we first tried
[Festival](http://www.cstr.ed.ac.uk/projects/festival/) to read out the tweets.
This was ok but the voice was far too friendly. We needed spookiness.

Jaz discovered this script to convert text to speech via the Google translate
api

```sh
#!/bin/bash
say() { local IFS=+;/usr/bin/mplayer -ao alsa -really-quiet -noconsolecontrols "http://translate.google.com/translate_tts?tl=en&q=$*"; }
```

This worked really well but again the voice was too friendly. As far as our
research went there is no way to change the voice on this api. After some
research we discovered that mplayer can play the audio at half speed with the
following flag `-speed 0.5`. This was terrifying!

The hack was complete.

> [Fruits of our labour @pebblecode hack day. Blinking jackolantern that reads out tweets. Natch.](https://instagram.com/p/u0oVPQgqf9/)
>
> A video posted by Jasdeep Lalli (@jazlalli) on Oct 10, 2014 at 8:44am PDT

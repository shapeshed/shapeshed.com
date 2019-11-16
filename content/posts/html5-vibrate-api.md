+++
date = "2014-01-03T07:50:56+00:00"
description = "The HTML5 Vibrate API allows you to trigger vibration on a device."
slug = "html5-vibrate-api"
tags = ["HTML", "JavaScript"]
title = "The HTML5 Vibrate API"

+++

## Make me vibrate

Mobile and tablet devices have become hugely prevalent in how users access the web. So much so that Walmart reported that on Black Friday over 50% of traffic was via mobile traffic. This is good news for developers as these devices come with a range of capabilities that are largely accessible through HTML5. You can get access to the camera and audio on these devices and you can also trigger vibration on a device.

The HTML5 Vibration API is a W3C Candidate Recommendation and as such browser vendors are using vendor prefixes. We can normalise this easily though. 

    navigator.vibrate = navigator.vibrate ||
                      navigator.webkitVibrate ||
                      navigator.mozVibrate || 
                      navigator.msVibrate;

You can check for browser support like this

    navigator.vibrate = navigator.vibrate ||
                      navigator.webkitVibrate ||
                      navigator.mozVibrate || 
                      navigator.msVibrate;

    if (navigator.vibrate) {
      console.log('we can vibrate');
    } else {
      console.log('no vibration for you :-(');
    }

## Usage

To make a device vibrate is a simple as 

    navigator.vibrate(500);

The number value is the time in milliseconds that the device should vibrate for. 

You can also trigger a number of vibrations by passing an array. Every second value represents the delay before the next vibration in the array should be triggered.

    navigator.vibrate([1000, 1000, 500]);

In the above example the device will vibrate for a second, wait for a second and then vibrate for half a second. 

To stop vibration immediately you can do this.

    navigator.vibrate(0);

## Browser support

I wasn't able to find any good documentation on browser support for the HTML5 Vibrate API so I knocked up a quick test and ran it against my mobile and tablet devices.

At the time of writing the following are supported

* Google Chrome Beta for Android
* Firefox for Android

At the time of writing the following are unsupported

* Safari for iOS7
* Google Chrome for Android

Now you know how to go and create your [dildonics][4] startup.

## References 

* [W3C Vibration API][1]
* [How to use the HTML5 Vibration API][2]
* [HTML5 Vibration API with Code Examples][3]

[1]: http://www.w3.org/TR/vibration/
[2]: http://www.sitepoint.com/use-html5-vibration-api/
[3]: http://jaspreetchahal.org/html5-vibration-api-with-code-examples/
[4]: http://www.urbandictionary.com/define.php?term=dildonics

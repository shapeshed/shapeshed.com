+++
date = "2014-01-13T21:34:15+00:00"
description = "The HTML5 Battery Status API allows you to access information about the battery status of a machine through a browser."
slug = "html5-battery-api"
tags = ["HTML", "JavaScript"]
title = "HTML5 Battery Status API"

+++

## How much charge do we have?

With the HTML5 Battery Status API you can gain access to battery information for the host machine of the browser you are using. The uses for this might be to reduce operations that use battery life in your application if the battery is low or show battery graphics. You can get access to battery information through `navigator.battery`. Particularly for mobile devices I can see this being really useful.

This returns a JavaScript object with battery status information. 

    navigator.battery

    {
      charging: true,
      chargingTime: 0,
      dischargingTime: Infinity,
      level: 1,
      onchargingchange: null,
      onchargingtimechage: null,
      ondischargingtimechange: null,
      onlevelchange: null 
    }


You will notice a number of events that you can bind to

    navigator.battery.onchargingchange = function () {
      console.log(navigator.battery.charging);
    }

    navigator.battery.onchargingtimechange = function () {
      console.log(navigator.battery.chargingTime);
    }

    navigator.battery.oncdischargingtimechange = function () {
      console.log(navigator.battery.dischargingTime);
    }

    navigator.battery.onlevelchange = function () {
      console.log(navigator.battery.level);
    }


You could use these to update graphics or change application behaviour when battery life or status changes.

## Browser support

At the time of writing the Battery Status API is candidate recommendation but my experience of browser support is poor. I wasn't able to find much information on the status of this API. In my current version of Chromium (31.0.1650.63) it is unsupported either as `navigator.battery` or `navigator.webkitBattery`. I found that my version of Firefox (26.0) is supported but only default values are returned so the browser isn't able to read battery status. 

## References 

* [W3C Battery Status API][1]
* [MDN Battery Status API][2]

[1]: http://www.w3.org/TR/battery-status/
[2]: https://developer.mozilla.org/en-US/docs/WebAPI/Battery_Status

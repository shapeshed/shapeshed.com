+++
author = "George Ornbo"
date = "2011-10-18T10:28:12+01:00"
original = "http://pebblecode.com/blog/titanium-native-mobile-apps-with-javascript/"
slug = "titanium-native-mobile-apps-with-javascript/"
tags = ["android", "iOS", "iPad", "iPhone", "mobile"]
title = "Titanium - native mobile apps with JavaScript"
+++

At pebble.it the development team have been working hard to get up to speed with
[iOS](http://www.apple.com/ios/) so that we can support our clients’ growing
requirements for mobile applications.

The team have reached a good level of understanding on iOS even diving into
[OpenGL](http://www.opengl.org/) to create a complex drawing application.

With most of the team coming from a web background we’ve been keeping a close
eye on frameworks like [Phonegap](http://www.phonegap.com/) and
[Titanium](http://www.appcelerator.com/).

Inspired by the wonderful
[wunderlist](http://www.6wunderkinder.com/wunderlist/), which is built on
Titanium, we had a closer look at Titanium.

### One API to rule them all

One issue we’ve discussed as a team is the fact that in developing mobile apps
there are multiple SDKs and frameworks to master. Just as soon as you’ve got to
grips with Objective-C and the iPhone SDK there’s Android and Blackberry. To
date our philosophy has been let’s get really good at iOS. We are still
following that but Titanium allows us to support other platforms, at least on a
superficial level.

Here’s some code from the default scaffolding app. If you are familiar with
JavaScript it should read easily to you.

```javascript
//
// create base UI tab and root window
//
var win1 = Titanium.UI.createWindow({
  title: "Window 1",
  backgroundColor: "#fff",
});
var tab1 = Titanium.UI.createTab({
  icon: "KS_nav_views.png",
  title: "Foo!",
  window: win1,
});

var label1 = Titanium.UI.createLabel({
  color: "#999",
  text: "I am window 1",
  font: { fontSize: 20, fontFamily: "Helvetica Neue" },
  textAlign: "center",
  width: "auto",
});
```

This is the code behind creating a tabbed window with a label for both iOS and
Android:

![](https://media.tumblr.com/tumblr_lfq8rvv7DE1qz7kgs.jpg)

For more checkout the
[API documentation](http://developer.appcelerator.com/apidoc/mobile/latest) and
[Code Examples](http://developer.appcelerator.com/blog/2010/05/sample-code-and-resources.html).

### Strengths

Titanium has surprisingly good coverage of the APIs for iOS and Android.
Installing the
[KitchenSink application](https://github.com/appcelerator/KitchenSink) on a
device shows just what you can do with it.

It is quickly apparent that it would be possible to scaffold an application for
both Android and iOS in no time.

The fact that Titanium creates native applications using just JavaScript is a
huge draw.

### Weaknesses

Installation didn’t go smoothly, leading me to the forums where I found lots of
other developers who were having problems getting Titanium off the ground. I
followed the advice of a couple of posts, fixing a bug in the Python source, and
had to fiddle around with a number of things on Android to get it working.

Documentation and walkthroughs are a little light and I ended up learning from
the source. Some might argue that this is the best way to learn anyway but it
would be great to have some more code examples in the API documentation. Given
that this is an Open Source project if we use Titanium I’d certainly be willing
to fork the project and improve documentation. There are also
[paid for videos available](http://developer.appcelerator.com/training).

Issues like memory management and how Titanium performs across different
versions of SDKs are not really understood at the moment.

### Conclusion

Titanium looks like a really interesting project for our business. Given that we
can also use it to write cross-platform desktop applications it actually opens
up new markets for us. It leverages existing skill sets within the team and will
allow us to get apps off the ground more quickly. For more complex client
requirements though we will need to drop down to writing custom code - a common
scenario with frameworks.

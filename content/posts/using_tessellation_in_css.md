+++
date = "2007-06-26T00:00:00+01:00"
description = "Tessellation has been used for many years in wallpaper and other design environments where a large space of indeterminate size needs to be covered. Using CSS similar techniques can be used to deliver designs that look good and stretch to the width of the screen. "
tags = ["CSS", "Design"]
title = "Using tessellation in CSS"
+++

## What is tessellation?

Tessellation is where shapes fit together with no overlaps or gaps. The shapes
are designed so that they can continue forever if required. The artist Esher
used tessellation to create mind-bending work. Look at the tessellation of bugs
beetles below for example where the shapes interlock.

![Esher Beetle Design][1]

Tessellation is used extensively in wallpaper design too. Look at this example
by William Morris. Note how the pattern repeats itself over and over again.

![William Morris Tessellaion][2]

## Why is this useful for the web?

One of the main drivers of tessellation is that it allows designers to cover
spaces of indeterminate size. This can obviously be very useful for the web.
Screen widths and dimensions are very different depending on the platform that
user is browsing on. A mobile phone for example is tiny compared to a 24 inch
monitor.

## How do it do it?

Adding backgrounds to your site is simple. On the body you add this:

```css
body {
  background: url(/path/to/your/image/image.gif) repeat;
}
```

This repeats the image accross the body of your site. So if you have designed
something to tessellate it will repeat correctly across the screen. Exactly how
Esher and Morris used it.

W3C Schools has an [excellent series of tutorials][3] on using background images
in CSS.

## Show me an example

One of my favorite usages of this technique at the moment is on [iGoogle][4] in
the Seasonal Scape theme. They use this image to repeat over and over.

![image][5]

This means that however big the screen the user sees a coherent landscape. In
fact it is so good you barely notice.

Then another image is positioned on top in the middle to show the two characters
doing whatever they do at that time of day.

![Google background][6]

It is a very clever implementation both creatively and technically and one that
has its roots in tessellation. It works very well for screens of all dimensions
and shows how fluid designs can use tessellation to great effect.

[1]: /images/articles/escher05.jpeg
[2]: /images/articles/22345-large.webp
[3]: http://www.w3schools.com/css/css_background.asp
[4]: http://www.google.com/ig
[5]: /images/articles/header_tile.webp
[6]: /images/articles/header_bg.webp

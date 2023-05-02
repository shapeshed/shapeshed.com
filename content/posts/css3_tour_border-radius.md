+++
date = "2009-02-20T00:00:00+00:00"
description = "Border-radius allows you to create rounded corners with just CSS without the need for graphics or JavaScript. If you are not using it yet here's an explanation. "
tags = ["CSS", "Browsers"]
title = "CSS3 Tour: border-radius"
+++

Not interested in the explanation? Head straight to [the example page.][1]

## Rounded corners

Historically rounded corners [were tricky to implement][2] involving a
background graphic or even JavaScript. Interface designers would issue a little
sigh as designers littered designs with rounded corners. Well not any more!

## Corners for all

Now you can create rounds corners easily using CSS. There is a bit of variance
between browser vendors at the moment but I imagine eventually the syntax will
standardise. To add rounded corners you just need:

```css
/* Gecko browsers */
-moz-border-radius: 5px;
/* Webkit browsers */
-webkit-border-radius: 5px;
/* W3C syntax - likely to be standard so use for future proofing */
border-radius: 10px;
```

![Rounded Corner with CSS3][3]

And that's all there is to it. Firefox did have some problems aliasing the
corners but this has been fixed now so you can enjoy crisp rounded corners with
no effort.

## More control

You can even specify which corners have border-radius applied to them. Again the
syntax is slightly different between browsers so you'll need to list both.

```css
/* Gecko browsers */
-moz-border-radius-topleft: 20px;
-moz-border-radius-topright: 0;
-moz-border-radius-bottomleft: 0;
-moz-border-radius-bottomright: 20px;

/* Webkit browsers */
-webkit-border-top-left-radius: 20px;
-webkit-border-top-right-radius: 0;
-webkit-border-bottom-left-radius: 0;
-webkit-border-bottom-right-radius: 20px;

/* W3C syntax */
border-top-left-radius: 20px;
border-top-right-radius: 0;
border-bottom-right-radius: 0;
border-bottom-left-radius: 20px;
```

![Rounded corners in CSS3][4]

## Validation!

True - this won't validate with CSS 2.1 validators simply becuase this isn't CSS
2.1. If you are a validation obsessive then I suggest putting these rules in a
separate CSS3 file. If you can't handle having \*any\* non-validating code on
your site then you'd better wait a bit longer.

## Browser support?

Border-radius is supported in Firefox 2 & 3, Safari 3 and related Gecko and
Webkit browsers.

Internet Explorer 6 & 7 and 8 (as far as I know) and Opera do not support
rounded corners. Instead these users will see a regular corner.

For me this is an example of [progressive enhancement][5]. So what are you
waiting for?

## Demo

You can see the effects that are available in [the demo][1], or [grab the
source][6] from Github.

[1]: /examples/border-radius/
[2]: http://www.cssjuice.com/25-rounded-corners-techniques-with-css/
[3]: /images/articles/rounded-corner.webp
[4]: /images/articles/rounded-corner2.webp
[5]: http://en.wikipedia.org/wiki/Progressive_Enhancement
[6]: http://github.com/shapeshed/border-radius-demo/tree/master

+++
date = "2009-02-24T00:00:00+00:00"
description = "RGBa adds the alpha channel to colour declarations in CSS3. This is great news for designers who are now able to declare an alpha channel percentage on individual elements. "
slug = "css3-tour-rgba-colour-values"
tags = ["CSS"]
title = "CSS3 Tour - RGBa Colour Values"
+++

Not interested in the explanation? Go straight to [the demonstration.][1]

## Why not opacity?

Opacity is well supported by all of the major browsers, albeit with differing
syntax.

```css
/* IE 8 */
-ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=50)";
/* IE5 - 7 */
filter: alpha(opacity=50);
/* Everyone else */
opacity: 0.5;
```

So what's wrong with that I hear you cry? The problem is that if you set opacity
on an element it means that the opacity will also be set on all the children of
that element. So it is difficult to control opacity with fine detail. You either
have it all, none or have to fix it with JavaScript.

## RGBa to the rescue

[RGBA color values][2] from the [CSS Color Module Level 3][3] allows interface
designers to set an alpha channel for individual elements.

RGB values are specified using three 8 bit unsigned integers (0 - 255) and
specify values for Red, Green and Blue. The addition of an alpha channel is not
another colour channel - it just specifies transparency along with the colour
information that the other three channels provide.

So we can make this

![RGBa example][4]

Using the following HTML

```html
<ul>
  <li class="hundred">100%</li>
  <li class="eighty">80%</li>
  <li class="sixty">60%</li>
  <li class="forty">40%</li>
  <li class="twenty">20%</li>
</ul>
```

And CSS

```css
ul {
  list-style: none;
}
ul li {
  padding: 0.5em;
}
ul li.hundred {
  background: rgba(0, 0, 255, 1);
}
ul li.eighty {
  background: rgba(0, 0, 255, 0.8);
}
ul li.sixty {
  background: rgba(0, 0, 255, 0.6);
}
ul li.forty {
  background: rgba(0, 0, 255, 0.4);
}
ul li.twenty {
  background: rgba(0, 0, 255, 0.2);
}
```

Furthermore anything that is underneath the list items will show through with
varying strength depending on the alpha channel of the list item.

## A note on syntax

CSS 2.1 developers will be used to using Hex colours (e.g. #ccc) which in my
experience is the most widely used colour declaration. CSS2.1 supports [RGB
color declarations][5] though:

```css
/* Hex value */
#yourid {
  color: #46d5de;
}
/* The same as a RGB colour declaration */
#yourid {
  color: rgb(70, 213, 222);
}
```

CSS3 RGBa colour values add the alpha channel with a slight amend to the syntax:

```css
#yourid {
  color: rgba(70, 213, 222, 0.5);
}
```

Note that these 'color:rgb' and 'color:rgba' are treated separately by browsers.

## Browser support

RGBa colour values work for current Webkit and Gecko browsers. They are not
supported in Internet Explorer or Opera. As [Chris Coyer notes in his excellent
article on RGBa][6] you can use a standard RGB colour value to specify a fall
back for these browsers.

```css
div {
  background: rgb(200, 54, 54); /* The Fallback */
  background: rgba(200, 54, 54, 0.5);
}
```

Another example of [Progressive Enhancement][7].

## Demo

You can see the effects that are available [in the demo][1], or grab the [source
from Github.][8]

[1]: /examples/css3-rgba/
[2]: http://www.w3.org/TR/css3-color/#rgba-color
[3]: http://www.w3.org/TR/css3-color/
[4]: /images/articles/rgba.webp
[5]: http://www.w3.org/TR/CSS21/syndata.html#color-units
[6]: http://css-tricks.com/rgba-browser-support/
[7]: http://en.wikipedia.org/wiki/Progressive_enhancement
[8]: http://github.com/shapeshed/css3-rgba/tree/master

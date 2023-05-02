+++
date = "2007-01-31T00:00:00+00:00"
description = "Here's a quick look about how you can give your site some wallpaper. Whilst you are moving the furniture around there is also some traditional wallpaper design for inspiration."
tags = ["CSS", "XHTML", "Design"]
title = "Wallpaper for websites"
+++

## Adding wallpaper to a site

With a bit of simple CSS you can add wallpaper to a site quickly and easily.
Apply a repeating background image to the body of your HTML document and then
use a wrapper to put your content on top of the wallpaper. Rather like hanging a
picture on a wall.

## XHTML

```html
<html>
  <head>
    <title>Your title here</title>
    <style type="text/css" media="screen">
      @import "css/screen.css";
    </style>
  </head>
  <body>
    <div id="wrapper">
      <p>Your content here</p>
    </div>
  </body>
</html>
```

## CSS

```css
body {
  font: 62.5%/1.5 "Lucida Grande", "Lucida Sans", Tahoma, Verdana, sans-serif;
  background: url(../images/wallpaper.gif) repeat;
  color: #333366;
  text-align: center;
}

#wrapper {
  width: 1000px;
  text-align: left;
  margin-left: auto;
  margin-right: auto;
  background-color: #ffffff;
}
```

See this code in action [in the example][1]

## Repeaters and tessellation

CSS can repeat images across a screen, so there is no requirement for a large
image. For gradients for example you can use a 1 px wide image and repeat it
across the screen using repeat-x. This leads us on to wallpaper design in
general and the idea of tessellation. A tessellation is created when a shape is
repeated over and over again covering a plane without any gaps or overlaps. This
is great for the web as it means small files can be repeated with no requirement
for massive downloads.

## Wallpaper design - inspiration from history

![William Morris Wallpaper][2]

![William Morris Wallpaper][3]

Once you understand the idea of tessellation you are really only limited by your
imagination. Take the designer William Morris who produced some amazing
wallpaper designs.

There is a Morris design in the [in the example][1]. Personally I think it looks
as good on the web as it does on a wall.

Online there are a number of places for you to find wallpapers for both use and
inspiration

- [Kaliber1000][4]
- [Squidfingers][5]

Or you could just fire up Photoshop and start creating!

[1]: /examples/wallpaper-for-websites/
[2]: /images/articles/morris.webp
[3]: /images/articles/Jasmine.webp
[4]: http://k10k.net/pixelpatterns/
[5]: http://www.squidfingers.com/patterns/

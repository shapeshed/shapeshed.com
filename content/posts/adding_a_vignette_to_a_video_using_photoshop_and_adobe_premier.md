+++
date = "2010-04-28T00:00:00+01:00"
description = "How to create a vignette frame in Photoshop and add it to a video using Adobe Premier"
slug = "adding-a-vignette-to-a-video-using-photoshop"
tags = ["Photoshop"]
title = "Adding a vignette to a video using Photoshop"
+++

## Background

My brother [Sam Ornbo][1] is a freelance television Producer and Director and
has recently been doing some work for a Scooter company. He shot a short
promotional film for them and wanted to recreate the vignette effect that is
used heavily in [Top Gear][8]. He uses [Adobe Premier][2] to edit videos which
allows you to import PSD files, so asked me for some help in creating the
vignette.

## Creating the vignette

To create the vignette first select the Ellipse Tool and draw an Ellipse like
this

![Creating the ellipse][3]

Then in the layers menu (F7) select the shape you have just drawn by holding the
⌘ key (Ctrl on windows I think) and click the layer thumbnail. You should then
see the ant trail (a black and white line around the ellipse you have just
drawn.

![Selecting the ellipse][4]

Then go to Select > Inverse. Create a new layer by going to Layer > New... >
Layer and fill the selection with Black.

Turn off the original ellipse layer you created and you'll be left with the
inverse:

![The inverse ellipse][5]

Then go to Select > Deselect to remove the marching ants.

Next convert the layer to a Smart Object so we can apply filters
non-destructively (this makes it easier to change things). To do this go to
Filter > Convert for Smart Filters.

Then we apply a Gaussian Blur - Filters > Blur > Gaussian Blur. You should end
up with something like this:

![The finished vignette][6]

Save your file as a PSD and it is ready to use in Adobe Premier. Drag the file
into your bin it will be available for you to use in your project.

## The finished effect

Applied over the video the Vignette gives us the effect we are looking for:

![The final effect][7]

[1]: http://www.samornbo.com/
[2]: http://www.adobe.com/products/premiere/
[3]: /images/articles/vignette_ellipse.png
[4]: /images/articles/vignette_layers.jpg
[5]: /images/articles/vignette_inverse_ellipse.jpg
[6]: /images/articles/vignette_finished.jpg
[7]: /images/articles/vignette_biker.jpg
[8]: http://www.topgear.com/

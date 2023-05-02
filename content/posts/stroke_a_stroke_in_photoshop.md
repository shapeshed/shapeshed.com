+++
date = "2007-11-30T00:00:00+00:00"
description = "Sometimes you might want to add a stroke to a stroke on the same layer in Photoshop. Thankfully with a simple technique you can."
tags = ["Photoshop"]
title = "Stroke a stroke in Photoshop"
+++

## Making the stroke

I'm going to use a custom shape here - a star. First open a new document 250 x
250px. Then select the Custom Shape Tool (shortcut U). In the top menu bar
select the Star from the set that ships with Photoshop. Now draw a star on the
canvas. Hold down shift to keep the proportions of the star and then space to
position the star where you want it.

![Star shape][1]

Now in the layers panel right click the layer you have just created and choose
Blending Options. Add a stroke of 10px outside.

![Adding a stroke][2]

Your shape should now look like this.

![Single stroke][3]

## Adding the second stroke

We can also use layer styles to add a second stroke. Here's how to do it. Right
click the layer again and choose blending options to get the layer style dialog
again. This time select Outer Glow. By default the Blend Mode of Outer Glow is
Screen. You need to change this to Normal. Move the Opacity up to 100%. Under
Elements change the technique to Precise. Move the Spread to 100% and the Size
to 20px. Remember that Photoshop draws this from the edge of the shape so if we
want our second stroke to also be 10px we need to allow for the 10px of the
first stroke.

![Adding the second stroke][4]

That's it - you now have a stroke on a stroke!

![image][5]

If you want to save this layer style for reuse simply open the style panel and
then with your layer selected choose New Style. Give your style a suitable name
and it will sit there ready to apply in the future.

[1]: /images/articles/star_stroke_1.webp
[2]: /images/articles/star_stroke_2.webp
[3]: /images/articles/star_stroke.webp
[4]: /images/articles/star_stroke_3.webp
[5]: /images/articles/double_stroke.webp

+++
date = "2006-10-30T00:00:00+00:00"
description = "For precise interpretation of PSDs to XHTML I recommend avoiding this tool. But there may well be a time when you can use this tool so here's a quick overview."
slug = "photoshop-101-the-slice-tool"
tags = ["Photoshop", "Photoshop 101"]
title = "Photoshop 101 - The Slice Tool"

+++

I do not recommend using this tool for creating web pages from PSDs. A more useful tool for slicing up PSDs is the [Marquee Tool][1]

## What The Slice Tool does

The slice tool allows you to create multiple images from one image or a layered Photoshop file. You can slice up the image using areas that you create using the slice tool or by using guides that you have applied. This allows you to save out images in preparation for the web very quickly. You can see what the Photoshop team were trying to do with this tool but unfortunately turning designs into XTHML and CSS is not quite so simple.

## Use with caution

In this example we have a crude but simple layout for a web page. Lets say we want to slice up these elements and save them as images. The slice tool lets you do it quickly. If you have used guides click "Slice from Guides". This will slice up the page for you.

![The Slice Tool in action][2] 

Hopefully now you will understand the limitations of this tool. To apply information to the slices select the Slice Select tool. If you click and hold the Slice Tool in the tools menu you will see this appear. Double click the slice you want to edit and you will see the option box come up. Most of this other than the name of the image is totally useless! You can save out the slices as images by going to Save For Web. You can specify different file types for different slices by clicking the slice and then applying image options in the Save for Web dialogue. 

![Slice Tool Options][3] 

## Possible uses

If you are building a simple web page that is predominantly an image this could be useful. Fundamentally though this is not as useful as the [Marquee selection tool][1]. In conjunction with the Info box and guides it gives me a lot more control over my work. If you want to quickly slice up an image into separate components though it could have use. 

## Not great for me

The problem for me with this tool is that it is clumsy in the way it works. It cuts images like a sledgehammer. If you need to apply any fine tuning to the image it performs poorly. Also beware that if you slice up your design using this tool and make a web page out of images it will not be search engine friendly and will be inaccessible to screen readers. 

## The Marquee Tool - much more control

By all means feel free to use the Slice Tool if you like but in my opinion you will work more accurately and professionally if you slice up .psds using the [Marquee Tool][1]. If you keep the Info box viewable (F8) you will be able to quickly see the width and height of elements and incorporate it into your CSS. The slice tool was really designed for use with Table based layout - if you persist in using tables it is likely that you are not going to be getting much work in the future!

 [1]: /journal/photoshop_101_the_marquee_tool/
 [2]: /images/articles/slice_from_guides.jpg 
 [3]: /images/articles/slice_tool_options.jpg 

+++
date = "2006-10-07T00:00:00+01:00"
description = "The second in a series of good practices for writing XHTML and CSS looking at writing clean, maintainable code and dealing with browser hell problems."
tags = ["CSS", "XHTML"]
title = "Writing good XHTML and CSS Part 2"

+++
In [Part 1][1] we went over the production environment you will need to write Professional XHTML and CSS. This included software and hardware as some excellent extensions you can get for the [Firefox browser][2]. Part two looks at good practices for writing maintainable and lasting code. 

## Format code cleanly

Whether you are coding on the fly or from a layered Photoshop file it is important to write your code in a manner that is maintainable and readable by others. It is unlikely you will remember what you did in six months time so lay your code out cleanly. 

Indent your code from the left edge to allow the reader to follow the flow of a document. In this example of a simple XHTML page indenting tags allows you to follow the page elements.

    <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
    <html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
      <head>
        <title>Example XHTML Page</title>
        <style type="text/css" media="screen">
          @import "/css/screen.css";
        </style>
      </head>
      <body>
        <div id="id-for-css">
          <h1>A great big title</h1>
          <img src="/images/some_image.png" title="An image" alt="An image" width="100" height="200" />
        </div>
      </body>
    </html>

The same is true for CSS files. Laying out your files in a consistent manner will help maintain a website in future.  

    body { 
      font: 76%/150% "Lucida Grande", 
      "Lucida Sans", "Trebuchet MS", Tahoma, Verdana, sans-serif color: #333366; 
      background: url(/images/backgrounds/gradient.png) repeat-x; 
    }

## Comments are good

Indenting code will help you read a document but it won't help you understand why certain things are there. That's where comments come in. 

It is easy to comment code as you go and it will save you time in the long run: 

    /* CSS Comment - I can use this to highlight sections of the CSS file or explain sections of code */ 

    <!-- An XTHML comment - I can use this to denote sections or reasons why I have coded things in a certain way -->

## Use DOCTYPES

DOCTYPES declare what time of document the web page is. If you don't declare one then your code won't validate and is likely to be flakey on some platforms. Browsers have two modes - standards and quirks mode. They decide on which one to use by the DOCTYPE. If you don't declare one then quirks mode will be used rendering your lovely compliant code using methods for non-compliant code. Declare a DOCTYPE and your code will be rendered in the correct mode. You can choose to use HTML or XHTML but make sure you choose the right DOCTYPE from [here][4].

## Test, test, test

As you code it is important to test as often as possible. Check your pages in the browsers and platforms that we defined in [Part 1][1]. You will soon realise that different browsers interpret things very differently. This can be painful to start with but after a while you will learn the inconsistencies and code defensively. 

Divide you design up into chunks and test at regular intervals. This might be the header, main body and footer for example.

Validate your code at the [W3C Markup Validator][5] and the [W3C CSS Validator][6]. Not only will this help to bulletproof your code, you will learn how to tighten up your code through errors and warnings. 

If you are coding to a fixed width I recommend taking screenshots and checking widths and layouts in Photoshop. It is often quite difficult to see by eye where layouts have gone wrong. By using Rulers (Mac: Apple + R, Windows: CTRL + R) and the [Marquee tool][7] in Photoshop you can make sure you are pixel perfect.

![Checking design layouts in photoshop][8]

## As you learn get to know the specs

OK this is the vaguely scarey bit. XHTML and CSS both have Specifications as defined by the W3C. Getting to know these and associated documents is a great way to improve your code. Yes these documents are lengthy and quite dull but if you want to learn XHTML and CSS properly you will need familiarise yourself with the following documents: 

*   [XHTML 1.0][9]
*   [CSS 2.0][10]
*   [Web Content and Accessiblity Guidelines 1.0][11]

They don't cost anything so why not buy yourself something nice with the money you have saved?

## Overcoming browser hell

Although things are getting much better is a fact of life that at some point you will pull your hair out over a problem. Luckily for you there is a support group who has been through this hell before. You may well find the answer to your problem by simply typing it into Google. If that does not solve your problem then there are multiple email lists for CSS in particluar. [CSS-Discuss][12] is particularly good. Otherwise asking friends and colleagues is a good way to solve problems. If none of those work you are quite at liberty to throw your computer out of the window.

 [1]: /writing_good_xhtml_and_css_part_1/
 [2]: http://www.mozilla.com/firefox/
 [3]: /images/some_image.png 
 [4]: http://www.w3.org/QA/2002/04/valid-dtd-list.html
 [5]: http://validator.w3.org/
 [6]: http://jigsaw.w3.org/css-validator/
 [7]: /photoshop_101_the_marquee_tool/
 [8]: /images/articles/checking_layouts.png 
 [9]: http://www.w3.org/TR/xhtml1/
 [10]: http://www.w3.org/TR/REC-CSS2/
 [11]: http://www.w3.org/TR/WAI-WEBCONTENT/
 [12]: http://css-discuss.incutio.com/

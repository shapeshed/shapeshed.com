+++
date = "2006-09-28T00:00:00+01:00"
description = "Internet Explorer 7 is just around the corner and there have been warnings from Microsoft that existing hacks will break layouts in IE7. By limiting the use of hacks your CSS can be both backwards and forwards compliant."
slug = "preparing-for-ie7-limiting-css-hacks"
tags = ["Browsers", "CSS"]
title = "Preparing for IE7 - Limiting CSS Hacks"

+++

## A sigh of relief

Developers everywhere will rejoice as code that appears correctly in every other browser is now likely to display correctly in Internet Explorer 7. IE7 will be a landmark release from Microsoft with a razor sharp rendering engine and standards compliance (well mostly). If you haven't got it yet the [Release Candidate 1][1] is now out.

## But there's a but

But pleasure does not come without pain. Way back in October 2005 Microsoft outlined how existing hacks [would break sites][2] in Internet Explorer 7. The following hacks will not work in Internet Explorer 7:

*   html > body
*   * html 
*   head:first-child + body 
*   head + body 
*   body > element 

So the choice is now to avoid using these hacks or to deal with them when clients phone up and ask why site layouts are broken. Or perhaps even to code without using hacks at all?

Avoiding hacks is not easy but it isn't impossible. What's more you will reap the dividends of passing seamlessly to IE7 once it is released.

## An example - The Box Model Hack

Probably one of the most common hacks is the box model hack. This is where IE5 / Windows misinterprets the CSS1 spec by placing borders inside the specified width. Faced with this problem many developers reach for one of the variants on the [Box Model Hack][3]. Why not after all - it is quick and easy.

Very often however the Box Model Hack simply isn't necessary. If you need to apply margins or padding most of the time you can apply it to elements within a div and remain hack free

Look at this XHTML: 

    <div id="content">
      <h3>Title</h3>
      <p>Paragraph</p>
    </div>

If the content needs to be given a margin from the edge of the div then many developers will apply margin and padding to the div. This will of course cause problems in IE5/Win so it will be necessary to use a hack.

Providing you don't have to specify a width, you can avoid hacking by applying the margin and border to the h3 and p tags removing the problem of hacking the div entirely. This is just one example of how hacks are often used without needing them.

Furthermore you can use [conditional comments][4] to keep your hacks for IE in one external file. This means you can manage hacks more easily and not serve these stylesheets to browsers that interpret things correctly. The example below serves a stylesheets to IE6 and below but is ignored by non IE browsers:

    <!--[if lte IE 6]>
    <link rel="stylesheet" href="/css/ie6_and_below.css" type="text/css" media="screen" />
    <![endif]-->

There is no doubt that at times hacks are unavoidable but with the arrival of IE7 is important to consider how you are using them and to limit their use wherever possible. Otherwise you may well find that your new best friend is your worst enemy.

 [1]: http://www.microsoft.com/windows/ie/default.mspx
 [2]: http://blogs.msdn.com/ie/archive/2005/10/12/480242.aspx
 [3]: http://www.tantek.com/CSS/Examples/boxmodelhack.html
 [4]: http://msdn.microsoft.com/workshop/author/dhtml/overview/ccomment_ovw.asp

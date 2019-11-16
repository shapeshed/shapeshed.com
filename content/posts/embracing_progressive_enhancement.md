+++
date = "2007-11-23T00:00:00+00:00"
description = "Striving to make sites the same cross-browser at the presentation and behaviour layers is a bad philosophy for the web and for the browser market. Instead designers and developers should embrace Progressive Enhancement and accept a lesser experience for less capable browsers."
tags = ["Browsers", "Opinion", "Web Standards"]
title = "Embracing progressive enhancement"

+++

## What is progressive enhancement?

[Progressive Enhancement][1] is nothing new. It is a design philosophy that the core features of a site should work for everyone on an agreed range of browsers. The site is then progressively enhanced for more capable browsers. The idea is that users with better browsers will get a better experience, but users with less capable browsers will still be able to use the site. This also echoes a key driver of the web standards philosphy - ensuring access for all.

## Javascript Example

[Here's a simple example][2] of Progressive Enhancement in action. With Javascript enabled users don't need a page refresh. Without it users do. Both users ultimately get the same thing but users with Javascript get a better experience than those without. This has additional benefits of being search engine friendly and accessible. For further reading there are some great articles on this on [Christian Heilmann's site][3]. 

## CSS Example

Let's take a classic example. We want to curve the edges of a box. We could use one of a [myriad of CSS techniques][4] or even [one][5] of [many][6] Javascript solutions. You can also use the CSS3 property border-radius. So which one should you use?

I am going to get off the fence and (with the philosophy of Progressive Enhancement) say use border-radius. Why? It is supported by Firefox (over a [third of the market][7]) using -moz-border-radius and also Safari using -webkit-border-radius. It will result in faster loading times, be more maintainable and result in a better experience for those who have capable browsers. For those without support for border radius they will not get rounded corners. Do I care about this? No - not really. Will my client care? Yes - and that's the problem. 

## Admitting all users aren't the same

Let's use an analogy of a car driving from A to B. If I am in a very expensive car I am likely to get from A to B in comfort and probably have satellite navigation available to me. If I am in a cheaper car I am likely to get from A to B in slightly less comfort and I may have to use a map. Both cars get from A to B but one passenger has a better experience than the other. The analogy between cars and browsers stops here however because browsers are free. They don't cost anything. 

If users choose to browse a site with a less capable browser I'm certainly going to make sure they can use it. But I don't care if they get a lesser experience. That is their choice. Giving individuals choice is fundamental to a free market and free markets create better products. I respect every user's right to access and use a website, but I also acknowledge their choice. If that choice is a less capable browser then I have no issue with them getting a lesser experience. The philosophy of giving all users the same experience is in my opinion a false one.

## The battleground

Of course this is all great in theory until your client asks why the site does not look the same in all browsers. They don't care about browsers - they just want the site to look the same in the other 60% of the market. At this point you are faced with a clear choice. You can continue to hack and use less than optimal code to fix less capable browsers or you can explain Progressive Enhancement to your client. Of course it is the client who pays the bills so they have the final say. But in future I will be explaining this to clients. I suspect I will lose more battles than I win.

My design and development philosophy has changed however. I'm no longer going to strive to make everything the same in less capable browsers.

 [1]: http://en.wikipedia.org/wiki/Progressive_enhancement
 [2]: /examples/altering-content/
 [3]: http://www.onlinetools.org/articles/unobtrusivejavascript/
 [4]: http://www.smileycat.com/miaow/archives/000044.php
 [5]: http://www.curvycorners.net/
 [6]: http://www.html.it/articoli/niftycube/index.html
 [7]: http://www.w3schools.com/browsers/browsers_stats.asp

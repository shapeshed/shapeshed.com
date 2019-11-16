+++
date = "2007-10-08T00:00:00+01:00"
description = "The news that the open source browser engine WebKit is to follow Opera and support font-face is great news for web typography. But more work needs to be done by the web community, browser manufacturers and font foundries."
tags = ["Typography", "Browsers", "Opinion"]
title = "WebKit to support font-face"

+++

## What's new

WebKit, the browser engine that powers Safari, has announced that it will follow Opera and [offer support][1] for the font-face property. This is a huge step forward for typography on the web. No longer are designers limited to around 15 fonts that are commonly found on [Windows][2] and [Macintosh][3] machines. Instead a font can simply be uploaded to a server and used to generate typography in the browser. Furthermore designers can use and create Webdings that will allow graphical elements to be rendered from a font. This will result in significantly lower pageweights and a wealth of creative possibilities.

## Problems to overcome

This new development comes with two major problems that need addressing. But the level of enthusiasm at the potential loosening of the current typopgraphic straightjacket makes me optimistic that everyone can work together to provide a workable solution. 

## Licensing

The biggest problem is of course the licensing of fonts. Font foundries rightly want to protect their revenues. The current solution means that anyone can access a font used on a website and take it and use it without paying for a license. This is fine for freeware fonts (and there are some great ones out there) but for licensed fonts the current solution won't work. Jon Hicks [has proposed the API model][4]. This is where the user has a key to query and retrieve data from services like Flickr and Google Maps. The font foundries would host the font and provide sites with a key to allow them to use fonts. This would make license management easy. The technology exists and all we need it for font foundries to make the investment. They would also have the added bonus of growing a massive dataset on font usage, allowing them to improve their business decisions. If more browsers commit to implement font-face I'm sure this would be a workable and profitable solution. 

## Browser support

The excitement that has surrounded this announcement had failed to reflect on the fact that it is only two browsers that are planning to offer support. Their market share is extremely small and whilst typography in CSS can degrade gracefully this is a still a major issue. In order for this to really work more browsers need to commit and come on board. This will encourage font foundries to make the necessary investment and encourage designers to start using (and paying for) different fonts.

## Facing in the same direciton

I'm hopeful that the implementation of font-face will be a big step forward for web typography. Designers want more choice in the fonts they use and font foundries want to be able to make more money by selling fonts. With two browsers on board it should be relatively easy to convince the others. But we all need to work together to make this happen. I for one would be very happy to help. I'm bored with Arial.

 [1]: http://webkit.org/blog/124/downloadable-fonts/
 [2]: http://www.codestyle.org/css/font-family/sampler-WindowsResults.shtml
 [3]: http://www.codestyle.org/css/font-family/sampler-MacResults.shtml
 [4]: http://www.hicksdesign.co.uk/journal/fonts-in-your-face

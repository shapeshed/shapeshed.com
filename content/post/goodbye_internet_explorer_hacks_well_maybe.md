{
  "title": "Goodbye Internet Explorer Hacks (well maybe)",
  "date": "2006-06-01T00:00:00+01:00",
  "description": "I had to do a template today and I took the opportunity to code using no hacks. With the impending launch of Internet Explorer 7 there are going to be many sites that won't render properly because of existing Internet Explorer hacks. ",
  "tags": [
    "XHTML",
    "CSS",
    "Microsoft",
    "Browsers"
  ]
}

![IE7 Logo][1]

Back in October Microsoft issued a [call to action][2] to developers to stop using IE specific hacks. This might seem a little galling especially when every developer spends more time trying to get IE to display things correctly. But they have a very good point. With the release of IE7 the following hacks won't work:

*   html > body
*   * html 
*   head:first-child + body 
*   head + body 
*   body > element 

With IE7 Microsoft are trying to clean up their act so I think it is fair that developers should clean up their acts too. I code for IE5 up and managed to complete the templates to XHTML and CSS compliance with one stylesheet and no hacks. OK it took me a bit longer but the code is future proofed. Another bonus is that it makes maintaining the site so much easier as you don't have to go through 5 or 6 stylesheets. This is all well and good until the next tear your hair out moment in IE but my intention from now on is to say goodbye to IE hacks! Famous last words....

[1]: http://shapeshed.com/images/articles/ie7.jpg 
[2]: http://blogs.msdn.com/ie/archive/2005/10/12/480242.aspx

+++
date = "2006-08-16T00:00:00+01:00"
description = "I recently came across a problem that I couldn't find a solution to. In IE6, IE5.5 and IE5 text within tables was not inheriting the font declarations from my CSS. I declared the font size on the body tag and for all other elements it works fine:\n"
tags = ["XHTML", "CSS"]
title = "CSS Font Size not inherited in IE tables"

+++

    body { 
      font: 72%/160%, "Lucida Grande", "Lucida Sans", "Trebuchet MS", Tahoma, Verdana, sans-serif; 
    }

So off I went to find out what others had been doing. It took me a while to find the answer so incase it helps someone else find it I'm posting it up here.

One hack suggested using the !important declaration to redeclare the font size for IE6 and below. That would clog up my style sheet a bit so I wasn't impressed with that one.

Happily I found a much better hack. It works with just one line of code and the font size in my tables is now appearing correctly. To correct font-size in tables simple add this line to the css that controls your table: 

    font-size: 1em;

So my CSS for my table looks like this and it is now behaving properly. 

    table { 
      border-spacing: 0; 
      border-collapse: collapse; 
      /* fix for IE6 and below not inheriting font size */ font-size: 1em; 
    }

{
  "title": "Beating CSS Bloat",
  "date": "2007-01-03T00:00:00+00:00",
  "description": "After a hearty festive period I need to trim down my belly. Whilst I'm at it I might as well trim down a few CSS files. ",
  "tags": [
    "CSS"
  ]
}
It is easy to get into good practices that will lower the size of your CSS files. You will save on bandwidth and increase the download speed of your site. 

## Use CSS Shorthand

Using CSS shorthand can significantly lower the file size of you CSS size. Look at the following two rules. They are both exactly the same.  

    h1 { 
      font-weight: bold; 
      font-size: 12pt; 
      line-height: 14pt; 
      font-family: Helvetica; 
      font-variant: normal; 
      font-style: normal; 
    } 

    h1 { font: bold 12pt/14pt Helvetica }

You can use shorthand for the following:

*   font
*   margin
*   padding
*   border
*   list-style

Browser support can be an issue with some legacy browsers so if you need to support older browsers make sure you test thoroughly

## Universal selectors save on duplication

As different browsers apply different amounts of padding and margin to different elements I find it useful to simply remove all padding and margin from every element using the following rule: 

    * { 
      margin: 0px;
      padding: 0px; 
    }

This means that when you code your CSS you know where you are. Hopefully you won't have to add extra rules for different browsers as all browsers will render margins and borders as 0px unless you specify otherwise. 

## Target HTML elements if you can

It is easy to get carried away with multiple classes. Where possible it is good practice to start by defining rules for HTML elements. As you code your (x)HTML you will find that you will save on the page weight of both your HTML and CSS files. For example let's say that you want all h1 text to be Georgia. Rule one is more efficient than rule two which also requires a class to be added to the (X)HTML. 

    h1 {  
      font-family: Georgia; 
    } 

    .georgia-heading {  
      font-family: Georgia; 
    }

Furthermore you will speed up your coding if you can use this approach throughout your documents. 

## Strip out unnecessary comments

Comments are important and you should not remove any comments that will help you maintain the CSS over time. But often comments are left in unnecessarily. Before you launch a site go through your CSS files and make sure there is nothing unnecessary there. Also if you find section that you don't understand add a comment that will help you in the future.

## Use a CSS optimiser

There are many tools that will help you to lower your CSS file significantly. Most are based on [CSS Tidy][1], an open source CSS optimiser. This is a great tool for cleaning up your CSS files and will often result in savings of up to 25%. 

If you don't want know how to install CSS Tidy there are a number of online variants:

*   [CSS Optimiser][2]
*   [CSS Cascading Style Sheet Optimiser][3]
*   [CSS Formatter and Optimiser][4]

Caution should be used when running your CSS files through an optimiser. Often cross browser issues can emerge and even rules can get mangled. If you are going to use an automated optimiser make sure that you test thoroughly after optimisation.

So here's to a leaner New Year for my belly and CSS files!

 [1]: http://csstidy.sourceforge.net/
 [2]: http://www.cssoptimiser.com/
 [3]: http://flumpcakes.co.uk/css/optimiser/
 [4]: http://www.cdburnerxp.se/cssparse/css_optimiser.php

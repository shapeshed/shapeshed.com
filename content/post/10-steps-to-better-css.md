{
  "layout": "post",
  "slug": "10-steps-to-better-css",
  "title": "10 Steps to Better CSS",
  "date": "2006-11-15T00:00:00+00:00",
  "description": "Coding CSS can quickly get out of control. By following a few simple guidelines you can make your life a lot easier.",
  "tags": [
    "CSS"
  ]
}

## Organise your stylesheets

How you divide up your stylesheets is very much a matter of personal choice. You do however need to decide on how you organise your stylesheets. I use a slightly modified veresion of the template that comes with [Andy Budd's][1] excellent book [CSS Mastery][2]. This has author details at the top and clear delineation of sections throughout. If your site is large one stylesheet may become unmanageable so break it down into chunks and use @import to pull stylesheets into the master.

## Use universal selectors

Knowing where you are starting from is very important. Often you will be perplexed as to why padding has been applied by a particluar browser. For that reason I like to remove padding, margins and borders from everything using a universal selector. I then reapply padding, margins and borders to specific elements and know exactly where I am starting from 

    /* Remove padding and margin */
    * {
      margin: 0;
      padding: 0;
      border: 0;
    }

## Code defensively

The more you code CSS the more you will become aware of browser inconsistencies. Take the double float margin bug in Internet Explorer 6 and below for example. This is where a left float is placed within a container and a margin is applied to the move it away from the left edge. IE gets it wrong and applies a double margin. To combat this and the need to hack I like to apply margins to everything within the left float rather than the float itself. This results in consistent display across browsers. 
Note: Both examples assume the div is floated left within a container. 

Example one - applying the margin directly to the div. This will result in IE misinterpreting it and probable hacking.

    #left-content {
      float: left;
      margin-left: 10px; /* This margin will be doubled in IE6 and below */
    }

Example two - float the div left and then move everything in it away from the edge by 10px using a universal selector. No hacking needed. 

    #left-content {
      float: left;
    }

    #left-content * {
      margin-left: 10px;
    }

## Avoid hacks

Hacking CSS is lazy and unless completely necessary should be avoided. With the release of IE7 may old skool hacks will [cause problems][3]. If you encounter a problem debug your CSS rather than hacking straight away. Understanding the nature of the problem is key to improving your skills. Most of the time you will be able to fix it without hacking. If you must hack put hacks in a separate stylesheet and comment clearly.

## Use conditional stylesheets

If you have done more than 10 minutes of CSS you will realise that Internet Explorer is the most buggy of all browsers. Thankfully you can use [conditional comments][4] to manage the CSS that is served to IE. If I need it I have a stylesheet called ie6\_and\_below.css that targets older versions of IE. It allows me to manage CSS for older browsers quickly and easily.  

    <!--[if lte IE 6]>
      <link rel="stylesheet" href="/css/ie6_and_below.css" type="text/css" media="screen" />
    <![endif]-->

## Test, test, test

If you want to create robust CSS based layouts there is no way to avoid testing. Begin by outlining the browsers you want to support. Then create a test environment. Most browsers allow you to install multiple versions. For IE there is a [handy .exe available][5] that will allow you to install multiple versions on one OS. You will also need to test on a Mac. In fact I would recommend you buy a Mac and use it as your primary machine. 

## Comment your CSS

Almost every book ever written on coding advises commenting. Comments explaining why and how you did something will make maintaining the CSS much easier.

    /*-----------------------------------------------------------------------------
    I use this for block comments
    -----------------------------------------------------------------------------*/

    /* I use this for short commments */

## Read blogs

Stuffing your newsreader full of feeds is a great way to learn and develop. The web is an industry that actively shares knowledge so take advantage of this. If you find an interesting article or CSS fix through Google add the RSS feed to your newsreader. 
## Read the specs

If you really want to understand CSS there is no way of getting round reading the CSS specification documents. The good news is they are all free. You will learn a great deal from doing this so it is well worth it. 

*   [CSS 1][6]
*   [CSS 2][7]
*   [CSS 2.1][8]

## Drink lots of tea

OK I'm English and I like drinking tea but there will be times when you simply cannot fix a layout bug however hard you try. At this point it is a good idea to put the kettle on. Relax, go and do something else and come back to it with fresh eyes. You will often find that the solution will come very quickly after a break.

 [1]: http://www.andybudd.com/
 [2]: http://www.amazon.com/CSS-Mastery-Advanced-Standards-Solutions/dp/1590596145
 [3]: http://blogs.msdn.com/ie/archive/2005/10/12/480242.aspx
 [4]: http://msdn.microsoft.com/workshop/author/dhtml/overview/ccomment_ovw.asp
 [5]: http://tredosoft.com/Multiple_IE
 [6]: http://www.w3.org/TR/REC-CSS1
 [7]: http://www.w3.org/TR/REC-CSS2/
 [8]: http://www.w3.org/TR/CSS21/

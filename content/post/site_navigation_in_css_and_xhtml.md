{
  "title": "Site Navigation in CSS and XHTML",
  "date": "2007-05-30T00:00:00+01:00",
  "description": "Coding navigation in CSS and XHTML properly is important for both search engines and accessibility. Here's my take on how to do it, although I would be very interested to hear what others think.",
  "tags": [
    "CSS",
    "XHTML"
  ]
}
Not interested in the explanation? [See the demo][1] and [download the source code here][2]

## Semantics anyone?

HTML doesn't currently have any semantic syntax for navigation. HTML 5 is proposing "nav" to give meaning to navigation. Currently though we don't have anything. Boo hoo. So we have to use what it out there. There are many different takes on which is the best, but this is the one I use. I've found it is lightweight, performs well for search engines but has some minor concerns over accessibility.

## Using common elements

Most if not all clients have common elements to the header of websites. Specifically the logo and navigation. It seems strange that semantics do not exist in HTML for these elements. The logo is the title of the site so I give this a big fat h1 tag. I also make it a link to the homepage. For the navigation an unordered list works well. Here's the HTML I use. 


    <div id="header"> 
        <h1><a href="/" title="Return to the Home Page">Your Company Name</a></h1> 
        <ul> 
            <li><a href="/">Home</a></li> 
            <li><a href="/about-us">About Us</a></li> 
            <li><a href="/services">Services</a></li> 
            <li><a href="/portfolio">Portfolio</a></li> 
            <li><a href="/contact">Contact</a></li> 
        </ul> 
    </div>

With stylesheets turned off this makes sense. Now for the CSS.  


    #header 
        { 
        width: 760px;  
        float: left; 
        background-color: #000; 
    } 
    #header h1 
        { 
        float: left; 
        font-size: 1em; 
        text-indent:-9999px; 
    } 
    #header h1 a 
        { 
        width:150px;  
        height: 75px; 
        background: #000 url(../images/logo.png) top left no-repeat; 
        float:left; 
        text-decoration:none; 
    } 
    #header ul 
        { 
        float: right; 
        list-style: none; 
    } 
    #header li  
        { 
        margin-right: 0.1875em; 
        display: inline; 
        float: left; 
        text-align: center; 
        font-size: 1.6em; 
    } 
    #header li a 
        { 
        display: block; 
        padding: 0em 0.625em 0.3125em 0.625em; 
        color: #000; 
        background-color: #ccc;     
        text-decoration: none; 
    } 
    #header li a:hover 
        { 
        background-color: #fff;     
        color: #000; 
    }

I'm using image replacement to move the h1 text off the screen and replace it with an image. The unordered list is switched to display:inline to make it a vertical line.

## Concerns

This technique does pretty well. The code behind is robust and should perform well in screen readers. The major concern is that with images turned off the logo disappears and no alt text is shown. Having tried a few techniques this is the lesser of many evils for me and I've used this happily for around two years.

## What do you think?

I have been rethinking this recently so I'd be very interested to hear what others think. What is your preferred method for creating headers? Why?

This code is license under a [Creative Corners 3.0 License][9] so you are free to do what you wish with it. It is provided as is but has been tested in the following browsers.

*   Firefox 1+ Windows and Mac
*   Internet Explorer 5+
*   Opera 8.5+
*   Camino 1
*   Safari 2

[See the demo][1] or [download the source code here][2]

Juan Manuel Lemus has kindly [translated this article][10] into Spanish. Thanks Juan!

 [1]: https://shapeshed.com/examples/site-navigation-in-css-and-xhtml
 [2]: http://cdn.shapeshed.com/downloads/site_navigation_in_css_and_xhtml.zip
 [3]: / "Return to the Home Page"
 [4]: /
 [5]: /about-us
 [6]: /services
 [7]: /portfolio
 [8]: /contact
 [9]: http://creativecommons.org/licenses/by/3.0/
 [10]: http://dotpress.wordpress.com/2007/07/04/menu-de-navegacion-con-css-y-xhtml/

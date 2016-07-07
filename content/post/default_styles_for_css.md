{
  "title": "Default Styles for CSS",
  "date": "2007-03-06T00:00:00+00:00",
  "description": "Coding CSS can quickly run into difficulties with different browsers interpreting code in different ways. Designs will never look the same in every browser but you can help yourself by using a default style set when you start coding.",
  "tags": [
    "CSS"
  ]
}

## Comment your code

To start with it is important that you document your code. I like Andy Budd's approach of writing the version number and adding your email and website address before applying any rules. You can ease maintenance by noting changes, or at least saying where the log of amends is kept. 

    /*----------------------------------------------------------------------------- 
    [client] Screen Stylesheet 

    version:   1.0 
    date:      01/03/07 
    author:    [your email] 
    email:     [you at domain dot com] 
    website:   [your domain] 
    version history: [location of file] 
    @import url("typography.css");

## Remove default styles

[Tantek Celik][1] wrote a stylesheet to remove default styles from elements. This might suit you so have a look. Personally I find that one universal rule is enough to rebase elements. I haven't experience any performance issues using this on many different projects. 

    /* Remove padding and margin */ 
    *  
        { 
        margin: 0; 
        padding: 0; 
        border: 0; 
    }

Why do this? Browsers apply different styles to different elements. So it makes sense for me to know where I am starting from. This simple rule allows me to know that all elements will start by having no margin, padding or border.

## Have classes for floating and clearing

Next I have a class for clearing, again something I learnt from [Andy Budd][2] and his [excellent book][3]. Clearing floated elements is a common task so it is well worth it. Also you will probably want to float elements left and right so I like to have these too. I use these for images quite a lot.  

    .clear 
        { 
        clear:both; 
    } 

    .right 
        { 
        float: right; 
    } 

    .left 
        { 
        float: left; 
    }

## Set the document up

I have found that a good framework for setting up a document is to set font size and colour on the body tag. I apply any background image here to act as wallpaper. I use [Richard Rutter's approach][4] to sizing text using ems which I really recommend for maximum control over typography.

Then I have a wrapper div to hold the content and set the width of the page. This also centres the content and applies a white background. 

    body 
        { 
        font: 62.5%/1.5  "Lucida Grande", "Lucida Sans", Tahoma, Verdana, sans-serif; 
        background: url(/images/wallpaper.png) repeat; 
        color: #000000;     
        text-align:center; 
    } 

    #wrapper 
        {  
        width:980px;  
        text-align:left;   
        margin-left:auto;  
        margin-right:auto;  
        background-color: #FFFFFF; 
    }

## Handling typography

Then I like to set up the default font sizes. Using Richard Rutter's method we know the default size is 10pt so we can create accurate sizings. 

    h1 
        { 
        font-size: 2.2em; 
    } 
         
    h2 
        { 
        font-size: 2.0em;     
    } 
         
    h3 
        { 
        font-size: 1.8em; 
    } 
         
    h4 
        { 
        font-size: 1.6em;     
    } 
         
    h5 
        { 
        font-size: 1.4em;     
    } 
         
    p 
        { 
        font-size: 1.2em;     
    }

## Create sections

Large CSS documents are diffiuclt to manage. I like to divide mine up using sections of the page or even templates. Each project will vary but I like put some sections in by default and then change it if necessary: 

    /* Header 

    /* Footer 

    /* Your template 

    input.text 
      { 
      padding: 3px; 
      border: 1px solid #999999;     
    }

## Tables

Finally for tables I again use [Andy Budd's][2] default to know where I am in tables - I've found it works well. 

    /* Tables  
    -----------------------------------------------------------------------------*/ 

    table 
      {  
      border-spacing: 0; 
      border-collapse: collapse; 
    } 

    td  
      { 
      text-align: left; 
      font-weight: normal; 
    }

## Default XHTML

My default XTHML is as follows. Normally I add in print stylesheets, icons and RSS feeds as the project progresses. 

    <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd"> 
    <html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en"> 
    <head> 
        <title>Page title here</title> 
        <style type="text/css" media="screen">@import "/css/screen.css";</style> 
        <meta name="DC.title" content="Title here" /> 
        <meta name="DC.subject" content="Keywords here" /> 
        <meta name="DC.description" content="Description here" /> 
        <meta name="DC.format" content="text/html" /> 
        <meta name="DC.publisher" content="Publisher here" /> 
        <meta name="DC.language" content="en" /> 
        <meta http-equiv="Content-Type" content="text/html;charset=UTF-8" /> 
    </head> 
    <body> 
      <div id="wrapper"> 
      </div> 
    </body> 
    </html>

## A matter of personal choice

Of course I am not saying this is the best way to have a default template to begin coding templates. But it works for me. I'd be interested to hear what others do so please do leave a comment if there is anything you strongly agree or disagree with. 

If you'd like to download a copy of my default files you can [get them here.][5]

**Update**: Juan Manuel Lemus has [translated this article into Spanish][6]. Thanks Juan!

 [1]: http://tantek.com/log/2004/undohtml.css
 [2]: http://www.andybudd.com/
 [3]: http://www.cssmastery.com/
 [4]: http://clagnut.com/blog/348/
 [5]: http://cdn.shapeshed.com/downloads/default_css.zip
 [6]: http://dotpress.wordpress.com/2007/04/04/css-estilos-por-defecto/


{
  "title": "Managing colour schemes in CSS",
  "date": "2007-05-08T00:00:00+01:00",
  "description": "Managing colour schemes in CSS can be difficult. With a bit of PHP you can take control of colour schemes in your stylesheets.",
  "tags": [
    "CSS",
    "Design",
    "PHP"
  ]
}

## Why bother?

A fair question. The find and replace option will do a good job of changing the colours in your stylesheet if you need to. But wouldn't it be easier if you just had to change the colours in one place? What if you want to use a variable to set the colours? You would need to change many lines of code. Learning from CSS it is much easier and less time consuming to keep everything in one place. Furthermore I believe it helps to maintain integrity over a design.

## An example colour scheme

![Example colour scheme][1] 

Here's an example colour scheme. I usually like to have five colours ranging from darker primary colours to supplementary highlight colours. These colours have a logic in the design. They are not just applied randomly. So for me it makes sense to make this logic explicit in the stylesheets. 

## PHP to the rescue

PHP allows you to parse any document using the PHP engine. This means you can use PHP in your CSS files. To do this you need to add the following lines to your [.htaccess][2] file: 

    <IfModule mod_mime.c>
    AddType application/x-httpd-php .css
    </IfModule>

You also need to add the following to the top of all of your css files, even if you don't use PHP in them 

    <?php header("Content-type: text/css"); ?>

## Colour scheme as variables

Once you have set up your CSS files to use PHP you can declare your colour scheme as variables. 

    <?php
    // Colour scheme
    $primary = "#669966";
    $secondary = "#99cc99";
    $tertiary = "#ccffcc";
    $quaternary = "#e8fed8";
    $quinary = "#effce4";
    ?>

This can sit at the top of your css file or you can choose to keep it in a separate file and include it. It is up to you.

When you write CSS rules instead of writing the colour use the variable instead. 

    #example-id h4
        {
        background-color:<?php echo $secondary ?>;
    }

## Many benefits

I find there are many benefits to using this method:

* By separating the colour scheme from the main CSS you make it much easier to manage. If in future you want to allow users to choose colours it will simple to do so.
* If you want to apply a totally new colour scheme you can do so in a matter of minutes.
* Using this method forces you to think more carefully about the colour scheme.
* If a colour is not appropriate for an element of the design then you can quickly switch it to another one from the palette.
* I have always found large CSS files are difficult to wade through. Using this method solves the problem for colour at least.

 [1]: /images/articles/color_scheme.png 
 [2]: http://httpd.apache.org/docs/1.3/howto/htaccess.html

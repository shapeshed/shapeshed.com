+++
date = "2009-11-16T00:00:00+00:00"
description = "Sass, or Syntactically Awesome Stylesheets, is a great tool to make managing CSS files more intelligent and easier to maintain."
tags = ["Rails", "Ruby", "CSS"]
title = "Sass is a beautiful thing"

+++

## Managing CSS Files

Anyone who writes CSS on regular basis knows that it is difficult to keep on top of CSS files. Some choose to split CSS files out into components whilst others organise files by templates. Whichever way you do it there is universal agreement that the language itself is lacking a clean way keep your stylesheets organised.

For around 6 months now I've been using Sass, or Syntactically Awesome Stylesheet. It is a tool written in Ruby that greatly simplifies the creation and maintaining of CSS files, particularly on large projects. 

Sass still outputs CSS files but provides a great way to manage files before they are generated as CSS. 

## Installation

If you've got Rubygems installed on your system installation is simple

    sudo gem install haml

(You may be prompted for the password for the account you are logged in as at this point.)

There is information on how to install RubyGems available <a href="http://docs.rubygems.org/read/chapter/3">here</a> or a simple Google search for your operating system will find useful pages. 

## Converting existing files to sass

If you've got existing css files that you'd like to convert to sass files there is a handy utility available to you via the command line

    css2sass style.css style.sass

## Syntax

Once you've converted your css file open the sass file have a look. You'll notice that the file looks slightly different. Mainly that indentation is used to create the rules. Indentation is important to sass and it is sensitive to it. The Sass documentation has a <a href="http://sass-lang.com/tutorial.html#nesting">useful comparison</a> of classic CSS and Sass that should help you understand. 

## Variables

At last! Variables in CSS. For this feature alone using Sass is worth it.

The following is an example of defining variables for colours

    !warning = #cc3333
    !success = #33cc33

These variables are then available for you to use within your css

    #mydiv
      color: !warning
    #anotherdiv
      color: !warning
  
This makes maintaining and re-skinning much simpler!

## Mixins

Mixins are another great feature allowing you to define reusable bits of CSS. Take this example where we want to apply rounded corners

    =rounded-corners
      -moz-border-radius: 5px
      -webkit-border-radius: 5px
      border-radius: 5px

We can then apply rounded corners to any div like this

    #mydiv
      +rounded-corners-5px

## More features

Sass comes with many more features including <a href="http://sass-lang.com/tutorial.html#nesting">property nesting</a>, <a href="http://sass-lang.com/tutorial.html#parent_reference">parent referencing</a>, <a href="http://sass-lang.com/tutorial.html#operations">operations</a> and <a href="http://sass-lang.com/tutorial.html#interpolation">interpolation</a>. They are well documented so I won't repeat that here - visit the <a href="http://sass-lang.com/tutorial.html">tutorial site</a> to learn more.

Sass also lets you specify the output of your css files. If you want to compress it to the smallest possible size it can output that for you, or if you'd rather have a pretty nested style that's included too. 

## Generating CSS from Sass

If you are using Rails in development mode you don't even have to think about it. If you place your sass files in a 'sass' folder within stylesheets, Rails will automatically regenerate the file for you.

If you are developing in PHP or a static site you'll need to install <a href="http://wiki.github.com/chriseppstein/compass">Compass</a>. Compass is a CSS Framework in its own right but comes with a useful utility to re-generate your CSS files when your Sass files change. 

To install it use

    gem sources --add http://gems.github.com/
    sudo gem install chriseppstein-compass

Then you'll need to set compass up to watch your directories using the command line tool in the root of your site. 

    compass --sass-dir=src/sass --css-dir=assets/stylesheets --javascript-dir=assets/javascripts --images-dir=assets/images my_project

This will generate a config.rb file in the root of your site, so if you ever need to change folder locations you can do it there.

Then to set compass off run

    compass --watch

This will then run and regenerate the css files in realtime if there are any changes to the Sass file (as you edit).

## A great tool

I highly recommend becoming familiar with Sass if you can. It solves many of the problems inherent in CSS.

## Links

* <a href="http://sass-lang.com/tutorial.html">Sass tutorial</a>
* <a href="http://sass-lang.com/docs/yardoc/SASS_REFERENCE.md.html">Sass documentation</a>
* <a href="http://wiki.github.com/chriseppstein/compass">Compass</a>

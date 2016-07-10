{
  "title": "Controlling font size using CSS",
  "date": "2007-01-11T00:00:00+00:00",
  "description": "CSS offers designers a great deal of control over text and has good browser support. Many web designers overlook Typography, a crucial element of design. This article looks at a best practice method for controlling font size on your website. ",
  "tags": [
    "Typography",
    "CSS"
  ]
}

## Controlling typography - a solid base

Controlling the size of type is the first challenge a web typographer will face. Different browsers may not display font size consistently. Furthermore if you want your site to be usable and accessible you will want to allow users to resize text. Fixing the size of your text is not an option. Over at [Clagnut][1] there is a [great article][2] explaining how to maintain control over font size whilst allowing users to resize text. This is a classic article and one I recommend you read.

The idea is that you take the default browser text size of 16pt and work with this to control the size of typography. First the body tag is used to reduce the default size to 62.5% of 16pt. This results in a default size of 10pt, which makes creating new rules and managing CSS rules easy. 

    body{ 
      /* Reduce default font size to 10pt */
      font: 62.5%/1.5  "Lucida Grande", "Trebuchet MS", Tahoma, Verdana, sans-serif;
    }

Now we are ready to control the font size using ems

## What is an em?

An em is a traditional unit of measurement among typographers. It is a sliding scale based on the horizontal width of your font. An em is directly proportional to the pt size of your font so for a 16pt 1 em is equal to 16 points. Using ems allows you to maintain control and allow text to be resizable. 

## How do I use ems?

Using the CSS rule above all text is resizable and by default is 10pt. To increase or shrink the font size we define subsequent rules that are inherited in the cascade.  

    p {font-size:1em} /* This keeps the font at 10pt */
    h2 {font-size:1.2em} /* This increases the font to 12pt */
    .small {font-size: 0.8em} /* This decreases the font to 8pt */

Want to see this code in action? [Check out the demo page][3]

I love this method and thoroughly recommend it. You will save time and maintain tighter control of your typography whilst allowing users to resize text if they wish.

 [1]: http://www.clagnut.com
 [2]: http://www.clagnut.com/blog/348/
 [3]: https://shapeshed.com/examples/font-size-css/

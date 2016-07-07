{
  "title": "Using background images with links",
  "date": "2006-10-29T00:00:00+01:00",
  "description": "Associating icons with links can in my opinion be a powerful design device. With a small amount of CSS it is simple to add icons into your links.",
  "tags": [
    "CSS"
  ]
}
To apply an icon to links in CSS you use background-image. Although you should use icons on links sparingly icons can greatly improve the usability of a site. In this example we have a link that goes to a journal entry page. Make an icon using Illustrator, Photoshop or your favorite imaging software. Make sure that it relates well to the size of the text it appears next to. Here I've made a simple pencil: ![Pencil icon][1]

## The Markup

In this example we have a simple link within a div 

    <div id="example-link">
      <a href="#">Link to journal article</a>
    </div>

## The CSS 

    #example-link a { 
      padding-left: 15px; 
      background: url(/images/examples/bglinks/pencil_icon.gif) 3px 1px no-repeat; 
    } 

## Explanation:

Padding left - This moves the text away from the image. Depending on the width of your image you will need more or less padding

Background - This has the rules associated with the the background image

*   url(/images/examples/bglinks/pencil_icon.gif) - This is the path the image you want to be your icon.
*   3px 1px - These values position the background image. The first value is the background image's distance from the left of the a tag, the second is the distance from the top of the a tag.
*   No-repeat tells the browser only to show the image once.

## The code in action

A simple icon applied to a link using CSS. (If you are reading this in a newsreader you won't see the image) 

 [1]: http://shapeshed.com/images/articles/pencil_icon.gif 

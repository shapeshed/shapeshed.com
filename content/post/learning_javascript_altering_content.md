{
  "slug": "learning-javascript-altering-content",
  "title": "Learning Javascript - Altering Content",
  "date": "2007-03-29T00:00:00+01:00",
  "description": "Using unobtrusive Javascript you can simply change content and styles on your page without returning to the server. Done right you can also keep it accessible and maintainable. ",
  "tags": [
    "JavaScript",
    "DOM"
  ]
}

This is the third in a series of articles about my experience of Learning Javascript. I am a beginner at learning Javascript, although I am a proficient XHTML and CSS coder. These articles are meant to help others like me learn so if you don't understand anything or have any insight to offer please chip in.

Can't wait? [See the example][1] or [download the source code][2].

This article covers switching content and changing styles on the fly using Javascript. For me this is an extremely powerful facet of Javascript. You hook into both XHTML and CSS to produce something that transcends the capability of CSS and XHTML on their own. Gradually I am seeing what all the fuss is about. Used correctly Javascript can greatly enhance user experience.

## What we want to achieve

In this example I've supposed there is some very important content on a page that we really want users to read. The idea is that if the text is not clear enough to users then they click a link and it is enlarged with a stronger contrast. This method would also work for a basic show and hide too. 

Here's what we want to do:

* When a user clicks the trigger link switch the style of div containing the important content
* Then change the link text to allow the user to return to the low contrast version
* If the user clicks the link again switch the style of the div back to the low contrast version
* Then change the link text to the user to return to the high contrast version

If Javascript is turned off we take the user to a page with the high contrast version on it, so it is the best of both worlds. 

At this point it might be a good idea to [view the example][1] or [download the source code][2] which will work on your local machine.

## Changing the name of a class

Using Javascript you can change the name of a class within your document by finding the element via the DOM and then using element.className = "your-class". This sets the class name so it will override any style that is already set. All pretty simple really and can obviously have a lot of uses. You will of course need to specify the styles that you want in your stylesheet.

## Switching text

It is also quite straightforward to change the text. Using the DOM you can be as precise as a surgeon in finding the element and content you want to change. In this example we want to find an a tag within a paragraph tag and then change the text. In terms of the order we want to:

* Find the element we want to target. We can do use getElementById to find this.
* Navigate to the link within the target. This happens to be the first child so we can use firstChild.
* Now we are in the link we want to change the text. We use nodeValue for this.

The function below is crude but shows how you can switch both content and styles using the methods described above. It is also very cross browser friendly (tested browsers given after the function). Hopefully you should be able to follow the comments. Again I'm using [Simon Willison's addEvent][3] to make sure the function is ready when the page has loaded.  

    function alterContent() {
      var updateDiv, // The div for which the styles are switched    
      trigger, // The link that fires the function
      toggle1 = "View Low Contrast Version", // Text for link to view low contrast
      toggle2 = "View High Contrast Version", // Text for link to view high contrast
      class1  = "low-contrast", // Class name for low contrast
      class2  = "high-contrast"; // Class name for high contrast

      // Check the browser supports getElementById
      if(!document.getElementById) { return; }

      // Find the div with the id trigger
      trigger = document.getElementById("trigger");

      // If it isn't there return
      if (!trigger) { return;}    

      //It is there so do some stuff
      trigger.onclick = function(){
        // Find div that holds the content
        updateDiv = document.getElementById("updateDiv");

        // If it isn't there return
        if (!updateDiv) { return;}

        // It is there so switch classes
        // Find out what the link is first
        // If it is class 1 then switch to class 2
        if (updateDiv.className == class1){
          // Switch class
          updateDiv.className = class2;
          // Switch text
          trigger.firstChild.nodeValue= toggle1;
          // Disable the link by returning false        
          return false;
        }
        else{
          // It must be class 2 so switch to class 1
          updateDiv.className = class1;
          // Switch text
          trigger.firstChild.nodeValue= toggle2;
          // Disable the link by returning false
          return false;
        }
      }    
    } 

You can view this [code in action here][1] or [download the source code][2]. If you have any insight or don't understand anything please let a comment below

Tested ok on:

*   Win IE5+
*   Win Firefox 1+
*   Win Opera 7+
*   Win Netscape 7+
*   Mac IE5.2
*   Mac Safari 2
*   Mac Firefox 1+
*   Mac Camino 1
*   Mac Opera 9

[1]: /examples/altering-content/
[2]: http://cdn.shapeshed.com/downloads/altering-content.zip
[3]: http://simonwillison.net/2004/May/26/addLoadEvent/


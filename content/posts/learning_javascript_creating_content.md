+++
date = "2007-03-26T00:00:00+01:00"
description = "Using Javascript and the DOM you can create content on the fly. You can also make sure that if Javascript is turned off things won't go wrong."
slug = "learning-javascript-creating-content"
tags = ["JavaScript", "DOM"]
title = "Learning Javascript - Creating Content"
+++

## Creating content

This is the second in a series of articles about learning Javascript. I am not
an expert, specifically I am a competent XTHML and CSS coder looking to pick up
new skills. If you can add any insight please feel free to add a comment. This
is meant to help people learn.

Jump straight [to the example if you like][1] or [download the source code][2]

## createElement and createTextNode

Using the DOM and Javascript it is possible to add content into your page
dynamically when a user performs an action without returning to the server.
Using createElement and createTextNode we can add HTML to the page. In this
example we will add a paragraph with some text when a user clicks a link. We
will use createElement to create p tag. Then createTextNode to add text within
the paragraph tag.

## The markup

First of all let's create some markup that we can use to hang our Javascript
off.

```html
<h1>Leaning Javascript - Creating content</h1>
<p>
  <a href="non_js_content.html" id="trigger"
    >Clicking this link will dynamically create content</a
  >
</p>
<div id="updateDiv">
  <h2>Update panel</h2>
  <p>
    A new paragraph will be added in here when the user clicks the link above
  </p>
</div>
```

There are two ids here for the Javascript to hook into. The first is "trigger".
This is the link that users will click to add content to the page. The second is
"updateDiv". This is where the generated content will be appended. Note if
Javascript is turned off then there is a link to take the user to another page.

## The Javascript

```js
function createContent() {
  // Start by declaring our variables
  var updateDiv; // The div we are putting the new content in
  var trigger; // This is the link that fires the function
  var newParagraph; // The new paragraph tag
  var newText; // The new text

  // Check the browser supports getElementById. If not return.
  if (!document.getElementById) {
    return;
  }

  // Find div that holds the content
  updateDiv = document.getElementById("updateDiv");

  // If it isn't there return
  if (!updateDiv) {
    return;
  }

  // Find the div with the id example
  trigger = document.getElementById("trigger");

  // If it isn't there return
  if (!trigger) {
    return;
  }

  //It is there so do some stuff
  trigger.onclick = function () {
    // Create a new paragraph element
    newParagraph = document.createElement("p");
    // Create some text
    newText = document.createTextNode(
      "This paragraph was dynamically inserted using the DOM"
    );
    // Put the text in the new paragraph element
    newParagraph.appendChild(newText);
    // Append the new paragraph to the update Div
    document.getElementById("updateDiv").appendChild(newParagraph);
    // Disable the link by returning false
    return false;
  };
}
```

Hopefully the comments should guide you through this. Basically we look for the
updateDiv and trigger ids and then wait for the user to click the link. When the
link is clicked the content is created and inserted. We use appendChild to put
the newly created paragraph and text into the updateDiv container.

Again I'm using Simon Willison's [addEvent script][3] to get the function ready
when the page is loaded. You can see the code in action [in the
demonstration][1] or [download the source code][2]

## Cross-browser friendly

This seems to be very cross browser friendly. I've tested it ok in the
following:

- Win IE5+
- Win Firefox 1+
- Win Opera 7+
- Win Netscape 7+
- Mac IE5.2
- Mac Safari 2
- Mac Firefox 1+
- Mac Camino 1
- Mac Opera 9

[1]: /examples/creating-content/
[2]: /downloads/creating-content.zip
[4]: http://simonwillison.net/2004/May/26/addLoadEvent/

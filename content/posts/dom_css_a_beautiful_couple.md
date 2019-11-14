{
  "slug": "dom-css-a-beautiful-couple",
  "title": "DOM + CSS = A beautiful couple",
  "date": "2006-12-13T00:00:00+00:00",
  "description": "Understanding how the DOM works and using it in your CSS can help produce mean, lean code. Here's a quick overview of how it works.",
  "tags": [
    "DOM",
    "CSS"
  ]
}

## What's on earth is the DOM?

According to the W3C the [DOM][1] is:

> The Document Object Model (DOM) is an application programming interface (API) for valid HTML and well-formed XML documents. It defines the logical structure of documents and the way a document is accessed and manipulated. 

You what!? OK you will understand that eventually but here's how I understood it. Let's suppose I am on the street outside my house and I want to get a can of beer from the fridge in my house. 

First I open the front door, then the kitchen door, then the fridge. Then I pick up the can and ahhh... the taste of cold beer.

If I see my house as an object (you need to understand this term) this is what I see

![The DOM Tree][2] 

As linear text this can be shown as: Front door > Kichen > Fridge > Beer

We could say this is a route for me to access my beer.

Of course there are many ways you could map the house as an object. Thankfully we have a standard for web pages - HTML or XHTML. The same principles as me getting a beer from my fridge apply to finding things in an XHTML document. Look at the code below - I go through the front door, the kitchen and the fridge to get to my beer. 

    <html>
      <head>
      <style type="text/css" media="screen">@import "css/screen.css";</style>
      </head>
      <body id="front-door">
        <div id="kitchen">
          <div id="fridge">
            <p>My can of beer</p>
          </div>
          <div id="freezer">
            <p>Pizza</a>
          </div>
        </div>
        <div id="lounge">
          <div id="sofa">
            <p>Newspaper</p>
          </div>
          <div id="chair">
            <p>Cushion</p>
          </div>
        </div>
        <div id="bedroom">
          <div id="bed">
            <p>Duvet</p>
          </div>
          <div id="lamp">
            <p>Lightbulb</p>
          </div>
        </div>
        <div id="bathroom">
          <div id="shower">
            <p>Shower Gel</p>
          </div>
          <div id="sink">
            <p>Soap</p>
          </div>
        </div>
      </body>
    </html>

If you have a well structured document you can use lean CSS where you don't need to keep creating new classes each time you want to style something. This cuts down on code weight and maintenance. If you are going to use Javascript having a well structured DOM will help you do pretty much anything you want. 

Lets say I want to make "My can of beer" bold. I don't actually need to change the document at all. Using the DOM tree I can specify a rule that will make the text bold. 

    #front-door #kitchen #fridge p 
      {
      font-weight: bold;
    }

Don't believe me? [See the demo.][3]

Using the DOM in CSS is not limited to classes or ids that you create. You can use any element to walk through the document - any HTML tag in fact. Granted it is not quite as advanced as javascript in allowing you to move up and down the DOM but it does allow you to quickly target elements on the page. 

If you are using CSS, understanding and using the DOM is well worth it. What's more once you have grasped the concept a whole new world is opened up to you including XML and Javascript. So all together... ahhhh what a beautiful couple. I'm off for a beer.

 [1]: http://www.w3.org/TR/DOM-Level-2-Core/introduction.html
 [2]: /images/articles/dom_tree.png 
 [3]: /examples/css-dom/

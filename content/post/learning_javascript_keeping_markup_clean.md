{
  "slug": "learning-javascript-keeping-markup-clean",
  "title": "Learning Javascript - Keeping Markup Clean",
  "date": "2007-03-15T00:00:00+00:00",
  "description": "Like many front end developers I've come to Javascript late. Of course I could go and grab one of the many Javascript libraries out there. But I'm making an effort to learn Javascript. Thankfully it isn't as hard as you might think.",
  "tags": [
    "JavaScript",
    "DOM"
  ]
}

## Learning Javascript

I'm going to be writing a series of articles in which I outline my experiences of learning Javascript. I am not an expert and specifically I'm a beginner with a good background in standards based CSS and XHTML who wants to learn modern Javascript. So if you don't understand something leave a comment, and if you are an expert then please chip in. Hopefully this will help others to start learning these skills. 

## Getting the philosophy

Just like Web Standards for XHTML and CSS, learning Javascript is much easier if you grasp some underlying principles. The first is Graceful Degradation. This means that whilst you use all of the great things that Javascript brings it is important that the site still functions on older browsers and / or with certain options turned off. From an XHTML and CSS stance an example of this would be adding alt tags. If images are turned off then users get the alt text. 

This goes hand in hand with Progressive Enhancement. Progressive Enhancement is meant to sound the death of Graceful Degradation but in fact the two are very similar. Progressive Enhancement means that users with modern, capable browsers get a better and more rich experience than users on older browsers. So someone with a really old browser will get a sparce HTML page whilst someone with the latest browser will get all the bells and whistles. Progressive Enhancement is comfortable with that, serving a richer experience to users who can handle it. 

What both of these philosophies have in common is the separation of markup from style and keeping Javascript out of the markup. Starting with valid, semantic and clean markup will mean you can follow either route. 

For me Graceful Degradation is a half empty glass, whilst Progressive Enhancement is half full. They are both similar in what they are looking to achieve - a working site for all users.

## Old methods - Javascript in the document

At this point you might want to [view the example][1] or [download the source code][2]

This might seem very familiar to front end developers who have made the transition to CSS. Historically Javascript was placed in the markup, just like font tags. Javascript was in between the body tags, it was in links, it was in onclick events. 

    <a onclick="oldJS(); return false;" href="#">old school javascript</a>
    <a onclick="javascript: oldJS(); return false;" href="#">more old school javascript</a>
    <a href="javascript: oldJS();">yet more old school javascript</a>

This is bad for a number of reasons: accessibility, browser support, maintenance and the fact that it causes real problems when javascript is turned off. It can cause search engine spiders to stop indexing a page too if there are javascript errors.

## The modern method - use the DOM

If you are a CSS coder then you are probably familiar with the DOM. This is the Document Object Model. You probably use it to create rules and access elements within the document for your CSS. The good news is that if you understand it Javascript gives you more flexibility to find, create, amend and delete elements within your document. And all without going back to the server or using an AJAX call. If you don't understand it there is a short tutorial from a CSS perspective [available here.][3]

Using the DOM we can find a link with the id "good-js" and do something with it. In this case we will attach an onclick event to it. 

    function modernJS() {

    // Check the browser supports getElementById so we can find our link
    if(!document.getElementById) { return; }

    // Find the trigger link with the DOM. This looks for the id good-js
    var goodJs = document.getElementById("good-js");

    // If it isn't there return
    if (!goodJs) { return; }

    // We've made it here so a link with with the id good-js exists. Wait for onclick and do something
    goodJs.onclick = function()
      {
      alert("That's better isn't it. No need to make the markup dirty!");
      return false;
      }
    }

## Attaching the function to onload

Adding the function to the onload event is basically getting it ready for when the user triggers it with the event. In this case it is an onclick, but it needs to be ready when the page loads.

Traditionallly window.onload was used but this wasn't perfect so a number of onload scripts have been created. Most Javascript libraries have scripts that handle onload. Simon Willison wrote [a short script][4] that seems to do the trick.  

    function addLoadEvent(func) {
      var oldonload = window.onload;
      if (typeof window.onload != 'function') {
        window.onload = func;
      } else {
        window.onload = function() {
          if (oldonload) {
            oldonload();
          }
          func();
        }
      }
    }

    addLoadEvent(modernJS);

You will see that we have asked the function to load in the modernJS function when the page loads. So everything is ready.

## The markup

Using the DOM and onload we can keep our markup clean and lean. It also means that if Javascript is turned off then the user is taken through to alternative content rather going nowhere. 

    <a id="good-js" href="non_js_content.html">The modern way of doing it</a>

So when a user with Javascript clicks the link the modernJS function is fired. If they don't have Javascript they will be taken to another page. So it is good for all users, search engines and accessibility. We have separated our markup and Javascript and hopefully you can see why this is important. 

If you've made it this far you can [download the source code][2] or [view the example][1]

## Join the fun

OK - you could go out and grab a Javascript library. But isn't it time you started learning what was really going on? If you disagree with anything written here please leave a comment. This is meant to help people learn.

 [1]: /examples/keeping-markup-clean/
 [2]: http://cdn.shapeshed.com/downloads/keeping-markup-clean.zip
 [3]: /dom_css_a_beautiful_couple/
 [4]: http://simonwillison.net/2004/May/26/addLoadEvent/

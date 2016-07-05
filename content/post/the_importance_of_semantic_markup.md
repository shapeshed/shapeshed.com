{
  "layout": "post",
  "title": "The importance of semantic markup",
  "date": "2007-02-10T00:00:00+00:00",
  "description": "Creating web documents that have meaning behind the page rendered in a browser is very important. Here are some pointers as to how to understand and write semantic markup. ",
  "tags": [
    "XHTML"
  ]
}

## What does semantic markup mean?

Let's start with the word semantic. Semantics is the study of language meaning. For language this is the words we use to communicate. For HTML it is the tags we use to mark a document up. An example is the p tag for paragraphs which tells the browser that the text within a p tag is a paragraph.

Markup is how the a web document is created, or the way you write a document using the language available to you. For most web documents this is still HTML, so it is how you write the content you want to display using HTML

Creating semantic markup is nothing more complicated than understanding the language of HTML and using it to create a document that has semantic meaning. 

## That's enough theory! What does it mean?

Here's an example of something we want to markup in an HTML document. It is a shopping list:

Jam, Eggs, Butter, Beer

We could leave this list in between paragraph tags as it is at the moment. But HTML provides structure to create documents that capture the semantic meaning. In this case an unordered list can be used to put this list on a web page. 

    <ul>
        <li>Jam</li>
        <li>Eggs</li>
        <li>Butter</li>
        <li>Beer</li>
    </ul>

## The danger of CSS

CSS is great for styling documents. You can access any element, or give it a class name and apply a class name to it. In terms of what the user sees a Paragraph tag can be made to look exactly the same as a Heading 1 tag. Once the page has been rendered in the browser the user does not really care whether text is within a Paragraph or Heading 1 tag as CSS takes over and styles it. But behind the scenes it doesn't have much meaning.

## So why does semantic markup matter then?

If a user can see the web page as you intended it in a browser why does it matter if the document isn't semantic? Well it matters quite a lot. Firstly Google and other search engines see the page without styles. The only way for search robots to understand which elements on the page are more important than others is through the markup. If the business name is within a Paragraph tag it is likely to get lost in other content and not be returned in search engine results. But if you put it within a Heading 1 tag the search robots know to give it more importance. So search engine optimisation is one very good reason to use semantic markup.

Secondly a document is easier to style if it is marked up correctly. If all your section headings are Heading 2 tags you only need to specify one CSS class and all section headings are styled. If in the future you want to change your design entirely a well marked up document will make the exercise simple. 

Thirdly many other user agents won't understand your stylesheet, whether it be a mobile device or the next big thing on the internet. By writing semantic markup you are future proofing your documents. HTML is like a common language - if you take the time to understand it and write documents semantically your code will stand the test of time. If you choose to write poorly formed HTML it is like a dialect - some will understand you very well but others won't understand you at all, and it is likely you will need to translate it in the future.

## Microformats - Semantic Markup on Steroids

[Microformats][1] are a way of further enhancing HTML documents based on an agreed set of semantic terms. You can use them to add further meaning to documents in areas where HTML is lacking a little. hCalendar for example is a way of marking up your document to tell user agents that the strings within the HTML tags represent specific elements of a calendar event. 

Here are two examples of the same event: 

    <p>My birthday: Time to celebrate and shake your rump! 25th Jan 2007 8pm til 4am.</p>

    <div class="vevent">
      <abbr class="dtstart" title="20070125T2000Z">January 25th 8pm</abbr>, 
      <abbr class="dtend" title="20070126T400Z"> 4am</abbr> &mdash; 
      <span class="summary">My birthday</span>
      <span class="location">London</span>
      <div class="description">Time to celebrate and shake your rump!</div>
    </div>

Using Microformats gives the document much more meaning and allows other software and applications to access the code and use it. One great use of Microformats is giving users the ability to download this information to their Calendar software. Without semantic markup you can't do this.

## I'm sold - what next?

Hopefully you can see the importance of the semantic web both for now and for the future. In order to start coding semantically you really need to understand HTML in detail. There is no real way to get round this other than study. But it is well worth looking through the elements, or tags, in HTML and learning them. The more you learn the clearer and easier it will become. It is not complicated - I liken it to speaking a language. Once you get it it is second nature. 

## I'm not sold - it is all a load of rubbish!

It is isn't rubbish. Using semantic markup you will give the following benefits:

*   Better search engine rankings
*   More maintainable code
*   Easier code to style with CSS
*   More accessible code for blind and partially sighted users
*   You are future proofing your code
*   You are using the right tools for the job

You can choose to ignore semantic markup if you want but you will make your job a lot harder!

 [1]: http://microformats.org/

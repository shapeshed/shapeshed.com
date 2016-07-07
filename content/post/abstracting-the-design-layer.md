{
  "title": "Abstracting the design layer",
  "date": "2011-02-02T00:00:00+00:00",
  "description": "Abstracting the entire front-end layer may seem like a drastic measure but with some excellent tools available there are compelling reasons to do it.",
  "tags": [
    "HTML",
    "CSS",
    "JavaScript"
  ]
}

## Overview

Whilst working on a [Node.js][1] project I realised that using various tools I had extracted the entire design layer of the site. 

## CSS

There are now several mature and stable frameworks available to developers to help fill the gaps in CSS. [Sass][3] is my tool of choice - I've [written about it before][2], also I've also been using [LESS][4] on a few projects recently. Using the Sass project you can now also use syntax that is very close to vanilla CSS. Here's an example:

    blue: #3bbfceg;
    $margin: 16px;

    .content-navigation {
      border-color: $blue;
      color:
        darken($blue, 9%);
    }

    .border {
      padding: $margin / 2;
      margin: $margin / 2;
      border-color: $blue;
    }

I'm agnostic as to which framework is best but unless the site is very small I always use a frameowrk. Sass can be pre-compiled so it doesn't add any overhead when the site is delivered and also provides options on whether the CSS file is pretty printed or compressed for minimum file size. Compass also provides some very useful features for CSS3 support. One common scenario is adding a border radius. As the spec is still in progress browser vendors are using prefixes. [Compass][5] takes account of this:

    @include border-radius(4px, 4px);

compiles to 

     -webkit-border-radius: 4px 4px;
     -moz-border-radius: 4px / 4px;
     -o-border-radius: 4px / 4px;
     -ms-border-radius: 4px / 4px;
     -khtml-border-radius: 4px / 4px;
     border-radius: 4px / 4px; 

This is particularly good as if and when the spec is formalised and a universal syntax is agreed then it is very likely that compass will be updated and you won't need to do anything other than regenerate your files.

## HTML

HTML also has a number of templating languages that abstract writing raw HTML. The advantages are mainly syntax checking - the tools won't complile if you have an error. If you care about writing valid HTML this ia great idea. For Ruby my tool of choice is [HAML][6]. In Node.js a dialect of HAML is available in [jade][7]. Here's an example of jade.

    !!! 5
    html(lang="en")
      head
        title My site
      body
        h1 Site title
        #wrapper
          p Oh hai!

Particularly when you are interacting with a database and outputting data to views I find these templating languages really useful. Again there are many templating languages available. I'm agnositc other than my opinion that you should be using one. 

## JavaScript

The final piece of the puzzle is JavaScript. JavaScript is a hated and loved language with a great object model at heart. I've been writing native JavaScript for quite a while now so I was interested to find the [CoffeeScript][8] project. In the last year JavaScript has become trendy again with Node.js and many developers coming from Ruby found JavaScript's syntax ugly. CoffeeScript abstracts JavaScript and presents JavaScript in a more Ruby like syntax. In compiling to JavaScript it also runs the code through [JSLint][9]. I can take or leave the syntax improvements but automatically running the code through a tool that empasises quality is a great sell for me. Here's are the examples from the documentation:

    song = ["do", "re", "mi", "fa", "so"]

    singers = {Jagger: "Rock", Elvis: "Roll"}

    bitlist = [
      1, 0, 1
      0, 0, 1
      1, 1, 0
    ]

    kids =
      brother:
        name: "Max"
        age:  11
      sister:
        name: "Ida"
        age:  9

Compiles to

    var bitlist, kids, singers, song;
    song = ["do", "re", "mi", "fa", "so"];
    singers = {
      Jagger: "Rock",
      Elvis: "Roll"
    };
    bitlist = [1, 0, 1, 0, 0, 1, 1, 1, 0];
    kids = {
      brother: {
        name: "Max",
        age: 11
      },
      sister: {
        name: "Ida",
        age: 9
      }
    };

## Conclusion

Abstracting the entire front-end layer may seem drastic. There is new syntax and frameworks to learn for a start. If you working in a team of more than one developer there may also be a reluctance to move to frameworks. But for me the value is immense. With CSS you can improve code maintainability and defend against the evolving CSS3 spec and implementations. With HTML you can ensure your code is valid and make it more readable with indentation based languages like HAML or jade. With JavaScript you get a prettier syntax (which I can take or leave) but more importantly your code is automatically checked for quality by JSLint. Many JavaScript developers do this anyway but automating this has to be a good thing. 

Frameworks and abstractions are not for everyone and I certainly would not consider using frameowrks on micro or nano projects. But for large complex applications they make a lot of sense to me.

## Related links

* [Sass][3]
* [LESS][4]
* [Compass][5]
* [Haml][6]
* [jade][7]
* [CoffeeScript][8]
* [JSLint][9]

[1]: http://nodejs.org
[2]: http://shapeshed.com/sass-is-a-beautiful-thing/
[3]: http://sass-lang.com/ 
[4]: http://lesscss.org/
[5]: http://compass-style.org/
[6]: http://haml-lang.com/
[7]: http://jade-lang.com/
[8]: http://jashkenas.github.com/coffee-script/
[9]: http://www.jslint.com/

{
  "title": "The void of undefined in JavaScript",
  "date": "2013-03-28T08:16:55+00:00",
  "description": "You can't trust undefined in JavaScript even after ES5 made it immutable",
  "tags": [
    "JavaScript"
  ]
}

## Undefined 

Undefined is a JavaScript primitive that is used when a value has not been assigned a value. If you have done more than one day's programming in any language you will realise that this is an important building block for programmers.

You can check if a value is undefined in JavaScript like this 

    if (typeof x === "undefined") { 
      console.log('it is undefined'); 
    }

You might choose to set a defined value to undefined.

    var foo = 'bar';
    console.log(foo); // "bar"
    foo = undefined;
    console.log(foo); // undefined

What you may know is that until ES5 undefined was mutable so if there are other scripts on your page there is chance it could cause unwanted results.

    // a naughty global variable from another script
    var undefined = "oops";

    var foo = 'bar';
    console.log(foo); // "bar"
    foo = undefined;
    console.log(foo); // "oops"

ES5 improved this by making undefined immutable. If your JavaScript engine [supports ES5][4] (and that feature) you are good. Or you might think you are. Because undefined isn't a reserved word it may be used as a function argument name. This also leads to unwanted results.

    var foo = function (undefined) {

        "use strict";

        var x = "foo";
        console.log(x); // "foo"
        var x = undefined;
        console.log(x); // "oops"

    };

    foo('oops');

Let's say someone is using your library within that function and you reference undefined. You get the string "oops". Oops indeed.

Update: Axel Rauschmayer contacted me via Twitter over this section.

> @shapeshed “someone is using your library within that function and you reference undefined.” Unproblematic (static vs. dynamic scoping).

-- <cite>[@rauchma][5]</cite>

Hopefully my response clears this up. It is not an issue within a function but it would be if undefined has been decalred globally. Run the jsfiddle examples to illustrate this.

> @rauschma yes within a function http://jsfiddle.net/pv244/1/ . still an issue globally. http://jsfiddle.net/zwhn2/1/ . will clarify post. thanks!

-- <cite>[@shapeshed][6]</cite>

## Void

Void in JavaScript is one of Crockford's bad parts of Javascript 

> In many languages, void is a type that has no values. In JavaScript, void is an operator that takes an operand and returns undefined. This is not useful, and it is very confusing. Avoid void.

-- <cite>[Douglas Crockford][1]</cite>

ES5 [defines void][2] as a unary operator returning undefined for whatever it is given. Noteably `void` is also a reserved work in JavaScript meaning you cannot reassign void. In the console we can see what void does

    void 0
    undefined

Several libraries and frameworks use void in place of undefined presumably because it is absolutely immutable and can be relied on to return undefined in whatever context it is used.

Underscore.js uses it to check if a value is undefined

    _.isUndefined = function(obj) {
        return obj === void 0;
      };

The Closure compiler also favours `void 0`

    var foo = undefined;

Compiles to

    var foo=void 0;

## Swerve the bear trap

Undefined is another potential bear trap in JavaScript that can lose hours in debugging that can be avoid if you understand how it works. Because JavaScript can always be run in the context of other scripts you might well reference undefined and then find that somewhere else it has been redefined, either by being reassigned in ES3 or being used as a function argument in ES5. 

Of course this is terrible programming but if you throw your scripts out there on the web you've got to expect that somewhere, at some time someone is going to do it. You can use linters to some extent to avoid this. JSHint for example allows you to enforce ES5 mode which will complain if you try and reassign undefined, but using undefined as a function argument is legal. 

Whether you chose to use `void 0` or not is up to you, but you should at least be aware that undefined isn't absolutely immutable. 

[1]: http://oreilly.com/javascript/excerpts/javascript-good-parts/bad-parts.html
[2]: http://es5.github.com/#x11.4.2
[3]: http://javascriptweblog.wordpress.com/2010/08/16/understanding-undefined-and-preventing-referenceerrors/
[4]: http://kangax.github.com/es5-compat-table/
[5]: https://twitter.com/rauschma/status/395301555592634368
[6]: https://twitter.com/shapeshed/status/395484711729889280

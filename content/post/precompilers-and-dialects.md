{
  "layout": "post",
  "title": "Precompilers and dialects",
  "date": "2012-10-02T00:00:00+01:00",
  "description": "Thoughts on TypeScript and precompilers",
  "tags": [
    "JavaScript"
  ]
}

## Microsoft Open Source

Yesterday Microsoft released [TypeScript][1], another JavaScript precompiler. TypeScript is similar to [CoffeeScript][2] in that it augments JavaScript with some additional features but ultimately compiles down to native JavaScript. TypeScript allows you to explictly set a type and for an error to be thrown in the event of data being the wrong type. 

    function greeter(person: string) {
        return "Hello, " + person;
    }

    var user = [0, 1, 2];

    document.body.innerHTML = greeter(user);

In this example TypeScript expects a single string but gets an array so an error is thrown.

    greeter.ts(7,26): Supplied parameters do not match any signature of call target

Like CoffeeScript TypeScript offers an abstraction for creating Classes that is very much inspired by C#

    class Student {
      fullname : string;
      constructor(public firstname, public middleinitial, public lastname) {
        this.fullname = firstname + " " + middleinitial + " " + lastname;
      }
    }

    interface Person {
      firstname: string;
      lastname: string;
    }

    function greeter(person : Person) {
      return "Hello, " + person.firstname + " " + person.lastname;
    }

    var user = new Student("Jane", "M.", "User");

There are some [sample][3] applications available on the site that will give you more of a feel for what TypeScript offers.

## Reactions to TypeScript

Much like CoffeeScript TypeScript has provoked some strong reactions within the Node.js community.

> Just when I thought Microsoft was sucking less typescript is born. Wow I wish I had classes in my js #couldntcareless
>
> -- <cite>[@tjholowaychuk][6]</cite>

> They invented typing long before JavaScript was invented. There is a reason it wasn't included.
>
> -- <cite>[@mikeal][7]</cite>

In the more enthusiastic camp Isaac Schlueter wrote a [blog post][5] that pointed out that there have been many attempts to add type hints in JavaScript.

> There have been a lot of attempts to come up with ways to add type hints and API-auto-documentation to JavaScript. (JSDoc, YUIDoc, AS3/ES4, etc.) Most of those are not very compelling. The fact that Microsoft is doing this, and building products on top of it (which they will inevitably hope to make money on), is very encouraging. It says to me that this is going to be a real thing with real developers working on it, with budgets and timelines, and the whole bit. It’s somebody’s job.
>
> -- <cite>[@isaccs][8]</cite>

## Language and Dialect

There is an interesting comparison here between spoken language and dialects. Language dialects typically exist to provide a way for a community or sub-culture to communicate within the realms of the mother language. Cockney Rhyming Slang emerged as a dialect for thieves to communicate without authorities understanding. Regions of England all have their own dialects and words. The point is that dialects support and foster communities. 

CoffeeScript and TypeScript are both essentially dialects of JavaScript. CoffeeScript adds some features and style improvements. The syntax and features is heavily inspired by Python and Ruby. TypeScript is stylistically inspired by C#, no surpise given that Anders Hejlsberg, Microsoft chief architect for Microsoft's C# language was involved with its creation. 

What strikes me about both of these dialects is that Programmers like what they are comfortable with. If I like Ruby syntax I can pick up CoffeeScript. If I like C# TypeScript makes JavaScript more palatable. The fact that JavaScript is dynamic and extremely permissive means it is possible to create precompiler interfaces to support however your brain thinks of programming problems. JavaScript's type coercian might well be conceived as programming with chaos by some developers and I suspect TypeScript is a reaction to that. If you need a primer on that watch this from 2 minutes 50.

<iframe width="420" height="315" src="http://www.youtube.com/embed/kXEgk1Hdze0" frameborder="0" allowfullscreen></iframe>

## Precompilers

There is something that I find really interesting about precompilers. Mainly because they always provoke such strong reactions. I've had long conversations about the merits of erb over haml, or sass over less and almost everyone has a strong opinion about which one is better. Programmers want to solve problems in a way that works for their brain. We love abstraction but only when it is how we like abstraction. For something like JavaScript some programmers find it so unpalatable that they abstract the entire language to an interface that works for their brain and way of thinking. Perhaps DHH banging on about the importance of APIs is right after all. 

I am unlikely to use TypeScript but it is great that Microsoft has released a serious Open Source Project into the JavaScript space and great that this will likely bring more C# and Windows developers to the realisation that you can create complex applications with JavaScript. I've no idea what 'application scale' means but I welcome our Microsoft overlords to the underground. 

[1]: http://www.typescriptlang.org/
[2]: http://coffeescript.org/
[3]: http://www.typescriptlang.org/Samples/
[4]: https://twitter.com/izs
[5]: http://blog.izs.me/post/32697104162/thoughts-on-typescript
[6]: https://twitter.com/tjholowaychuk/status/252833708141322241
[7]: https://twitter.com/mikeal/status/252820260544200704
[8]: http://blog.izs.me/post/32697104162/thoughts-on-typescript

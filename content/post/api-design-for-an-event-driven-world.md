{
  "title": "API design for an event-driven world",
  "date": "2014-01-24T15:39:29+00:00",
  "description": "REST and HATEOAS are designed around request response cycles. New thinking is needed for bidirectional, event-driven, realtime APIs.",
  "tags": [
    "Opinion"
  ]
}

## RESTing in Request Response

Until the arrival of techniques like [Comet][4] request response cycles were the norm for the web with pages performing a full reload each time you moved to a new URL. Applications like GMail changed the way users experience the web. We have become accustomed to pages responding dynamically and updating without a page refresh. 

Comet made the most of what browsers had to offer and supported near real-time communication although under the hood was still tightly tied to request and response. Even today [Ajax][5] continues to be used heavily by developers to send and receive data without refreshing the page.

## The Enigma that is REST

I'm a disciple of [REST][6] but like many I find it frustrating and enigmatic. It was [defined][9] by a Yoda like figure in [Roy Fielding][8] who occassionally [clarifies][10] parts of what REST should and shouldn't be. Broadly I follow the convention that has emerged in the last few years around web APIs. In the context of the web I would much rather be using REST than RPC or SOAP. In short although I have a few annoyances I'm sold on REST.

## Enter JavaScript

Over the last couple of years a little, so called toy language called JavaScript has started to change the web entirely. It has become the language of the web, the data transfer format of the web, a compile target for the web, a fully featured server-side platform, and through browser APIs a hardware interface. Initially JavaScript's success can be attributed to the fact that it shipped with (almost) every single browser accessing the web. Libraries like jQuery provided a sane interface for developers to use and all kinds of good things happened. 

## Events

For me one of the reasons that JavaScript is succeeding is events. It is an event driven language which completely suits the nature of a distributed, random Internet. Game developers have long realised that making sense of the chaos of unpredictable occurances is best handled through a game or event loop. Imagine building a 3D multiplayer game in a procedural fashion for example. Increasingly the same is true of the web. Data is distributed everywhere, humans and machines trigger events all the time and as programmers we are expected to make sense of it. 

## WebSockets

WebSockets are a hugely exciting thing for the web. A client and server are able to maintain a persistent connection and push data back and forth. The relationship is no longer request response but is now persistent. The [WebSocket protocol][7] defines this relationship as

> The WebSocket protocol enables two-way communication between a user
> agent running untrusted code running in a controlled environment to a
> remote host that has opted-in to communications from that code.

This basically renders the request response cycle a dinosaur reserved for exchanging documents.

How does the spec mandate that you handle communication for this type of scenario? Events. Indeed response codes are reserved for disconnections or application specific events. The request response paradigm doesn't exist here so how should you design you communication flow between client and server in this context? Currently it is a free for all and you can design your data in any way that you want to.

## Approaches to modelling events

Objects are one of JavaScript's best parts and this means you can model almost anything in a JavaScript object (just look at the number of precompilers mapping to other languages). Some developers have chosen to map events to the REST pattern with interfaces like this


    conn.on('user create'), function(data) {
      // create user here      
    });
    conn.on('user update'), function(data) {
      // update user here      
    });

This pattern attempts to take RESTful conventions and apply them to an RPC style API.

This approach is possible with libraries like [Socket.IO][1] and [SignalR][2] that create and expose namespaced events based on what the client and/or server send. Other libraries like [SockJS][3] ask developers to push design entirely into the data payload so there is no framework for sending and receiving data, just data. In fact SockJS follows the WebSocket protocol pretty closely. The WebSocket protocol has no standard for formatting messages. 

    conn.on('data', function(data) {
      // parse and use data here
    }

The approach that I have seen many developers use is to create a JavaScript object for this with `event` and `data` properties, then model data as an Object within data.

    var data = { 
      event: 'message', 
      data: { 
        user_id: 1, 
        message: 'hello world' 
      };

WebSocket type interfaces can then receive the data and act accordingly

    conn.on('data'), function(data) {
      if (data.event === "message") {
        // do something with a message
      }
    });
    
As I see it this is the defacto standard. This makes sense but how do you provide a sane consistent API? There is no convention like REST beyond the understanding that there are events and that within them there are data objects. Do you structure your events around your data models and then include REST style HTTP verbs within your data object to declare the operation that you want to perform? Are data models outdated in the context of events? How do you deal with validation? How do you document this? 

I don't have answers to these questions now, but as a web community I feel we should start thinking about them. The web will become more event driven and less bound to request response cycles as it evolves. Currently the best minds are still thinking about REST and HATEOAS with little or no thought being given about how events might eventually drive the web entirely. Why would we stick with request response for anything but old school documents when persistent connections are cheap, (nearly) real-time and can push data around the web without the need to click a link? 

## Conclusion

Watching the web unfold before my eyes every day is still as thrilling as the day I managed to FTP my first HTML file across a dial-up connection and onto the Internet. Request response cycles have got the web to where it is now but it is changing at an incredible pace. More and more devices are connected to the web, some with humans attached to them, some without. If we are to make sense of this chaos where fridges talk to supermarkets, lightbulbs send you notifications that you just got paid, bus stops show you where your bus is in real-time we must start thinking of the web in terms of events.

REST and HATEOAS work for documents where documents are transferred on a request response cycle. Where devices are connected with a persistent connection they are deficient because they are procedural. Events are not procedural. They are chaotic and can happen at any time and arrive from anywhere. 

The web needs to break out of the request reponse cycle and embrace events. Event-driven APIs are really RPC APIs and there are no conventions around their design. There is a lot of work to be done. 

[1]: http://socket.io/
[2]: http://signalr.net/
[3]: https://github.com/sockjs
[4]: https://en.wikipedia.org/wiki/Comet_(programming)
[5]: https://en.wikipedia.org/wiki/Ajax_(programming)
[6]: https://en.wikipedia.org/wiki/REST
[7]: http://www.whatwg.org/specs/web-socket-protocol/
[8]: http://roy.gbiv.com/
[9]: http://www.ics.uci.edu/~fielding/pubs/dissertation/rest_arch_style.htm
[10]: http://roy.gbiv.com/untangled/2008/rest-apis-must-be-hypertext-driven

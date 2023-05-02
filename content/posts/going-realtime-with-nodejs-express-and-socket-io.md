+++
date = "2011-07-18T00:00:00+01:00"
description = "A how to tutorial on creating a simple realtime counter in Node.js"
slug = "going-realtime-with-nodejs-express-and-socket-io"
tags = ["Node.js", "JavaScript"]
title = "Going realtime with Node.js, Express and socket.io"
+++

## Counting is fun!

This is a walkthrough on how to create a simple realtime counter of visitors to
a page using [Node.js][1], [socket.io][3] and [express][4]. This example is very
simple but could easily be extended to a range of applications.

## Just show me the app

[![Simple counter][2]][11]

<http://counter.nodester.com>

## Pulling the pieces together

[Express][4] is a great web framework for creating sites in Node.js. I've
[written before][5] about creating a basic site. This time we are going to use a
couple more libraries to add realtime communication to the application.

[socket.io][3] is an amazing library that takes the pain out of websockets and
provides a reliable fallback depending on browser capabilites. Here's a simple
example from the socket.io site.

```javascript
var io = require("socket.io").listen(80);

io.sockets.on("connection", function (socket) {
  socket.emit("news", { hello: "world" });
  socket.on("my other event", function (data) {
    console.log(data);
  });
});
```

This sets up the server side. Then you just need to add some client-side
JavaScript and you are ready to go

```html
<script src="/socket.io/socket.io.js"></script>
<script>
  var socket = io.connect("http://localhost");
  socket.on("news", function (data) {
    console.log(data);
    socket.emit("my other event", { my: "data" });
  });
</script>
```

I've used this setup to push the number of connected clients out to the browser
and a simple counter to increment and decrement the number of connected clients
on the relevant events. I've had some issues with different browsers on hosting
environments. For now the demo works with Safari and Chrome.

[Smoothie Charts][6] is a great library that will draw graphs in JavaScript. It
is very customisable, and lightweight and is specifically designed for live,
streaming data. It uses canvas to draw the graphs and the [tutorial][7] shows
just how easy it is to create a realtime charts.

Bringing these libraries together gives us live, realtime graphs. There's no
persistence here but if we wanted to we could add something like [Redis][8] into
the mix to persist the maximum number of connections.

You can browse the source and see how the libraries are used on [Github][10].
Fork it!

## Potentials uses

We could use this kind of setup to show realtime stats on server resources of
the kind provided by [Munin][9], to create realtime statistics for a page, or to
stream live data from a third party API to a page. I'm excited about what people
are going to make with these libraries!

[1]: http://nodejs.org
[2]: /images/articles/counter.webp
[3]: http://socket.io/
[4]: http://expressjs.com/
[5]: /creating-a-basic-site-with-node-and-express/
[6]: http://smoothiecharts.org/
[7]: http://smoothiecharts.org/tutorial.html
[8]: http://redis.io/
[9]: http://munin-monitoring.org/
[10]: https://github.com/shapeshed/counter
[11]: http://counter.nodester.com

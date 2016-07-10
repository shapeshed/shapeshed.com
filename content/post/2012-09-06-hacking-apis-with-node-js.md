---
title: Hacking APIs with Node.js
date: '2012-09-06T09:28:00+01:00'
tags: [node.js, apis]
author: George Ornbo
original: http://pebblecode.com/blog/hacking-apis-with-node-js/
---
<p><img src="https://media.tumblr.com/tumblr_m9x5blJ6Jh1qz7kgs.jpg" alt="The A Team"/></p>

<blockquote>
  <p>If you have a problem, if no one else can help, and if you can find them, maybe you can hire the A-Team.</p>
</blockquote>

<p>Recently we ran into an issue making cross-domain requests to a JSON .NET API. It was going to prove very difficult to allow browsers to make cross-domain JSON requests to the API or make any modifications to the codebase or server. We needed help. I was a big aircraft hanger, with just a Mac, a few tools and not much time&hellip;</p>

<p>JavaScript is a nimble if quirky little language and in Node.js we had a great toolkit to make a proxy server to bridge the gap. After working through all of the possibilities we had to fall back to using JSONP. This added the additional complication of needing to make a GET request when the API endpoint was a POST.</p>

<h3>Requirements</h3>

<ul><li>Create a proxy server to allow cross-domain XHR requests to a .NET JSON API</li>
<li>Convert a GET request to a POST request setting the content type headers as &lsquo;application/json&rsquo;</li>
<li>Pass GET query string parameters through to the POST request</li>
<li>Return the response </li>
</ul><p>Here&rsquo;s the entire proxy.</p>

<pre><code>var http = require('http'),
fs = require('fs'),
url = require('url') ;

http.createServer(function(request, response) {
  var options = {
    host: 'yourdomain.com',
    port: 18201,
    path: '/api/endpoint',
    method: 'POST',
    headers: {
      'Content-Type': 'application/json'
    }
  }

  queryParams = url.parse(request.url, true).query;
  var proxyRequest = http.request(options, function(proxyResponse) {
    var data = "";
    proxyResponse.setEncoding('utf8');
    proxyResponse.on('data', function (chunk) {
      data += chunk;
    });
    proxyResponse.on('end', function (chunk) {
      response.statusCode = proxyResponse.statusCode;
      response.headers = proxyResponse.headers;
      if (proxyResponse.statusCode === 200) {
        response.headers = proxyResponse.headers;
        response.end('callback(' + data + ')');
      } else {
        response.end(data);
      }
    });
  });

  proxyRequest.on('error', function(e) {
    console.log('problem with request: ' + e.message);
  });

  proxyRequest.write(JSON.stringify(queryParams));
  proxyRequest.end();
}).listen(8003);
</code></pre>

<p>It takes the GET request, makes a POST request to the API with query parameters and then returns the response. We run this proxy on one of our Linux servers and use <a href="https://github.com/nodejitsu/node-http-proxy">node-http-proxy</a> to proxy port 80 traffic for a domain through to the proxy. This means browsers can now make JSONP requests to the API.</p>

<h3>Hack or golden bullet?</h3>

<p>After creating the proxy it is clear that because Node.js is such a strong network programming platform it can be very powerful in dealing with legacy or slow moving APIs. This comes with responsibility though. It would have been preferable for this proxy server to not be required and for the API and/or server to handle cross domain requests properly. There is now more points of failure and more complexity in the project. But in this case we needed to get the job done.</p>

<p>Node.js could also be used to augment legacy APIs with a more complex proxy server. Because it is easy enough to transform and mangle requests and responses it would be possible to make an entire API interface RESTful where it is not or to move an architecture that is based on long polling to WebSockets.</p>

<p>I love it when a plan comes together!</p>

<p><img src="https://media.tumblr.com/tumblr_m9x5zrj7qa1qz7kgs.jpg" alt=""/></p>

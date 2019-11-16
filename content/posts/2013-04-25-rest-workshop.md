---
title: REST Workshop
date: '2013-04-25T15:01:41+01:00'
tags: []
author: George Ornbo
original: http://pebblecode.com/blog/rest-workshop/
---
<h2>REST API workshop</h2>

<p>We held our first internal workshop today on REST APIs.</p>

<p>The <a href="https://www.youtube.com/watch?v=Ydc5QPFS92M">video</a> and <a href="http://gist.io/5458283">slides</a> are below and a link to the apiary.io discussion project can be <a href="http://docs.workshop.apiary.io/">found here</a>.</p>

<iframe width="560" height="315" src="https://www.youtube.com/embed/Ydc5QPFS92M" allowfullscreen></iframe>

<h3>What is REST?</h3>

<ul><li>Roy Fielding</li>
<li>HTTP </li>
<li>Distributed data</li>
<li>Web APIs (GitHub, Twitter etc)</li>
</ul><h3>tl;dr</h3>

<pre><code>GET     /users              -&gt;  index
GET     /users/new          -&gt;  new
POST    /users              -&gt;  create
GET     /users/:user        -&gt;  show
PUT     /users/:user        -&gt;  update
DELETE  /users/:user        -&gt;  destroy
</code></pre>

<h3>Convention Not Standard</h3>

<ul><li>Convention is an interpretation</li>
<li>Yoda</li>
<li>Missing patterns</li>
<li>You will be annoyed</li>
</ul><h3>Why this convention?</h3>

<ul><li>SOAP etc</li>
<li>Clients</li>
<li>Standardisation</li>
<li>Frameworks</li>
<li>pebble case study - TaxiApp</li>
</ul><h3>What to think about</h3>

<ul><li>Data</li>
<li>Documentation </li>
<li>Versioning </li>
<li>Authentication </li>
<li>Deprecation</li>
</ul><h3>What&rsquo;s the best way to learn?</h3>

<ul><li>HTTP specification</li>
<li>Build a client</li>
<li>Resources</li>
<li>Work with clients</li>
<li>Be pragmatic</li>
</ul><h3>REST.next or Hypermedia</h3>

<ul><li>HATEOAS</li>
<li>Discoverability</li>
<li>Smart clients</li>
<li>Work in progress</li>
</ul><h3>REST doesn&rsquo;t work for everything</h3>

<ul><li>Event driven-apis</li>
<li>WebSockets</li>
<li>Messaging</li>
</ul><h3>Conclusion</h3>

<ul><li>On the web? Use REST. Use JSON.</li>
<li>Prepare for frustration</li>
<li>Be a pragmatist</li>
<li>Be responsible</li>
<li>Love your clients </li>
<li>Free your data</li>
</ul>

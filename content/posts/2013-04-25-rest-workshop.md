+++
author = "George Ornbo"
date = "2013-04-25T15:01:41+01:00"
original = "http://pebblecode.com/blog/rest-workshop/"
tags = []
title = "REST Workshop"
+++

## REST API workshop

We held our first internal workshop today on REST APIs.

The [video](https://www.youtube.com/watch?v=Ydc5QPFS92M) and
[slides](http://gist.io/5458283) are below and a link to the apiary.io
discussion project can be [found here](http://docs.workshop.apiary.io/).

### What is REST?

- Roy Fielding
- HTTP
- Distributed data
- Web APIs (GitHub, Twitter etc)

### tl;dr

```sh
GET     /users              ->  index
GET     /users/new          ->  new
POST    /users              ->  create
GET     /users/:user        ->  show
PUT     /users/:user        ->  update
DELETE  /users/:user        ->  destroy
```

### Convention Not Standard

- Convention is an interpretation
- Yoda
- Missing patterns
- You will be annoyed

### Why this convention?

- SOAP etc
- Clients
- Standardisation
- Frameworks
- pebble case study - TaxiApp

### What to think about

- Data
- Documentation
- Versioning
- Authentication
- Deprecation

### What’s the best way to learn?

- HTTP specification
- Build a client
- Resources
- Work with clients
- Be pragmatic

### REST.next or Hypermedia

- HATEOAS
- Discoverability
- Smart clients
- Work in progress

### REST doesn’t work for everything

- Event driven-apis
- WebSockets
- Messaging

### Conclusion

- On the web? Use REST. Use JSON.
- Prepare for frustration
- Be a pragmatist
- Be responsible
- Love your clients
- Free your data

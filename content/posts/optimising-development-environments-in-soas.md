+++
author = "George Ornbo"
date = "2016-05-17T00:00:00Z"
description = "As development environments move off single desktops and Service Orientated Architectures become more common we need to think about how to maximise efficiency and morale in development environments."
original = "http://pebblecode.com/blog/optimising-development-environments-in-soas/"
tags = ["Opinion", "Deployment", "Devops", "Webops"]
title = "Optimising Development Environments in SOAs"

+++

### The deep sigh of a developer

It is rare today that as a developer you are working in isolation. Often you are reliant on other components in a product ecosystem to complete your development. This introduces significant complexity to development and often in my career I have witnessed the deep sigh of a developer followed by the thud of a head on a desk when things do not go right. Without thinking about versioning, environments and deployment a development process can quickly introduce waste and inefficiencies. Some simple examples I have seen first hand include

* Development APIs being unstable
* Development APIs not exposing the version they are
* Active development occurring on APIs that clients are building against
* Components in Service Orientated Architecture introducing breaking changes bringing down other components
* Logging services being unavailable

Much attention is given to the stability of a production environment but for the morale and productivity of a product team having a sane development environment is extremely important for velocity, througput and quality. 

By ensuring good practice at the start of the project I estimate teams are 20% more productive, work better together and have higher morale. So how can teams become more productive in a complex development environment?

### Version Everything

Agreeing a way of versioning software is important for the sanity of the project. [Semver][1] is a good default and has a simple set of rules:

* MAJOR version when you make incompatible API changes,
* MINOR version when you add functionality in a backwards-compatible manner, and
* PATCH version when you make backwards-compatible bug fixes.

If a team can understand these rules then they have a stronger chance of not introducing waste into the team. 

Exposing the versions of software that are deployed to development environments can save hours or even days of debugging. APIs should expose the versions that are deployed either by their url structure

`/api/v1/login`

or via a header

`x-api-version: 1`

Similarly clients should expose what version is deployed. For JavaScript SPAs this can be done via an HTML comment and there are plenty of options for injecting this at build time. 

This has the added advantage that once in a QA or Production environment it is immediately clear what is deployed. 

### Expose API logs to the development team

A great deal of efficiency can be gained by exposing API logs within a development team. It is normal that a full-stack engineer will encounter integration difficulties or miscomprehensions in the HTTP transations that are going on between client and server. By exposing logs publically this can reduce the burden on API developers to support integration difficulties.

A good option I have seen working for this is pushing logs into [Elasticsearch][2]. This allows developers to query logs and also collaborate on debugging. 

### Build a Continuous Integration and Deployment Pipeline

Being able ship software to a development environment painlessly is extremely important for efficiency. It is well worth investing in setting up a pipeline that works something like this.

* Developer pushes to a development branch
* Component is built
* Tests are run
* Deployment artifact is created
* Artifact is deployed to a development environment

It should be feasible that developers working on different components can collaborate and resolve issues then push code and see it deployed in minutes so they can continue working. 

### Expose Deployment Status

Waiting is not fun. Waiting when you know how long it is for is more bearable. It is worth exposing continuous integration and continuous deployment tools to developers so they can see the status of builds and deployments. This might let them get on with something else or just maintain morale. 

### Connect the team

Integrating clients and APIs can be difficult. A single malformed header can cause days of pain. The quickest resolution is undoubtedly found by being physically located in the same space. Where that is not possible connecting a team virtually can yield dividends. The default tool for this is [Slack][3] and I would not really recommend anything else. Teams can integrate commits, deployments, build a sense of teamwork and throw animated gifs at each other to share successes and failures. 

### Practice Agile properly

Having a good Agile process can also support throughput, quality and morale. Identifying defects in a team's process and resolving them quickly is an important part of a Scrum Master's role in my opinion. The best Scrum Masters are ones that anticipate problems and proactively resolve them. The worst are list makers who tell you that you have slipped.

### Conclusion

For both APIs and clients we are increasingly developing in SOAs and environments away from our desktop. Putting some thought into how a development environment works for a team can yield significant improvements in productivity and morale. Next time you hear the sigh of a developer who has realised after four hours of debugging that they are developing against an unexpected version of an API don't say I didn't tell you so. 

[1]: http://semver.org/
[2]: https://www.elastic.co/products/elasticsearch
[3]: https://slack.com/

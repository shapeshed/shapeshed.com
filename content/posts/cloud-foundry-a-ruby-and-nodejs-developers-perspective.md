+++
date = "2011-04-15T00:00:00+01:00"
description = "This week VMware announced Cloud Foundry, their open source PaaS offering. Here's my take."
slug = "cloud-foundry-a-ruby-and-nodejs-developers-perspective"
tags = ["JavaScript", "Node.js", "Ruby", "Rails"]
title = "Cloud Foundry - a Ruby and Node.js developer's perspective"
+++

## Open Source PaaS

![Cloud Foundry][17]

[VMware][1] this week announced [Cloud Foundry][2], an open source [PaaS][3].
You can use VMware's cloud (which is where they'll monetise this investment) or
you can host your own. I believe you can even have a hybrid of both. Cloud
Foundry joins other players in the market like [Heroku][4], [Joyent][5], [Engine
Yard][6] and [Nodester][7].

## Why PaaS?

Developers don't want to be Sys Admins. Especially in small businesses
developers take on a lot - some or all of business analysis / requirements
gathering, server admin, development, testing, design, client management. The
list goes on. So the emergence of services like Heroku for [Ruby][18] and
Nodester for [Node.js][19] is very attractive. Developers can remove one thing
from the list of things that they need to be responsible for. It is an easy sell
to the management layer too - it is cheaper in terms of man hours, with (almost)
no maintenance.

The providers doing well in the market are the ones that realise that developers
have the keys to the choices that get made. Heroku has built a kick-ass platform
with a super slick API. Frankly it is a joy to use. Nodester emerged from
nowhere as an open-source weekend project and for me is beating players like
Joyent in their Node.js offering.

## One Paas to rule them all?

VMware have put considerable effort into building a PaaS to accommodate three
technologies - Java, Ruby and Node.js. They must be applauded for open-sourcing
the project and making it available on [GitHub][8]. There are a considerable
amount of man hours there and a significant investment from VMware. Thank you.

## Taking it for a spin

So I took it for a spin firing up a [VirtualBox][9] [Ubuntu 10.04.2 LTS][10] VM.
Installation was simple enough following the [README][11]. I created the SSH
tunnel as advised and within about half an hour had built a private cloud
capable of running Java, Ruby and Node.js apps, with support for MySQL, Redis
and MongoDB. Impressive.

The VMware team have thought hard about the API. If you are a RubyGems user you
can check it out by installing the vmc rubygem and then running help

```sh
gem install vmc --no-ri --no-rdoc
vmc --help
```

Once you have setup a user on your private cloud deploying an app is super
simple. Here's the process of deploying an app

```sh
vmc push [yourappname]
```

Err.. that's it. Amazing!

## Testing deployment on my cloud

Then I set about deploying a Node.js app. It was a simple express based Node.js
application with express, jade and stylus as dependencies. So let's give it a go

```sh
vmc push myapp
Would you like to deploy from the current directory? [Yn]: y
Application Deployed URL: 'myapp.vcap.me'?
Detected a Node.js Application, is this correct? [Yn]: y
Memory Reservation [Default:64M] (64M, 128M, 256M, 512M, 1G or 2G)
Creating Application: OK
Would you like to bind any services to 'myapp'? [yN]: n
Uploading Application:
  Checking for available resources: OK
  Processing resources: OK
  Packing application: OK
  Uploading (613K): OK
Push Status: OK
Staging Application: OK
Starting Application: ..........................Error 306: Error retrieving file 'logs/startup.log'
```

It failed. I used the log commands but there wasn't any useful output - I guess
this is early days. But I did find [this article][16] which required changing a
couple of things in the app file. After that it was as easy as

```sh
vmc update myapp
Uploading Application:
  Checking for available resources: OK
  Processing resources: OK
  Packing application: OK
  Uploading (15K): OK
Push Status: OK
Stopping Application: OK
Staging Application: OK
Starting Application: OK
```

Lovely! The API follows exactly the same process for deploying a Sinatra / Rails
which is really attractive.

At [pebble.code][12] where I work I'm responsible for managing servers and
setting up development sites for the team. This can be a time-consuming chore
and I've been working towards a [Puppet][13] setup to allow me to automate much
of this. A private cloud where developers can spin up apps with three words is
massively better.

## What's good about Cloud Foundry

I love the fact that VMware understand that PaaS is about being open and not
being tied to one platform. Being open makes me more likely to use a platform
than one that makes it hard for me to get my data in and out. I can easily move
my apps in and out at any time. I can create my own cloud and move my apps onto
that. I'm free and I like that.

I love the fact that Cloud Foundry is open source and created using Ruby. The
Ruby community is full of talented and smart developers and it is a wise move by
VMware to engage that community. I anticipate the product will be enhanced by
open source contributions.

## What could be improved

It is a real shame that VMware didn't go with [git][14] based deployment. Both
the Ruby/Rails and Node.js communities use git heavily and are used to git based
PaaS services. I'm not sure why this design decision was made - perhaps the old
skool Java heads at VMware won out. It would be great to see git deployment
added to the platform. Currently there is no versioning on the platform - it
would be a quick feature win to leverage the power of git to add this.

That said with the project being open source the developer community can easily
fork it and enhance the platform. The fact that the project is open source is
massive.

## Will I use it?

Maybe. Currently I'm happy with the PaaS providers I'm using - [Heroku][4] and
[Nodester][7]. I feel both are doing a great job. Heroku is closed source,
whilst Nodester is open-source. I have the option to host a Nodester private
cloud somewhere but Cloud Foundry is the only solution to offer both Ruby and
Node.js. I like that. Currently I mostly use PaaS providers for quickly
prototyping an idea and getting it out there. I could see a Cloud Foundry
private cloud working well for this.

The API is a big thing for me and I think VMware has done a great job here.
Where Heroku has led others have followed and that's great news for developers.

But.. for many of our production apps they have more complex technical
architectures involving Resque, Redis, Sphinx, cron jobs and background
processes. In short we need to have full control over the server. Cloud Foundry
goes a long way to solving this by offering MongoDB and Redis but currently
unless I'm mistaken I'd be unable to host apps with complex requirements. This
is an issue with PaaS in general. Heroku's add-ons solve most of this issue but
there are times when simply you need root access.

So overall thank you VMware! I also need to say thank you for your support of
[Redis][15]!

What are you waiting for? [Give it a go][2], or [fork it][8].

## Further Reading

- [Cloud Foundry][2]
- [VMware][1]
- [Heroku][4]
- [Nodester][7]
- [Cloud Foundry Source Code][8]

[1]: http://www.vmware.com/
[2]: http://cloudfoundry.com/
[3]: http://en.wikipedia.org/wiki/Platform_as_a_service
[4]: http://heroku.com/
[5]: http://www.joyent.com/
[6]: http://www.engineyard.com/
[7]: http://nodester.com/
[8]: https://github.com/cloudfoundry
[9]: http://www.virtualbox.org/
[10]: http://releases.ubuntu.com/lucid/
[11]: https://github.com/cloudfoundry/vcap/blob/master/README
[12]: http://pebblecode.com
[13]: http://puppetlabs.com/
[14]: http://git-scm.com/
[15]: http://redis.io/
[16]:
  http://support.cloudfoundry.com/entries/505133-deploying-a-node-js-app-with-npm-dependencies
[17]: /images/articles/cloud_foundry.jpg
[18]: http://www.ruby-lang.org/en/
[19]: http://nodejs.org/

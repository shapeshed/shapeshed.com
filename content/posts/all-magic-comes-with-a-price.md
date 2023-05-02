+++
date = "2012-04-24T00:00:00+01:00"
description = "Leaning on abstractions is powerful but you should know what it means"
tags = ["Opinion", "Node.js", "Rails"]
title = "All magic comes with a price"
+++

## Sunday night viewing

I've been watching [Once Upon A Time][6]. It is a new take on traditional Fairy
Tales where characters are stuck between The Enchanted Forest (Fantasy) and
Storybrook (Reality) and all kinds of temporal mayhem. I pay attention when
[Robert Carlyle][5] is on the screen. He brilliantly plays Rumpelstiltskin, a
character that loves making deals and issuing a sage catchphrase.

> All magic comes with a price
>
> -- <cite>Rumpelstiltkin, Once Upon A Time</cite>

![Rumpelstiltskin][8]

Now I think of his scary face whenever I use Rails or Node.js frameworks in my
apps. Think of this post as therapy.

## The Rails Generation

I am one of the Rails generation. I started developing HTML and CSS, got into
JavaScript, then PHP, then Rails. Rails allowed me to create complex
applications with very few skills in a language that made sense to my tiny
brain. It was amazing! I was really happy that people who were much smarter than
me were giving me a curated toolkit to allow me to make a living creating web
applications. I created a couple of applications with Rails 1 but the bulk of my
work has been in Rails 2 and Rails 3.

```sh
rails web_two_point_oh_app
```

## Look Mum I'm famous! Thanks DHH!

Rails gives you a huge amount not just in the choices that it makes for you as a
developer but also in the ecosystem of gems. Need geolocation? There's a gem for
that. Need authentication? There's a gem for that. If fact this is so much the
case that when feature requests are received from clients project managers often
say "there's probably a gem for that isn't there?".

The more experienced I have became as a developer this approach troubles me.
What Rails gives developers is amazing but it promotes a culture of magpie
development, namely grabbing the latest shiny gem and using it in your app. A
developer's profession becomes knowing what the latest, greatest gems are and
how to glue them togther using Rails.

Behind all of the generators and magic there is a big problem though. The vast
majority of developers using Rails have no idea what is going on. Because of the
quality of Rails and gems writing software can become just a matter of listening
to a few podcasts to stay on top of gem releases and filing tickets on open
source projects or Stack Overflow when your code doesn't work.

## Too much abstraction leads to obscurity

At RailsConf 2011 Aaron Patterson gave a talk called "Double Dream Hands: So
Intense". Aaron is smart and amongst the hilarity he noted that Rails 3 is
slower and more abstracted than ever. If you watch his talk from about [32
minutes][1] he shows the current Middleware stack in Rails. Here is the slide:

![Rails Middleware][9]

I salute him for going through that and understanding how it works.

> Rails is getting slower and Rails is getting slower because it is doing more
> work.
>
> -- <cite>[Aaron Patterson][15]</cite>

He was making a serious point. The more we ask a framework to do the more
complex it becomes to maintain and understand. At RailsConf 2011 Rails was
bigger, more complex and slower.

<iframe width="560" height="315" src="https://www.youtube.com/embed/kWOAHIpmLAI#t=2050s" allowfullscreen></iframe>

## UNIX and Rails

Given that most of the Rails community use Macs and broadly embrace UNIX
conventions it seems strange that the Rails framework got to this point. The
UNIX philosophy is do one thing and do it well. Rails' philoshopy was do
everything, make curated decisions and do it well. Judging by the number of
successful start-ups created with Rails it still does a pretty good job of that.

Recently though the Rails core team have started to respond to criticisms that
there is too much in the core and decisions have begun to curate what goes in
more strongly. This was the case when support for API apps [was reverted][3] and
moved to [a plugin][4]. For Ruby itself there [have been suggestions][5] that
the entire standard library itself should be moved out to gems (this is aleady
the case with minitest and json). Understanding the Rails codebase though
remains very difficult, especially for newcomers and developers are encouraged
to trust in the magic and abstractions.

## Node.js and frameworks

I'm not a fan of comparing the Node.js and Rails communities. They are designed
for different things and both have inherent strengths and weaknesses. I use
both. Node.js is a network programming toolkit, Rails is an MVC framework. So
let's be clear - they are not the same.

There has been a lot of discussion in the Node.js community about frameworks
with some calling for more generators and abstraction. More frameworks are being
created for Node.js and developers can now chose from many frameworks including
[Express][10], [Geddy][11], [Tako][12], [Flatiron][13] and [Meteor][14]. Most of
these frameworks are small and discreet but the march of abstraction is
incessant and Meteor in particular brings instant generators to the Node.js
party.

```sh
meteor create realtime_web
```

All developers like abstraction and there are many excellent modules available
for developers to use in Node.js much the same way as gems in Rails. A good
example of relevant abstraction for me is the [Request][7] module. It is an
excellent, mature module for providing a cleaner API for dealing with HTTP in
Node.js. By using it though you potentially never need to understand Node's HTTP
module and for developers programming on the web that is pretty fundamental.
Magic at a price even with relevant abstraction.

There are increasing pressures within the Node.js community to abstract more,
provide generators and make it easier for developers to use. My attraction to
Node.js (as much as what it offers) is that when a request comes in and a
response goes out I can understand what it happening. We should work hard to
keep this the case in the community. Keeping things small, understandable and
distinct is my biggest hope for what the Node.js community will create. Then I
might just be able to get Robert Carlyle's face and his stupid catchphrase out
of my head.

[1]:
  https://www.youtube.com/watch?feature=player_detailpage&v=kWOAHIpmLAI#t=1913s
[2]:
  http://blog.wyeworks.com/2012/4/20/rails-for-api-applications-rails-api-released
[3]:
  https://github.com/rails/rails/commit/6db930cb5bbff9ad824590b5844e04768de240b1
[4]:
  http://blog.wyeworks.com/2012/4/20/rails-for-api-applications-rails-api-released/
[5]: http://www.imdb.com/name/nm0001015/
[6]: http://beta.abc.go.com/shows/once-upon-a-time
[7]: https://github.com/mikeal/request
[8]: /images/articles/rumpelstiltskin.webp
[9]: /images/articles/rails_middleware.webp
[10]: http://expressjs.com/
[11]: http://geddyjs.org/
[12]: https://github.com/mikeal/tako
[13]: http://flatironjs.org/
[14]: http://meteor.com/
[15]:
  https://www.youtube.com/watch?feature=player_detailpage&v=kWOAHIpmLAI#t=2050s

+++
date = "2013-12-09T12:55:45+00:00"
description = "Six months ago I migrated from OSX to Arch Linux. Here is why Arch is a superior development platform for my needs."
tags = ["OSX", "Linux", "Opinion"]
title = "From OSX to Arch Linux"
+++

## Baby steps with OSX

Back in January 2006 I left an agency after three years and started freelancing.
I was mostly a front-end developer who knew how to make things work in IE. I
purchased the original MacBook Pro and found Tiger to be a great Operating
System for my needs. I plugged in [TextMate][1], [Adobe Creative Suite][2] and
[MAMP][3] and my setup was done. I was able to turn up at a client and start
working straightaway. After some pretty hefty setup costs my freelancing
business had little or no overheads and the expensive hardware I purchased was
completely rock solid. I really had the Mac experience - it was a joy to use and
completely reliable.

## Moving down the stack - PHP

Within a few months I had clients asking me to create server-side applications.
I knew a little PHP and before long I had created my own CMS framework and
purchased a (dv) [media temple][26] server complete with Plesk. I started to
host sites and began to become proficient in Linux administration.

Again OSX was a fabulous platform for this development.

## ExpressionEngine

I realised that developing your own software is often re-inventing the wheel and
largely because of following [Veerle Pieters][4] I picked up [Expression
Engine][5]. It was perfect for my requirements. I was mostly creating brochure
sites for clients that wanted to manage content and have a simple interface to
manage content by. Without realising it I was already a full-stack developer. I
was designing, doing the markup, hooking it up to ExpressionEngine and then
providing hosting services. OSX was the exact platform I needed for this. I
designed in Photoshop, did my markup in TextMate and then pulled up a terminal
to maintain Linux servers.

## s/PHP/Rails

I started to play with Rails as early as Rails 1 but by the time I created an
application for a client it was Rails 2 I was working against. I started to
become unhappy with the level of control I had with Media Temple and the Plesk
server I was using and decided to migrate everything to a blank Ubuntu server on
Slicehost (now part of Rackspace). For deploying Rails applications I needed to
up my Linux skills. At this stage my Linux skills had become intermediate.

Once I had created my first Rails application there was no way I was going back
to PHP. Ruby is a beautiful language, perhaps still my favourite language to
date. Rails taught me about TDD and how to be fully confident in deploying an
application.

With most of the Rails community on Macs it was a great experience. Around this
time I really started to learn and value the UNIX tools available on OSX.
[Homebrew][7] had just emerged and a vibrant community was making trivial to
install a range of UNIX tools. I moved my [text editor to vim][8] and created a
[dotfiles][9] repository to manage configuration.

## s/Rails/Node.js

In early 2010 I started to play with Node.js. It was a young project but I liked
it as soon as I started to play with it. After a couple of blog posts I was
approached to [write a book][6] and started to write some applications with
Node.js. OSX is a great operating system for developing Node.js applications and
again most of the community use OSX.

OSX offered tools like Vagrant that really helped to create an image that could
be shared with other developers when a service orientated architecture got
complicated.

## JavaScript and the browser

For about the last 18 months I have been writing JavaScript almost every day.
I'm using Node.js for the server and [Backbone][10] and [Marionette.js][11] for
most front end work. For the majority of the time I'm working in vim, a browser
and the browser console. During this time I started to feel that OSX is a very
heavyweight operating system for what I need. I'm now a heavy terminal user. I
read my mail through [mutt][12], and use terminal based IRC and Campfire
clients. Partly because I believe in the web as the platform I started to stop
using native clients for services like Twitter. I started to learn browser
shortcuts for these sites and installed the excellent [Vimium Chrome][13]
extension.

Simply I wasn't really using very much of OSX any more. I started to loathe the
weight of applications like iTunes and my 2009 iMac (with RAM maxed out) was
starting to groan.

## Enter Arch

I have used most of the big Linux distros in my time - CentOS, Fedora, Ubuntu,
Debian. I liked to experiment with operating systems with VirtualBox and had
started to play with Arch Linux on top of OSX. Initially it seemed a very bare
bones distribution and it felt like you had to do a lot of work. But I quickly
realised that this was the strength. You are encouraged to learn and understand
how things work right from partitioning disks yourself to picking your desktop.
I really liked this flexibility.

I wanted a lightweight desktop so after discounting Gnome I tried [XFCE][15] and
[LXDE][16]. I liked both but they still felt heavy for what I needed - namely a
browser and terminal. Using these desktops took me to explore tiling windows
managers. I found [dwm][17], [openbox][18], [awesome][19] and [i3][20].All of
these window managers felt great to me.

![i3 Desktop][21]

I discovered the [suckless][22] project and found the philosophy I had been
looking for:

> We are the home of quality software such as dwm, dmenu, st and plenty of other
> tools, with a focus on simplicity, clarity and frugality. Our philosophy is
> about keeping things simple, minimal and usable.

I have been using dwm now for about six months and am far more productive than I
was on OSX. I use [st][23] as my terminal, and [Chromium][24] as my browser.

My setup is very minimal and relies on git to manage source code and my dotfiles
to manage configuration between a couple of Arch machines.

Looking back on my early career where I was a front-end developer my skill set
has almost come full circle back to the browser. But now I carry strong
experience on the server and a hunger to discover how things work. [Rails
abstracted too much for me][27] - for much of the time I had no idea how a
request went through the application and returned data. Because Arch forces you
to understand the platform you are using, and more importantly to read the man
pages it is easy to get out of trouble. Having said that I have had no issues.
Not one. Arch packages are on the bleeding edge so I had expected that running
on OSX hardware I might run into some trouble. Not at all.

## Thoughts on OSX

As a mostly JavaScript developer and in the age of the browser OSX has become
too heavyweight for me. Some of the decisions of the most recent release
Mavericks are baffling. Why do you want a native maps application when the
browser does it just as well? I'm not really keen on pushing everything through
the App Store, limiting kernel extensions and just generally tightening the
walled garden around everything. I prefer openess over drop shadows, performance
over animations and being responsible over hand holding.

I am a developer who develops software that gets deployed on the Linux platform
so it makes sense to develop on Linux. That decision has paid dividends so many
times. It is easy to install any software I need and projects like [docker][25]
make it easy to develop on exactly the environment I will be deploying to.

I'm not suggesting that Linux, Arch or dwm are right for everyone. In fact they
are tailored almost perfectly to what I'm looking for - an open, minimal
operating system. My career is probably a driver for this. I started at the top
of the stack migrated all the way down to the metal and bubbled back up to the
top. As such I want to know how everything works and to keep software as simple
as possible. Arch and dwm is exactly what I was looking for.

[1]: http://macromates.com/
[2]: https://www.adobe.com/au/products/cs6.html
[3]: http://www.mamp.info/en/index.html
[4]: http://veerle.duoh.com/
[5]: http://ellislab.com/expressionengine/
[6]: http://nodejsbook.io/
[7]: http://brew.sh/
[8]: /vim-eighteen-months-on/
[9]: https://github.com/shapeshed/dotfiles
[10]: http://backbonejs.org/
[11]: http://marionettejs.com/
[12]: http://www.mutt.org/
[13]: http://vimium.github.io/
[14]: https://www.gnome.org/
[15]: http://www.xfce.org/
[16]: http://lxde.org/
[17]: http://dwm.suckless.org/
[18]: http://openbox.org/
[19]: http://awesome.naquadah.org/
[20]: http://i3wm.org/
[21]: /images/articles/i3-9.bigthumb.png
[22]: http://suckless.org/
[23]: http://st.suckless.org/
[24]: http://www.chromium.org/Home
[25]: http://www.docker.io/
[26]: https://www.mediatemple.net
[27]: /all-magic-comes-with-a-price/

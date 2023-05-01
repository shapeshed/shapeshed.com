+++
author = "George Ornbo"
date = "2013-11-15T14:01:00+00:00"
original = "http://pebblecode.com/blog/getting-started-with-docker/"
tags = []
title = "Getting started with Docker"
+++

Docker is fantastic wrapper around Linux Containers with a brilliant
collaboration workflow. If you do any kind of virtualisation you should
seriously consider it.

![](https://media.tumblr.com/67637761d1293f816ab48c9ac1c1da67/tumblr_inline_mwb588owIP1qz7kgs.png)

### What is Docker?

Docker is a wrapper around [Linux Containers](https://en.wikipedia.org/wiki/Lxc)
with some additional goodies thrown in. It allows you to run processes in a
virtualised, sandboxed environment on different flavours of Linux that share the
same underlying kernel. This means that you can run a Node.js process on Gentoo,
a Ruby process on Fedora, and a PHP process on Ubuntu. These processes share the
same physical hardware and Linux kernel of the Host machine but each has its own
sandboxed filesystem and network interfaces.

For a good introduction to Docker and Linux Containers watch this video:

The anaolgy with shipping containers is very striking here. If you can make the
container for your application a standard it becomes much easier and more
efficient to scale it. Horizonatal scaling, where you scale out across machines
rather than up on hardware means that being able to spin up new instances of
your application is more important than ever.

### How is it different from full virtualisation?

The traditional model is to use full virtualisation. You might buy a beefy
server and use a tool like [kvm](http://www.linux-kvm.org/page/Main_Page) to
split the server into virtualised servers. You can use a tool like
[puppet](https://puppetlabs.com/) to build and maintain the servers. This allows
you to build a stack for your applications updating configurations when
necessary. In this scenario it is the application that is portable and not the
server. With Linux Containers and Docker you have a wrapper that describes
everything that is needed to run the application. It becomes trivial to bring up
new instances each being an exact replica of the previous one. Furthermore
because Linux Containers are relatively lightweight the time to bring up a new
docker instance is trivial compared to bringing up a fully virtualised server.

### Show me an example

The quickest way to play around with Docker from any platform is to install
[Virtualbox](https://www.virtualbox.org/) and
[Vagrant](http://www.vagrantup.com/).
[This page](http://docs.docker.io/en/latest/installation/vagrant/) on the Docker
site describes how to quickly get a docker image up and running after that.

To ensure that host machine ports are forwarded to docker ports within vagrant
start vagrant with

```sh
FORWARD_DOCKER_PORTS=1 vagrant up
```

You can ssh to the box with

```sh
vagrant ssh
```

You should see that docker installed by running

```sh
sudo docker
```

A killer feature of Docker is that you can share images that you have created
with other people with a simple workflow. For example it could be that someone
has already solved your problem. You can search for images that you might be
interested in with the following command. In this example we look for wordpress
images.

```sh
docker search wordpress
```

To keep things simple lets install a base ubuntu image

```sh
sudo docker pull ubuntu
```

Then you can run the standard docker hello world example against this image

```sh
sudo docker run ubuntu /bin/echo hello world
```

You will notice that the command runs almost instantly. You can follow through
creating a daemon and how to attach to logs in the
[Hello World](http://docs.docker.io/en/latest/examples/hello_world/#id1) example
in the documentation.

### That’s nice but what can it really do?

Let’s suppose you want a Wordpress instance. Just do this

```sh
sudo docker pull jbfink/wordpress
sudo docker run -d -p 49002:80 jbfink/wordpress:latest
```

On your host machine open your browser at http://localhost:49002. There it is.
Amazing.

![](https://media.tumblr.com/092ec6fcd4bad6de5d981080d7fa2021/tumblr_inline_mwb55zdNHQ1qz7kgs.png)

Because it is a container you can be very certain that it will run reliably
through docker. The start up time is minimal too.

Don’t like how Wordpress has been configured? You can fork it and make it to
your own liking.

With a bit of light scripting you could start a Wordpress as a Service site.
Starting to see the power of Docker? The fact that you can
[share these images](http://docs.docker.io/en/latest/use/workingwithrepository/)
means that it becomes a hyper powerful tool for deploying and developing
software.

Want to create your own image? Just decribe what you want in a
[Dockerfile](http://docs.docker.io/en/latest/use/builder/). Here’s a
[moderately complex one](https://github.com/jbfink/docker-wordpress/blob/master/Dockerfile)
for the Wordpress image.

### Usages

Docker is an awesome tool for sharing environments and deploying new instances
of images quickly and with minimal effort.

Much of the buzz around Docker has been around PaaS services. But docker makes
it simple to build images for continuous integration agents, images for cloud
hosting providers, shared development environments and frankly is just a plain
brilliant way to collaborate.

At pebble {code} we are super impressed with this project. We are looking over
the fence at our
[kvm](http://blog.pebblecode.com/blog/building-armies-of-servers-with-kvm-and-puppet)
setup and it is looking distinctly long in the tooth.

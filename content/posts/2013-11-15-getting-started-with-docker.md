+++
author = "George Ornbo"
date = "2013-11-15T14:01:00+00:00"
original = "http://pebblecode.com/blog/getting-started-with-docker/"
tags = []
title = "Getting started with Docker"

+++
<p>Docker is fantastic wrapper around Linux Containers with a brilliant collaboration workflow. If you do any kind of virtualisation you should seriously consider it.</p>

<p><img src="https://media.tumblr.com/67637761d1293f816ab48c9ac1c1da67/tumblr_inline_mwb588owIP1qz7kgs.png" alt=""/></p>

<h3>What is Docker?</h3>

<p>Docker is a wrapper around <a href="https://en.wikipedia.org/wiki/Lxc">Linux Containers</a> with some additional goodies thrown in. It allows you to run processes in a virtualised, sandboxed environment on different flavours of Linux that share the same underlying kernel. This means that you can run a Node.js process on Gentoo, a Ruby process on Fedora, and a PHP process on Ubuntu. These processes share the same physical hardware and Linux kernel of the Host machine but each has its own sandboxed filesystem and network interfaces.</p>

<p>For a good introduction to Docker and Linux Containers watch this video:</p>

<iframe width="420" height="315" src="//www.youtube.com/embed/Q5POuMHxW-0" allowfullscreen></iframe>

<p>The anaolgy with shipping containers is very striking here. If you can make the container for your application a standard it becomes much easier and more efficient to scale it. Horizonatal scaling, where you scale out across machines rather than up on hardware means that being able to spin up new instances of your application is more important than ever.</p>

<h3>How is it different from full virtualisation?</h3>

<p>The traditional model is to use full virtualisation. You might buy a beefy server and use a tool like <a href="http://www.linux-kvm.org/page/Main_Page">kvm</a> to split the server into virtualised servers. You can use a tool like <a href="https://puppetlabs.com/">puppet</a> to build and maintain the servers. This allows you to build a stack for your applications updating configurations when necessary. In this scenario it is the application that is portable and not the server. With Linux Containers and Docker you have a wrapper that describes everything that is needed to run the application. It becomes trivial to bring up new instances each being an exact replica of the previous one. Furthermore because Linux Containers are relatively lightweight the time to bring up a new docker instance is trivial compared to bringing up a fully virtualised server.</p>

<h3>Show me an example</h3>

<p>The quickest way to play around with Docker from any platform is to install <a href="https://www.virtualbox.org/">Virtualbox</a> and <a href="http://www.vagrantup.com/">Vagrant</a>. <a href="http://docs.docker.io/en/latest/installation/vagrant/">This page</a> on the Docker site describes how to quickly get a docker image up and running after that.</p>

<p>To ensure that host machine ports are forwarded to docker ports within vagrant start vagrant with</p>

<pre><code>FORWARD_DOCKER_PORTS=1 vagrant up
</code></pre>

<p>You can ssh to the box with</p>

<pre><code>vagrant ssh
</code></pre>

<p>You should see that docker installed by running</p>

<pre><code>sudo docker
</code></pre>

<p>A killer feature of Docker is that you can share images that you have created with other people with a simple workflow. For example it could be that someone has already solved your problem. You can search for images that you might be interested in with the following command. In this example we look for wordpress images.</p>

<pre><code>docker search wordpress
</code></pre>

<p>To keep things simple lets install a base ubuntu image</p>

<pre><code>sudo docker pull ubuntu
</code></pre>

<p>Then you can run the standard docker hello world example against this image</p>

<pre><code>sudo docker run ubuntu /bin/echo hello world
</code></pre>

<p>You will notice that the command runs almost instantly. You can follow through creating a daemon and how to attach to logs in the <a href="http://docs.docker.io/en/latest/examples/hello_world/#id1">Hello World</a> example in the documentation.</p>

<h3>That&rsquo;s nice but what can it really do?</h3>

<p>Let&rsquo;s suppose you want a Wordpress instance. Just do this</p>

<pre><code>sudo docker pull jbfink/wordpress
sudo docker run -d -p 49002:80 jbfink/wordpress:latest
</code></pre>

<p>On your host machine open your browser at http://localhost:49002. There it is. Amazing.</p>

<p><img src="https://media.tumblr.com/092ec6fcd4bad6de5d981080d7fa2021/tumblr_inline_mwb55zdNHQ1qz7kgs.png" alt=""/></p>

<p>Because it is a container you can be very certain that it will run reliably through docker. The start up time is minimal too.</p>

<p>Don&rsquo;t like how Wordpress has been configured? You can fork it and make it to your own liking.</p>

<p>With a bit of light scripting you could start a Wordpress as a Service site. Starting to see the power of Docker?
The fact that you can <a href="http://docs.docker.io/en/latest/use/workingwithrepository/">share these images</a> means that it becomes a hyper powerful tool for deploying and developing software.</p>

<p>Want to create your own image? Just decribe what you want in a <a href="http://docs.docker.io/en/latest/use/builder/">Dockerfile</a>. Here&rsquo;s a <a href="https://github.com/jbfink/docker-wordpress/blob/master/Dockerfile">moderately complex one</a> for the Wordpress image.</p>

<h3>Usages</h3>

<p>Docker is an awesome tool for sharing environments and deploying new instances of images quickly and with minimal effort.</p>

<p>Much of the buzz around Docker has been around PaaS services. But docker makes it simple to build images for continuous integration agents, images for cloud hosting providers, shared development environments and frankly is just a plain brilliant way to collaborate.</p>

<p>At pebble {code} we are super impressed with this project. We are looking over the fence at our <a href="http://blog.pebblecode.com/blog/building-armies-of-servers-with-kvm-and-puppet">kvm</a> setup and it is looking distinctly long in the tooth.</p>

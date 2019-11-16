+++
date = "2012-05-31T00:00:00+01:00"
description = "How to run Nginx and Node.js in parallel on Ubuntu"
slug = "running-nginx-and-node-in-parallel-on-ubuntu"
tags = ["Node.js", "Nginx", "UNIX"]
title = "Running Nginx and Node.js in parallel on Ubuntu"

+++

## Nginx and Node.js

Nginx is a great web server. It is lightweight and easy to configure. It can be used to proxy through to Node.js processes but the current stable branch does not support proxying WebSockets. Supporting WebSockets is [on the slate][1] for 1.3.x releases (along with much anticipated SPDY support) but if you want to use Node.js, Nginx and Websockets you'll need to get into some complex configuration. You can get around a whole world of hurt by simply assigning additional WAN and LAN IP addresses to your server and serve your Node sites directly from the Node.js process, and keep your Nginx sites at the same time. This is useful if you need your server to serve non-Node.js sites through Nginx. Here's how. 

## Adding an additional network interface

This walkthrough relates to an Ubuntu 10.04 development server that is accessible from within a LAN and also a WAN IP.

You will need the ability to assign additional IP addresses to your server so you'll need:

* An additional WAN IP address
* An additional LAN IP address
* Ability to configure your router & firewall

Configuring your router and firewall is beyond the scope of this article so I'm assuming from here that you have assigned the LAN and WAN IPs to the machine.

To add the additional network interface open /etc/network/interfaces. You should see that the primary network interface is already there. Add the secondary IP address. You will need to change the values as appropriate for your network. This assigns the secondary LAN IP as an additional network interface. 

    # The primary network interface
    auto eth0
    iface eth0 inet static
    address 192.168.3.5
    netmask 255.255.255.0
    network 192.168.3.0
    broadcast 192.168.3.255
    gateway 192.168.3.254

    # Secondary IP
    auto eth0:1
    iface eth0:1 inet static
    address 192.168.3.37
    netmask 255.255.255.0
    network 192.168.3.0
    broadcast 192.168.3.255
    gateway 192.168.3.254

Once that is complete restart networking to apply the new interface.

    sudo /etc/init.d/networking restart

## Configure Nginx

If you have an existing Nginx configuration it is likely that it is configured to listen on a port number rather than an IP address. To allow the server to respond to separate IP addresses any occurance of the server directive needs to be updated to listen on the IP that you want to use for Nginx.

    # listen 80;
    listen 192.168.3.5:80;

As the WAN IP forwards to the LAN one this also serves WAN traffic.

## Configure Node.js

Node.js applications also need to updated to listen on the secondary IP address. A hello world server looks like this

    var http = require('http');
    http.createServer(function (req, res) {
      res.writeHead(200, {'Content-Type': 'text/plain'});
      res.end('Hello World\n');
    }).listen(80, '192.168.3.37');
    console.log('Server running at http://192.168.3.37/');

As the WAN IP forwards to the LAN one this also serves WAN traffic.

## A happy marriage

With this approach you can have both Nginx and Node.js serving WAN and LAN traffic directly on the same server. There are no headaches around getting Nginx to work with proxying WebSocket requests and you can use something like [node-http-proxy][2] to run multiple Node.js sites from the server. 

[1]: http://trac.nginx.org/nginx/roadmap
[2]: https://github.com/nodejitsu/node-http-proxy

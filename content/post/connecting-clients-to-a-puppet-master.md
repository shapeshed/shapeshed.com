{
  "title": "Connecting clients to a Puppet Master",
  "date": "2011-03-13T00:00:00+00:00",
  "description": "A walkthrough of how to connect a client server to a Puppet Master and how to manage basic services",
  "tags": [
    "UNIX",
    "Puppet",
    "Ubuntu"
  ]
}

## Overview

Following on from a [previous post][1] where I outlined how to set up a Puppet Master server we are now going to look at how to connect a client to the Puppet Master and start to manage the client server. This walkthrough is based on two Ubuntu 10.04.2 LTS servers. 

## Assumptions

For the purpose of this walkthrough I'm going to assume you have a working Puppet Master server as outlined in the [previous post][1]. I'm also assuming that you have a client server and that you have either have DNS set up of that you have amended the hosts files of each server so that each can ping the other by hostname. If you are using hosts files your /etc/hosts files should look something like this 

    192.168.3.162 puppetmaster.example.com puppetmaster puppet
    192.168.3.165 puppetclient.example puppetclient

## Connect client to server

Once we can ping each server make sure the Puppet Master is running

    sudo puppet master

Then we can connect from the client to the server

    puppet agent --server puppetmaster --waitforcert 60 --test

You should see 

    info: Creating a new SSL certificate request for puppetclient

Now on the server we can see the request that has come in with

    puppet cert --list

You should see 'puppetclient'. Now we can sign the certificate with

    puppet cert --sign puppetclient

The first time I did this I encountered [an issue][2] that complained that the hostname did not match the server certificate. This can be resolved by setting this explicitly in /etc/puppet/puppet.conf

    [master]
        certname=puppetmaster

Now you should have both servers talking to each other and everything configured to start configuring the client with the Puppet Master. After a minute or so you should see the puppet client cache the certificate - this shows that everything is ok. 

## Adding a module

Now you can start building modules to be sent to the client server. I started with a module to change the message of the day banner. You can find it [on github][3]. Once you've added your new module restart puppet.

Then you can send modules to nodes that you manage. In /etc/puppet/manifests/nodes.pp add this

    node puppetclient {
      include motd
    }

When the client requests an update from the server it will be sent the new configuration and the motd will be updated. 

The Puppet documentation has some [good documentation][4] on creating manifests.

[1]: https://shapeshed.com/setting-up-puppet-on-ubuntu-10-04/
[2]: http://projects.puppetlabs.com/projects/puppet/wiki/Ruby_Ssl_2007_006
[3]: https://github.com/shapeshed/puppet-master/tree/master/modules/motd
[4]: http://docs.puppetlabs.com/learning/manifests.html

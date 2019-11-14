{
  "slug": "setting-up-puppet-on-ubuntu-10-04",
  "title": "Setting up Puppet on Ubuntu 10.04",
  "date": "2011-02-25T00:00:00+00:00",
  "description": "A walkthrough of setting up a basic Puppet configuration on Ubuntu 10.04 LTS",
  "tags": [
    "UNIX",
    "Puppet",
    "Ubuntu"
  ]
}

## Overview

[Puppet][1] is the not quite so new automated server provisioning hotness. It allows you to provision and manage servers automatically from one Puppet Master Server. It is a great solution for quickly bringing up new VPS instances. Here is a quick walkthrough on how to get started on Ubuntu 10.04 LTS

## Assumptions

I'm setting this up on two clean installs of Ubuntu 10.04 LTS Server Edition. If you are using other Linux flavours things should work but your experience may vary. 

## Setup

To help learn Puppet I used two [Ubuntu][2] server instances in [VirtualBox][3]. If you choose to use VirtualBox in the network settings for the virtual machine choose Bridged Adapter to allow a network IP address to be assigned. 

Next I installed the two servers from the .iso and gave the Puppet Master the hostname of puppetmaster and the Puppet Client the name of puppetclient. The rest of the install is standard, selecting no automatic updates, and installing no additional software. 

## Installing Puppet

Once you've installed the servers we can get going with the interesting stuff - installing and configuring Puppet. There is a package available for Puppet in aptitude but I found I had issues with this so instead I recommend that you install it via [RubyGems][4] so let's get that installed

First install packages required by Puppet via aptitude

    sudo apt-get update
    sudo apt-get install irb libopenssl-ruby libreadline-ruby rdoc ri ruby ruby-dev

Now we can install RubyGems

    cd /usr/local/src
    sudo wget http://production.cf.rubygems.org/rubygems/rubygems-1.5.2.tgz
    sudo tar -xzf rubygems-1.5.2.tgz
    cd rubygems-1.5.2
    sudo ruby setup.rb
    sudo update-alternatives --install /usr/bin/gem gem /usr/bin/gem1.8 1
    sudo gem update --system

And finally Puppet

    sudo gem install puppet

All done!

## Configuring Puppet

I'm assuming you have completed the installation of Puppet on both the puppet master and client servers. I'm working locally so I need to explicity set the ip addresses of my Puppet Master and client in my /etc/hosts file. To find out the internally assigned ip address run

    ifconfig

You want the entry that say inet addr: - it should be something like 192.168.3.162

Then you need to update the /etc/hosts file on each machine with each machine's ip address

    192.168.3.162 puppetmaster.example.com puppetmaster puppet
    192.168.3.165 puppetclient.example puppetclient

Now on the Puppet Master you need to set up the puppet configuration in /etc. John Arundel of [Bitfield Consulting][5] has created a [handy tarball][6] that you can use as a template. Let's get it

    cd /etc
    sudo wget http://bitfieldconsulting.com/files/powering-up-with-puppet.tar.gz
    sudo tar -xzf powering-up-with-puppet.tar.gz

This provides a basic stucture for Puppet configuration. We'll come onto writing manifests in a later post. Now we can start the Puppet daemon, making the relevant system users in the process

    puppet master --mkusers --verbose --no-daemonize

If you see it start then great. I encountered a [bug][7] here that meant the Puppet Master Deamon failed to start. The issue here is that file ownership isn't set correctly I fixed this with

    chown -R puppet:puppet /var/lib/puppet

Once you are sure everything is ok you can daemonize Puppet with

    puppet master

Finally we can run a local test to make sure that everything is running as expected

    puppet agent --test --server=`hostname`

You should see something like

    info: Caching catalog for puppetmaster
    info: Applying configuration version '1298651839'
    notice: Finished catalog run in 0.25 seconds

Next we'll look at connecting the client to the Puppet Master, creating manifests before moving on to managing users. Stay tuned!

## Related links
* [Puppet Labs][1]
* [Ubuntu][2]
* [VirtualBox][3]
* [RubyGems][4]
* [Bitfield Consulting][6]
* [Puppet Tutorial for Linux: Powering up with Puppet][8]

[1]: http://puppetlabs.com/
[2]: http://www.ubuntu.com/
[3]: http://www.virtualbox.org/
[4]: http://rubygems.org/
[5]: http://bitfieldconsulting.com/
[6]: http://bitfieldconsulting.com/files/powering-up-with-puppet.tar.gz
[7]: http://comments.gmane.org/gmane.comp.sysutils.puppet.bugs/17681
[8]: http://bitfieldconsulting.com/puppet-tutorial

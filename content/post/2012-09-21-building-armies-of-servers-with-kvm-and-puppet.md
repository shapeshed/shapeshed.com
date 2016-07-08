---
title: Building armies of servers with kvm and puppet
date: '2012-09-21T09:49:39+01:00'
tags: []
author: George Ornbo
original: http://pebblecode.com/blog/building-armies-of-servers-with-kvm-and-puppet/
---
<p><img src="http://media.tumblr.com/tumblr_man7d7tNog1qz7kgs.jpg" alt=""/></p>

<p>Our infrastructure requirements at pebble {code} are growing. We&rsquo;ve got pretty far with an original Ubuntu 8.04 -&gt; 10.04 Linux server. It has been a workhorse for us but an incident with bad sectors and no RAID facility suggested it was time for a more grown up solution.</p>

<p>We purchased a beefy server from Dell and have chosen to use <a href="http://www.linux-kvm.org/page/Main_Page">kvm</a> to manage virtual machines on the server. You can install kvm during the Ubuntu 12.04 Server install process and there is also good <a href="https://help.ubuntu.com/community/KVM">documentation</a> available on the Ubuntu site. We have configured a bridged setup to allow virtual machines to be accessed directly on an IP address.</p>

<p>We use <a href="http://manpages.ubuntu.com/manpages/hardy/man1/ubuntu-vm-builder.1.html">ubuntu-vm-builder</a> to create virtual machines and found that setting defaults in /etc/vmbuild.cfg is a good idea.</p>

<pre><code>[DEFAULT]
arch   = amd64
domain = pebblecode.net
mask   = 255.255.254.0
net    = 10.128.0.0
bcast  = 10.128.1.255
gw     = 10.128.1.254
dns    = 192.168.3.6
user   = YOURUSER
name   = YOUR NAME
pass   = YOURPASSWORD
firstboot = /etc/vmbuilder/firstscripts/firstboot.sh

[kvm]
libvirt = qemu:///system
bridge = br0
virtio_net = true
mem     = 1024
cpus    = 2

[ubuntu]
suite = precise
flavour = virtual
components = main,universe
addpkg = openssh-server, git, vim, puppet
</code></pre>

<p>With the defaults set it is possible to bring up a machine ready to roll with the following.</p>

<pre><code>sudo ubuntu-vm-builder kvm --dest DESTINATION --hostname HOSTNAME --ip IP
</code></pre>

<ul><li>DESTINATION - the name of the folder to write to (we set this to the hostname)</li>
<li>HOSTNAME - the hostname for the server</li>
<li>IP - the IP address for the server</li>
</ul><p>Using the firstboot option in /etc/vmbuild.cfg  you can run a script on first boot. We use this to connect the new server to our <a href="http://www.puppetlabs.com/">Puppet</a> Master.</p>

<pre><code>#!/bin/sh -e
#execute firstboot.sh only once
if [ ! -e /root/firstboot_done ]; then
    echo "[agent]" &gt;&gt; /etc/puppet/puppet.conf
    echo "server = quimby.pebblecode.net" &gt;&gt; /etc/puppet/puppet.conf
    # Start puppet on boot?
    echo "START=yes" &gt;&gt; /etc/default/puppet

    # Restart Puppet
    sudo service puppet restart

    # Touch firstboot_done so we don't run this anymore!
    touch /root/firstboot_done
fi
exit 0
</code></pre>

<p>This script starts sets the location of the Puppet Master and then starts the Puppet Agent. After signing the certificate on the Puppet Master the manifests for the new server then build the server how we want it.</p>

<p>End-to-end we can now provision new servers within about 5 minutes. Next up support for Windows guests..</p>

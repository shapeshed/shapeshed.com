---
title: Building armies of servers with kvm and puppet
date: '2012-09-21T09:49:39+01:00'
tags: []
author: George Ornbo
original: http://pebblecode.com/blog/building-armies-of-servers-with-kvm-and-puppet/
---
![](https://media.tumblr.com/tumblr_man7d7tNog1qz7kgs.jpg)

Our infrastructure requirements at pebble {code} are growing. We’ve got pretty far with an original Ubuntu 8.04 -> 10.04 Linux server. It has been a workhorse for us but an incident with bad sectors and no RAID facility suggested it was time for a more grown up solution.

We purchased a beefy server from Dell and have chosen to use [kvm](http://www.linux-kvm.org/page/Main_Page) to manage virtual machines on the server. You can install kvm during the Ubuntu 12.04 Server install process and there is also good [documentation](https://help.ubuntu.com/community/KVM) available on the Ubuntu site. We have configured a bridged setup to allow virtual machines to be accessed directly on an IP address.

We use [ubuntu-vm-builder](http://manpages.ubuntu.com/manpages/hardy/man1/ubuntu-vm-builder.1.html) to create virtual machines and found that setting defaults in /etc/vmbuild.cfg is a good idea.

    [DEFAULT]
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

With the defaults set it is possible to bring up a machine ready to roll with the following.

    sudo ubuntu-vm-builder kvm --dest DESTINATION --hostname HOSTNAME --ip IP

* DESTINATION - the name of the folder to write to (we set this to the hostname)
* HOSTNAME - the hostname for the server
* IP - the IP address for the server

Using the firstboot option in /etc/vmbuild.cfg you can run a script on first boot. We use this to connect the new server to our [Puppet](http://www.puppetlabs.com/) Master.

    #!/bin/sh -e
    #execute firstboot.sh only once
    if [ ! -e /root/firstboot_done ]; then
    echo "[agent]" >> /etc/puppet/puppet.conf
    echo "server = quimby.pebblecode.net" >> /etc/puppet/puppet.conf
    # Start puppet on boot?
    echo "START=yes" >> /etc/default/puppet

    # Restart Puppet
    sudo service puppet restart

    # Touch firstboot_done so we don't run this anymore!
    touch /root/firstboot_done
    fi
    exit 0

This script starts sets the location of the Puppet Master and then starts the Puppet Agent. After signing the certificate on the Puppet Master the manifests for the new server then build the server how we want it.
                                                                                                  End-to-end we can now provision new servers within about 5 minutes. Next up support for Windows guests..

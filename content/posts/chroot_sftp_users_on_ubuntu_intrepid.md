+++
date = "2009-03-31T00:00:00+01:00"
description = "Newer versions of OpenSSH come with the ChrootDirectory directive that makes it easy to jail SFTP users to a directory. I've written about <a href=\"/journal/adding_sftp_users_with_a_limited_shell_in_centos_5.2/\">giving users a limited shell with older versions of OpenSSH</a> but if you can run OpenSSH 4.9 or greater I recommend using this method. "
tags = ["Ubuntu", "Linux"]
title = "Chroot SFTP users on Ubuntu Intrepid"

+++

## Usual warning

This article is written for Ubuntu Intrepid 8.10 and should work for Linux distributions running OpenSSH 4.9 or greater. No responsibility is taken for data loss. You know the score - take backups and try it out of a test server if possible. 

## Create an sftp group

First we need to create an sftp group. This group will hold users who we want to chroot.  

sudo groupadd sftp

This group is used in the ssh config file so in future we can easily add more users if we want to.

## Create a user

Now we create a user that we want to have sftp access only. This user won't be able to login on a standard ssh login but will be able to login using sftp to transfer files. Replace user with whatever you wish. Set the home directory (in this case /var/www/vhosts/theirsite.com) to the folder you want the user to have access to.  

    sudo useradd -d /var/www/vhosts/theirsite.com user

Now set a password for the user: 

    sudo passwd user

Change the user's primary group to the sftp group we just created 

    sudo usermod -g sftp user

Then we need to set the user's shell to /bin/false

    sudo usermod -s /bin/false user

## Configuring OpenSSH

Now we need to configure OpenSSH. 

    sudo vi /etc/ssh/sshd_config 

Change the Subsystem: 

    #Subsystem sftp /usr/lib/openssh/sftp-server Subsystem sftp internal-sftp

At the bottom of the file add 

    Match group sftp X11Forwarding no ChrootDirectory %h AllowTcpForwarding no ForceCommand internal-sftp

## Correct permissions

OpenSSH is sensitive to permissions so you need to make sure permissions are correct.

My vhost layout is:

    theirsite.com 
      - conf 
      - logs 
      - httpdocs 
      - httpdocs 
      - private 
      - subdomains

The important thing here is that the folder theirsite.com must be owned by root and in the root group. Providing you want to allow write access everything else must be owned by the user and in the sftp group. You could of course set custom permissions on sub-folders as you wish. 

    chown user:sftp -R theirsite.com chown root:root theirsite.com
 
In order for jailing to work correctly every folder above the theirsite.com directory must also be owned by root and in the root group. In this case this means the following folders.  
 
    - var 
    - www 
    - vhosts

If these folders are not owned by root and in the root group the user login will fail. 

So that's it the user should be able to login using sftp and you should have an extensible chrooted SFTP system.

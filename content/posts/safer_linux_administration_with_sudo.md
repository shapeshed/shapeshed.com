+++
date = "2008-06-13T00:00:00+01:00"
description = "The root account is all powerful in Linux. As humans make mistakes it is very dangerous to use root on a regular basis. By using sudo you can limit the risk of human error and prevent mistakes from happening. "
tags = ["Linux"]
title = "Safer Linux administration with sudo"
+++

## Using root in Linux

The root account in Linux can do anything - view all files, run all tasks, kill
processes, see all logs, erase hard drives. Root is god. Many Linux users are
happy to login as root and administer servers as root. But humans are prone to
making mistakes and using root can lead to major problems. This article is
written for Centos 5.x but also applies to most common Linux distributions. The
usual disclaimer applies - use at your own risk.

Here is an example scenario: I am working on two servers - one is my local
development server and the other my production server, hosting live client
sites. I have been creating a backup script and testing it on my local server
before I put it live onto the production server. The script has been thoroughly
tested so I move it onto the production server. At the end of the day I shut
down my development server. In my terminal window as root I type "poweroff". The
server is shut down. Great - I can go and relax now.

The next morning I receive phone calls from several clients who inform me that
their website is down. How can that be? I have a very stable and secure server
that has been up for over 200 days! I attempt to log in to the server and
nothing - it is dead. I call the hosting company and whilst on the phone I hear
the fan of the development server. I realise I have used poweroff on the live
production server rather than the development server.

## Human Error

Well that is stupid I hear you say! It is your fault. True it is my fault.
Humans make errors and that was a big one. I cannot guarantee that I will not do
it again but luckily for me there is a way to limit the impact of human error in
Linux. This is sudo. Sudo lets users who are not root perform actions as root.
Isn't that a bit dangerous? Yes it is very dangerous so you should be careful
how you use it. Used correctly though it can remove the possibility of
incorrectly shutting down a server.

## How sudo works

Sudo allows user accounts to perform actions as root. You can limit what user
accounts can do so it is possible to be very focussed about what users are and
aren't allowed to do. For example if I allow the user account mickey to restart
apache mickey can do so with the following commands:

```sh
[mickey@mybox ~]$   sudo /etc/init.d/httpd restart
Password: #mickey's password entered
Stopping httpd:                                            [  OK  ]
Starting httpd:                                            [  OK  ]
```

Apache is restarted. Without being root mickey has been able to restart apache.
Furthermore a log of all sudo actions is kept in /var/log/messages so we can see
who has used sudo and for what.

```sh
Jun 13 08:36:26 mybox sudo:   mickey : TTY=pts/0 ; PWD=/home/mickey ; USER=root ; COMMAND=/etc/init.d/httpd restart
```

## Limiting risk

Perhaps sudo's most powerful feature is the ability to only allow users to
perform certain tasks as root. This means you can limit precisely what users can
do, meaning the you can be sure that particular users cannot perform certain
tasks. This is precisely what we need to prevent shutting down the wrong box as
root. Instead of using root we administer the server with a regular account with
sudo permissions for everything we need but not for poweroff.

For example we will try and poweroff the server as mickey.

```sh
[mickey@mybox ~]$  sudo poweroff
Sorry, user mickey is not allowed to execute '/usr/bin/poweroff' as root on mybox.
```

Great we have prevented human error from occuring!

## Setting up permissions

To set up permissions for who can do what with sudo we need to login as root

```sh
su - root
Password: #enter your root password
```

Then we use visudo to edit the sudo file.

```sh
visudo
```

This is the configuration for sudoers. Here we define the commands that we want
to allow sudoers to be allowed to execute and who should be able to use them.
Lets say we want to allow mickey to administer Apache, MySQL, Yum and to view
all log files. Under the Command Aliases section we need first to define the
commands that we want to make available.

To make administration easier we can define user aliases. First we add mickey
into the alias WEBSERVERADMIN

```sh
User_Alias WEBSERVERADMIN = george
```

Then we define the services we want to allow sudoers to have access to:

```sh
Cmnd_Alias     APACHE = /etc/init.d/httpd start, /etc/init.d/httpd stop, /etc/init.d/httpd restart, /etc/init.d/httpd graceful, /etc/init.d/httpd configtest
Cmnd_Alias     MYSQL = /etc/init.d/mysqld start, /etc/init.d/mysqld stop, /etc/init.d/mysqld restart
Cmnd_Alias     VIEW = /bin/cat, /bin/grep, /bin/more, /usr/bin/head, /usr/bin/tail, /usr/bin/less
Cmnd_Alias     YUM = /usr/bin/yum update, /usr/bin/yum info, /usr/bin/yum remove
```

Finally we give the user alias permissions to use the commands

```sh
WEBSERVERADMIN ALL= APACHE, MYSQL, VIEW, YUM
```

Hit :wq to save the file and you are all set. So now anyone in the
WEBSERVERADMIN user alias will be allowed to use any of the commands defined in
Cmnd_Alias when using sudo. This is exactly what we want. The user mickey can
now safely administrate the web server using sudo but not shut the server down
by mistake.

Further reading:

- [How to use sudo][1]
- [Sudo Manual][2]
- [Sample sudoers file][3]

[1]:
  http://www.chinalinuxpub.com/doc/www.siliconvalleyccie.com/linux-hn/sudo.htm
[2]: http://www.sudo.ws/sudo/man/sudo.html
[3]: http://www.sudo.ws/sudo/sample.sudoers

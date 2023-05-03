+++
date = "2009-07-30T00:00:00+01:00"
description = "How to keep software up-to-date automatically on Ubuntu Server using Aptitude"
tags = ["Ubuntu", "Linux"]
title = "Auto update an Ubuntu Server with Aptitude"
aliases = [
    "/journal/installing-passenger-3-with-rvm-and-nginx-on-osx/",
    "/auto_update_an_ubuntu_server_with_aptitude/"
]
+++

## Usual disclaimer

This article is provided as it and no responsibility will be taken for things
going wrong. Tested on Ubuntu 8.10 server.

## Using Aptitude

If you've ever tried out Ubuntu you'll probably know what aptitude is and how to
manage packages. Updating your system is as simple as sudo aptitude udpate &&
sudo aptitude upgrade

This updates the package lists and presents any upgrades.

## Automating the process

Wouldn't it be easier if you could automate this and forget about it? That way
your server can stay up to date without you ever having to worry about it.
Create a file called autoupdate.sh and put the following into it:

```sh
#!/bin/bash

# A script to run Aptitude and install any upgrades automatically.
# Add this to /etc/cron.daily to run the script every 24 hours.

# This prevents "TERM is not set, so the dialog frontend is not usable." error
PATH="$PATH:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin"

aptitude update
aptitude safe-upgrade -y
aptitude autoclean
```

To run this script daily move it to /etc/cron.daily (making sure it is
executable).

```sh
chmod +x autoupdate.sh
sudo chown root:root autoupdate.sh
sudo mv autoupdate /etc/cron.daily
```

The update will run automatically once a day ensuring you stay up-to-date.

## Checking logs

You can keep a check on packages that have been installed and removed via the
log file that Aptitude generates.

```sh
sudo tail -n 30 /var/log/aptitude
```

If you want to check that an upgrade has been applied you can search for it like
this

```sh
sudo cat /var/log/aptitude | grep -A 20 -B 20 php5
```

Or you can check the currently installed version using (this example is php5)

```sh
aptitude show php5
```

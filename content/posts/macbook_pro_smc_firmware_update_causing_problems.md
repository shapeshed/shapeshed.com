+++
date = "2006-05-23T00:00:00+01:00"
description = "In the hope that this might help someone out I'm posting the slightly unpleasant experience I had this morning after running the SMC Firmware update from Apple"
tags = ["Apple"]
title = "MacBook Pro SMC Firmware Update Causing Problems"
+++

Imagine if you can the cold palms and nervous sweat that occurred when my Mac
refused to boot. I do back everything up but I haven't really got time or the
inclination to reinstall all my software etc etc. Thankfully after a quick
search it seems that Adobe Version Cue is the problem. If you have it as a start
up item it is likely that it is causing the problem.

## The solution

Boot your Mac in safe mode by holding down shift as you boot. I had to do this a
couple of times before it worked but it did. Once in safe mode browse to
/yourmac/library/startupitems/. If you see Adobe Version Cue in there delete it.
If you don't use Version Cue you can also remove it from the Applications
folder. Now you can reboot and it should go through to the SMC updater. This
worked on MacBook Pro 10.4.6.

Although I'm very pleased with my Mac it is a bit annoying that the update
doesn't test against major third party software installs. I would say there will
be a lot of Adobe / Mac users out there who have experienced this problem. Still
all is well now - phew.

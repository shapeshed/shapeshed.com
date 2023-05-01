+++
date = "2009-04-14T00:00:00+01:00"
description = "I've recently moved from using Parallels for browser testing to Sun's Open Source VirtualBox. Here's a walkthrough on how to get a browser testing suite for free on OSX or Ubuntu. "
tags = ["Ubuntu", "Linux", "Browsers", "Apple"]
title = "Testing with IE6, IE7 and IE8 on VirtualBox"
+++

## Microsoft's Virtual Hard Drives

Microsoft make a [series of downloads available][1] for web developers to ensure
browser compatibility. Currently you can download IE6-8 on XP and IE7 on Vista.
The good news is that they are also free so there is no need to buy a Windows
license if all you want to do is browser test. The images generally expire at
the end of each quarter but it is fairly trivial to download a new version.

## Extracting the .exe

The downloads are available as .exe files so you will need to extract them
first. On OSX I use [Stuffit][2] which extracts .exe files on the free version.
[Andrew Odri][3] also has a write up on this and he recommends using [The
Unarchiver][4] although this didn't work for me.

On Ubuntu you can use Wine:

```sh
sudo apt-get install wine
```

Once installed you can use Wine to extract the exe:

```sh
wine /path/to/yourexe.exe
```

## Get VirtualBox

Next download and install VirtualBox. On OSX you can [download a .dmg file][5].
On Ubuntu the following will install it for you:

```sh
sudo apt-get install virtualbox
```

## Fixing Microsoft's duplicate identifiers

The Microsoft images all [share the same Hard Disk Identifier][6] which means
that VirtualBox will only let you add one of the hard drives to the Media
Manager. So we need to fix that. Hat tip to [Andrew Odri][3] for documenting
this.

For OSX [Download Q][7] and then for each vhds we need to convert it to a vdi.
This will allow us to test in parallel. On OSX run:

```sh
/Applications/Q.app/Contents/MacOS/qemu-img convert -O raw -f vpc yourVHD.vhd RAWimage.raw
VBoxManage convertdd RAWimage.raw NewVDIImage.vdi
```

For Ubuntu get QEMU:

```sh
sudo apt-get install qemu
```

Once installed on Ubuntu you can then convert the .vhd to a .vdi

```sh
qemu-img convert -O raw -f vpc yourVHD.vhd
RAWimage.raw VBoxManage convertdd RAWimage.raw NewVDIImage.vdi
```

## Fixing drivers

Once you have set up your Virtual Machine and booted you will see a blue screen
of death. This is because we still need to install some drivers. When booting
hold down F8 and boot into Safe Mode with Command Prompt. Cancel any prompts
that come up and at the DOS prompt enter

```sh
cd \WINDOWS\system32\drivers ren processr.sys processr.old
```

Restart the machine and then in the VirtualBox menu go to Devices > Install
Guest Additions. Follow the prompts and install the additions. On Ubuntu I found
I had to manually download the iso from the link supplied, then mount it in the
machine settings before booting. Reboot when you are done.

Once rebooted at the DOS prompt type

```sh
D:\VBoxWindowsAdditions-x86.exe /extract /D=C:\Drivers
```

This will extract the VirtualBox drivers

Then within Windows do

- Start > Administrative Tools > Computer Management
- Select Device Manager.
- Select Batteries, Unknown Device -> Disable
- Select Network Adapters, Ethernet Controller -> Update Driver
- Select Yes, now and every time, click Next
- Select Install from a list or specific location, click Next
- Enter location "C:\Drivers\x86\Network\AMD"
- Click Finish

All done - repeat this method on the other vhds and you will then have a full
IE6-8 testing suite that you can run side-by-side if you wish.

## Credits

This article draws on knowledge gained from the following posts and I'm very
grateful to the authors

- [IE8 in Ubuntu Intrepid with VirtualBox][8]
- [HOWTO: Running IE6, IE7 and IE8 On Ubuntu Intrepid (8.10) Using
  VirtualBox][9]
- [IE6, IE7 And IE8 On Mac OS X Step By Step][3]
- [Running IE6, IE7 and IE8 on your Mac][10]

[1]:
  http://www.microsoft.com/downloads/details.aspx?FamilyId=21EABB90-958F-4B64-B5F1-73D0A413C8EF&displaylang=en
[2]: http://my.smithmicro.com/mac/stuffit/index.html
[3]:
  http://blog.affirmix.com/2009/04/01/ie6-ie7-and-ie8-on-mac-os-x-step-by-step/
[4]: http://wakaba.c3.cx/s/apps/unarchiver.html
[5]: http://www.virtualbox.org/wiki/Downloads
[6]: http://forums.virtualbox.org/viewtopic.php?f=7&t=14976
[7]: http://www.kju-app.org/
[8]:
  http://primeval-soup.blogspot.com/2009/02/ie8-in-ubuntu-intrepid-with-virtual-box.html
[9]:
  http://zytzagoo.net/blog/2009/03/20/howto-running-ie6-ie7-and-ie8-on-ubuntu-intrepid-810-using-virtualbox/
[10]: http://blog.mozmonkey.com/2008/vpc-ie6-ie7-ie8-on-mac-os-x/

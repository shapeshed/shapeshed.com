{
  "title": "Windows Vista and XP Dual Boot",
  "date": "2006-07-27T00:00:00+01:00",
  "description": "Today I successfully completed a dual installation of Windows XP and Windows Vista Beta. I've now got a PC that will boot to either operating system. This is great for being able to test things on either platform with a variety of browsers.",
  "tags": [
    "Microsoft"
  ]
}

![image][1]

In case anyone else needs to do it here's how I did it. I should say don't do this unless you have backed up your data and you don't mind if you have to totally reinstall the operating system. I take no responsibility if this doesn't work!

## Dividing the hard drive

Vista won't install on a single partition. What this means is that you will need to create a partition on your hard drive (unless you have two). Thankfully the excellent and free [GParted][2] will allow you do this. My hard drive is 80GB. I kept 50GB for XP and handed over 30GB for the Vista installation. One you have completed the partition reboot your machine and all being well you should see a new hard drive on your system. Now you can move onto installing Vista.

## Vista Installation

The Vista Beta is available for download from the [Windows Vista][3] site. You can get a product key by signing up to the beta program. The download is an iso file so you will need to make a bootable DVD of this file. Once you ahve done this reboot and begin the installation process. When asked where you want to install select the new partition you have just created. 

Once you have installed Vista when you boot you will see a black screen asking which version of Windows you would like to run.

The install went pretty smoothly for me - a few drivers were missing but I was able to update them manually. So far I'm very impressed with Vista.

 [1]: /images/articles/installvista.jpg 
 [2]: http://gparted.sourceforge.net/
 [3]: http://www.microsoft.com/windowsvista/

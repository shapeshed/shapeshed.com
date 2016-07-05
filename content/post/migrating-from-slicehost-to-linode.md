{
  "layout": "post",
  "title": "Migrating from Slicehost to Linode",
  "date": "2011-08-29T00:00:00+01:00",
  "description": "Why I'm moving and how to do it",
  "tags": [
    "Unix"
  ]
}

## Slicehost was a game changer

I've been a long standing [Slicehost][1] customer, after moving from [Media Temple][12]. Slicehost was perfect for my needs - I knew my way around Linux so I just wanted SSH access and the ability to configure it myself. At $20 a month Slicehost was a ground-breaking service. Coupled with a [blog][2] that spoke to developers about how to do things developers were doing every day it provided a range of distributions and was a massive hit with the developer community. On October 22nd 2008 Slicehost announced that they had been acquired by [Rackspace][3]. This was a just reward for what Slicehost had achieved  but immediately there were concerns as to the direction of the service. 

From public accounts Rackspace has used Slicehost's underlying technology to build their [Rackspace Cloud][4]. In May 2011 Rackspace contacted [Slicehost customers][14] to say they would be migrated to the Rackspace Cloud product.

## PR Car Crash

The email to customers raised more questions that it gave answers causing many customers to leave Slicehost there and then. There were so many questions that a further post was [added to the forum][5] which in fairness addressed many of the questions that customers had. At that point it became clear that the service Rackspace were offering was very different from Slicehost:

* DNS moving to Rackspace's service. Unknown if it would be free
* Lower bandwidth allowance with pricing moving to pay what you use
* Some servers moving datacenters and changing IP addresses
* Removal of some Slice sizes 
* Slicehost API likely to close 
* A requirement to migrate to Rackspace by May 2012
 
Particularly if you use more than 60GB of bandwidth a month the service Rackspace's Cloud Service would be more expensive.

## Free markets are good

Thankfully the hosting market is very competitive and even Slicehost has competition in the form of [Linode][6], a service launched in 2003. Linode offer a very similar service to Slicehost with the ability to provision servers, get SSH access and build it yourself. In fact Linode's offering to customers is more competitive than Slicehost with 512MB of RAM offered for the entry price of $20 a month. Linode also offer free DNS servers, a great API and has also been a strong hit with the developer coummunity. 

After looking at the direction of Rackspace Cloud and what Linode offer for the same price the clear choice was to migrate to the better product: Linode.

## The pain of migrating

I've been with Slicehost for a while so with that comes many configurations, DNS zones and a server setup exactly how I like it. Rebuilding servers is tedious and sadly I built mine before [Puppet][7] was around. I use Puppet at work and this has shown me there is huge value in automating server management, especially in the context of Cloud providers. 

After the decision to migrate I was staring at a terminal with many hours of work ahead of me, until the power of open source came to the rescue.

## Migrating DNS

Firstly for migrating DNS records Rob Schultz created a short [Ruby script][8] to migrate DNS records from Slicehost to Linode. Once you've installed the script and necessary gem dependencies migrating your records is as simple at 

    ./slicedns2linode.rb domain1.com.

Within a few minutes I had migrated all of my DNS records. 

## Migrating the server

If you are not already using Chef or Puppet there is a project called [Blueprint][9] that lets your reverse engineer a server configuration to a bash script, Puppet manifests or Chef cookbook. There is a [good tutorial][10] on a basic migration. Once you've installed blueprint and the dependencies you can create a shell script that will build another server with 

    blueprint create -S tutorial

Once you've created your scripts, just run them on the target server and it will build the server in the image of the old one.

## My experience of Blueprint

The migration via blueprint went very smoothly. I had installed lots of packages adding third party repositories and compiling from source. Other than [gitosis][11] packages were mostly copied over and iptables was successfully configured. 

## Finishing up with scp

Finally I had to copy over website, home folder files and a few config files. The perfect tool for this was scp. First I created a tar.bz2 archive for folders I wanted to copy.

    tar -cjf vhosts.tar.bz2 /var/www/vhosts

Then I copied over the archive to my new Linode instance

    scp vhosts.tar.bz2 george@123.456.78.90:/var/www

Finally I unarchived it on the Linode instance

    tar -xjf vhosts.tar.bz2

The great thing about using this approach is that permissions are preserved. 

The last part was to change the name servers for my domains over to Linode.

## Thanks Slicehost

Slicehost was a great service and the articles in particular helped me to skill up on UNIX and respond to many different scenarios. I'm sad that Slicehost will no longer be around and in particular that the service offering is so different from Rackspace. Slicehost was cloud hosting before it became trendy and now cloud hosting is something entirely different. I hope Linode can make me as happy - so far so good. 

[1]: http://www.rackspace.com/
[2]: http://articles.slicehost.com/
[3]: http://www.rackspace.com/
[4]: http://www.rackspace.com/cloud/
[5]: http://forum.slicehost.com/index.php?p=/discussion/5210/x
[6]: http://www.linode.com/
[7]: http://puppetlabs.com/
[8]: https://github.com/Schultz/slicedns2linode
[9]: https://github.com/devstructure/blueprint
[10]: http://devstructure.com/blueprint/
[11]: http://scie.nti.st/2007/11/14/hosting-git-repositories-the-easy-and-secure-way
[12]: http://mediatemple.net/
[13]: http://www.slicehost.com/articles/2008/10/22/big-news-today
[14]: http://thenextweb.com/dd/2011/05/03/rackspace-to-shut-down-slicehost/

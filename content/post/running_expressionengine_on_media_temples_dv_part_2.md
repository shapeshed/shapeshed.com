{
  "title": "Running ExpressionEngine on Media Temple's (dv) Part 2",
  "date": "2007-11-27T00:00:00+00:00",
  "description": "The second article in the series looking at optimising Apache and MySQL to run ExpressionEngine at optimum speed",
  "tags": [
    "Apache",
    "ExpressionEngine",
    "Media Temple"
  ]
}

## Working with 256k

At just 256k dedicated RAM the [Media Temple Base][1] is not exactly top of the range. In fact it is pretty much rock bottom. But for the money it is a good deal. If you optimise your server the (dv) Base can happily run multiple installs of ExpressionEngine with medium levels of traffic. 

This article is advice only. No responsibility will be taken for following the instructions below.

## Moving email off (dv)

After around 6 months of using the (dv) Base I found that the server was regularly complaining that it was running out of memory. The box was running around 15 sites and 30 email accounts. Around that time [Google Hosted Services][2] emerged and after a month or so of testing with my own account I made the switch. Moving email off the (dv) to Google has improved the service offering to clients and reduced the load on the box. None of my clients have found any problems.

To move to Google Hosted Services you need to set up the account and then (and only when) you are ready amend the DNS records for each domain. This can be done through the Media Temple control panel. 

## Optimise Apache and MySQL

Media Temple have posted a [series of articles][3] on optimising the (dv) server. Following these will reduce the load on the server and free up some precious RAM. 

Dave Seah has also posted a series of articles targeted at using WordPress on the (dv). Although these are focussed on WordPress all of them are worth reading and following:

*   [Configuring a Media Temple (dv) Base for WordPress][4]
*   [Monitoring My Media Temple (dv) Base Memory Usage][5]
*   [Other Optimizations for the Media Temple (dv) Base][6]

There are some useful comments in these articles here that can help you squeeze every last ounce of RAM out of your server.

## Turn off anything you don't need

Plesk is configured to start services on boot even if you are not using them so you can go through and disable them. To do this you remove execute permissions from the start up scripts in the /etc/init.d/ folder. So for example I'm not using the courier-imap service so the following command stops it from starting. 

    chmod a-x /etc/init.d/courier-imap 

If I want to turn it back on at a later date I can just use 

     chmod a+x /etc/init.d/courier-imap 

Here are the services I disabled - remember I'm not using email on the (dv).

*   courier-imap
*   drwebd
*   mailman
*   named
*   postgresql
*   psa-spamassassin

After doing all this and following the items above the amount of RAM in use has more than halved and the box is now happily running using about 35% of the allocated 256k or RAM.

 [1]: http://www.mediatemple.net/webhosting/dv/pricing.htm
 [2]: https://www.google.com/a/
 [3]: http://kb.mediatemple.net/article.php?id=771
 [4]: http://davidseah.com/blog/comments/configuring-a-media-temple-dv-base-for-wordpress/
 [5]: http://davidseah.com/blog/comments/monitoring-my-media-temple-dv-base-memory-usage/
 [6]: http://davidseah.com/blog/comments/other-optimizations-for-the-media-temple-dv-base/

+++
date = "2009-02-25T00:00:00+00:00"
description = "I am currently working on an ePDQ integration with Magento, the Open Source eCommerce platform. I'm going to be documenting the process on this blog outlining any recommendations or issues that come up."
slug = "magento-and-epdq-part-1"
tags = ["ePDQ", "Magento"]
title = "Magento and ePDQ - Part 1"
+++

If you are looking for a payment gateway for ePDQ I'm not releasing my module
commercially but there is now an
<a href="http://www.magentocommerce.com/extension/2050/barclaycard-epdq-cpi-payment-module">offical
ePDQ module available</a>

## ePDQ setup

[ePDQ][1] is a relatively new web payments gateway from Barclays Bank that I
hadn't used before. My client had been using [PayPal][2] but was having problems
accepting payment from overseas. They were also unhappy with the high fees for
PayPal and given that they also have their Business Banking with Barclays they
decided to make the switch.

I was lucky in that the client I am working for trusted me and gave me full
access to the administration areas. Quite rightly Barclays are extremely
security conscious so you may find that when you are setting things up you will
need to get the client involved or obtain further credentials. An integration
guide is provided at an extranet site.

## Setting up a CPI user

ePDQ recommend that you set up a separate user to integrate ePDQ with CPI
(Cardholder Payment Interface). The integration guide gives you a walkthrough on
how to do this. I got into a spot of bother as the password I had set was using
non-alphanumeric characters. This is noted in the document but there isn't any
validation on the site. It will let you create the password but not login with
it.

Once you've set a password successfully. You must then log out and log back in,
resetting your password immediately. This again wasn't as clear as it could have
been in the documentation. I then managed to lock my password. Not a problem - I
had the administrator password but if your client doesn't give this to you it
will be a pain.

## Sign on to the ePDQ Configuration Pages

I was then able to sign into the ePDQ configuration changes where you have to
enter information about your application. You have to add your username and
password again and there is a suggestion that this is not synchronised with the
Administration section. I can see this being a potential issue.

You then enter information about your application. I hadn't actually started
building the application at this stage so I didn't know all of the details.

## Let's get testing..

Or maybe not. ePDQ does not have a sandbox. _ OMG _ Seriously? Yes. That's an
issue. I'm still waiting on a response from their support team about how to take
this forward. Build a sandbox site for developers would seem to be a good start.

## Itegrating ePDQ with Magento

Turns out that there is [an extension already written][3] for Barclays ePDQ.
I'll cover how this went in a later post.

## Magento setup

There is [a handy file][4] that will profile your server and tell you if it is
compatible. I run CentOS servers for both development and production and the
version of PHP 5.1.6 was too old for Magento. Regrettably I had to use a third
party yum repo to get a newer version. There's an excellently maintained [yum
repository at Utter Ramblings][5]. Add this to /etc/yum.repos.d and then run:

```sh
yum upgrade php
```

I then found I didn't have the mycrypt extension. Running

```sh
yum install php-mcrypt
```

fixed that. Remember to restart Apache once you have done this.

## Magento installation

I chose to [install Magento via SSH][6] and it was extremely straightforward. If
you aren't comfortable with SSH there are a number of other options available
[at the download page][7].

Then just proceed through the GUI installation by opening your site. I got stuck
when entering the site URL with the error message:

```sh
Url "http://my.domain.com/" is not accessible
Unable to read response, or response is empty
```

Yep - there is no DNS record for the domain so I needed to add that to my local
DNS server or set it in the host file.

Finally don't forget to copy the encryption key at the end of the installation.

That's it - you should be up and running with the test site. Next up -
customisation.

![Default page for Magento][8]

[1]: http://www.barclaycardbusiness.co.uk/
[2]: https://www.paypal.com/
[3]: http://www.magentocommerce.com/extension/530/barclays-epdq/
[4]:
  http://www.magentocommerce.com/knowledge-base/entry/how-do-i-know-if-my-server-is-compatible-with-magento
[5]: http://www.jasonlitka.com/yum-repository/
[6]:
  http://www.magentocommerce.com/wiki/groups/227/installing_magento_via_shell_ssh
[7]: http://www.magentocommerce.com/download
[8]: /images/articles/magento.webp

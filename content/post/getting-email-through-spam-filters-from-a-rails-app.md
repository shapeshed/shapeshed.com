{
  "layout": "post",
  "title": "Getting email through spam filters from a Rails App",
  "date": "2010-12-06T00:00:00+00:00",
  "description": "Recently I did some work on ideapi a Rails app that was consistently delivering email to spam folders of major email providers. After the work email is consistently delivered to Gmail, Google Hosted Accounts, Hotmail, Yahoo and AOL Mail. Here are the details on how it was achieved.",
  "tags": [
    "Rails",
    "Unix"
  ]
}

## The Skinny

This is a walkthrough on how mail is delivered successfully into the inboxes of Gmail, a Google Hosted Mail account, Hotmail, Yahoo and AOL Mail from a Rails application using [Postfix][1] on an [Ubuntu 10.04 server][2]. 

Knowledge of Ruby, DNS and Unix administration is required. If all of that seems to frightening I recommend a service like [Sendgrid][3] to handle delivery of mail from your Rails app. 

## The Task

I followed a test driven approach to this task so set out what I wanted to achieve first. Success criteria for a pass was for mail to be delivered to the inboxes of 

* Gmail
* Google Hosted Mail Account using Postini
* Hotmail
* Yahoo Mail
* AOL Mail

## Initial tests

Sending mail from the application without any changes resulted in the following test results

FAIL: Gmail, Google Hosted Account, Hotmail, Yahoo, AOL

## Content Level

First we looked at the content of the email. It was three lines of text each with a link in. This looked spammy so we decided to flesh out the email a little, taking other web based services as an example. This presented an opportunity for some help text at the end of the email. Useful to the user and useful for the purpose of getting mail through. 

FAIL: Gmail, Google Hosted Account, Hotmail, Yahoo, AOL

## Application Level

I decided to take HTML email out of the equation entirely and deliver plain text mail only. It may be that this gets added back in at a later date but it seemed easier to test things by taking out one variable. 

It is easy to ensure that your Rails app sends email as plain text. Make sure your templates end with .text.plain.erb and the correct mime type will be sent. Note that if you have templates with .text.html.erb these will need to be removed or a multipart email will be sent. 

Following some excellent advice from [Ilya Grigorik][8] I then ensured that the headers on the emails were correct. In my case the reply to address was different from the from header. 

At this stage messages were getting through Postini but still ending in SPAM in Gmail but were being rejected by Hotmail and Yahoo.

Partial PASS: Google & Google Hosted Account (delivered but in Spam folder)

FAIL: Hotmail, Yahoo, AOL

## Server

A [great article by Kenn Wilson][9] really helped to configure the mail server correctly. To start with there was no fully qualified domain name in place on the server and the reverse DNS was set to the dynamically generated [Slicehost][4] address. Firstly a FQDN was set on the server and then a reverse DNS entry was set to point to the FQDN rather than the Slicehost address. This is all detailed in Kenn's article so I won't duplicate the details here. 

Partial PASS: Google & Google Hosted Account (delivered but in Spam folder)

FAIL: Hotmail, Yahoo, AOL

## SPF Records

[The Sender Policy Framework][4] allows you to specify a TXT DNS entry that identifies which servers are allowed to send mail for a domain, or subdomain. The Project homepage has a good overview and a wizard to help you set up DNS records. 

Partial PASS: Google & Google Hosted Account (delivered but in Spam folder)

FAIL: Hotmail, Yahoo, AOL

## Spamhaus

[Spamhaus][7] by default blacklists some IPs until they are manually removed. This was the case with our Slicehost IP. There are a few services to see if your domain is blacklisted. [MX Toolbox][6] offers and excellent free service. If you discover that your IP is listed in Spamhaus there is a process for removing it. Once DNS had propagated we saw messages making it through to Hotmail and Gmail. Still though we were seeing messages ending up in the Spam folder for Yahoo!

PASS: Google & Google Hosted Account, Hotmail, AOL

FAIL: Yahoo

## Domain Keys

[Domain Keys][12] is an idea that Yahoo is behind so I felt there was a  good potential that if Domain Keys were implemented that Yahoo Mail would start to trust the mail. I found a [great walkthrough detailing how to do this][10] on Ubuntu. I won't duplicate that article here, but the short answer is that once DNS had propagated Mail was now being delivered successfully to Yahoo. 

PASS: Google & Google Hosted Account, Hotmail, AOL, Yahoo

## Wrapping up

Getting mail delivered from a Rails application to all of these email providers was not an easy task and all in took about a day's work. I can now understand why many developers just opt for delivery via a service like SendGrid.

But having completed the exercise the application now has reliable email delivery to all of these email services without the additional overhead of using a third-party service. I'm also sure this requirement will come up again so the experience should stand me in good stead. 

If you have anything to add from your own experience please email me and I'll update the article. 

## Related links

* [Domain Keys][12]
* [Sender Policy Framework][5]
* [Domain Keys Identified Mail][13]

[1]: http://www.postfix.org/
[2]: http://www.ubuntu.com/server
[3]: http://sendgrid.com/
[4]: http://www.slicehost.com/
[5]: http://www.openspf.org/
[6]: http://www.mxtoolbox.com/blacklists.aspx
[7]: http://www.spamhaus.org/lookup.lasso
[8]: http://www.igvita.com/2007/07/21/sendmail-spam-filter-tricks-in-rails/
[9]: http://www.corvidworks.com/articles/mail-deliverability-tip
[10]: https://help.ubuntu.com/community/Postfix/DomainKeys
[11]: http://ideapi.com
[12]: http://domainkeys.sourceforge.net/
[13]: http://www.dkim.org/

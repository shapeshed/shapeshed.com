+++
date = "2009-08-11T00:00:00+01:00"
description = "Pre-installed on most OSX and Linux/Unix systems cURL is a great tool for testing and developing a website. Here's a quick overview of what you can do."
tags = ["Linux"]
title = "Using cURL for web development"
+++

cURL provides developers with a useful toolkit to help in developing and
debugging websites.

## POST, GET, PUT, DELETE

cURL can handle all of these and there are libraries for most of the major
programming languages. It handles most common protocols: HTTP, HTTPS, FTP, FTPS,
SCP, SFTP, TFTP, DICT, TELNET, LDAP or FILE. You can use it to create
functionality or [write unit tests.][1]

## Viewing response headers

Let's say you want to check the response headers of a site. Easy using cURL.

```sh
curl -I http://www.telegraph.co.uk/
```

Outputs the HTTP response headers

```sh
HTTP/1.1 200 OK
Server: Apache
Last-Modified: Tue, 11 Aug 2009 10:12:19 GMT
ETag: 63-1249985539438
Content-Language: en-GB
Content-Type: text/html;charset=ISO-8859-1
Date: Tue, 11 Aug 2009 10:15:09 GMT
Connection: keep-alive
```

## Profiling responsiveness

cURL comes with a massive array of options. You can find these on [the
manpage][2]. We can use some of these to profile the responsiveness a site. In
this example we look at the Twitter API.

```sh
curl -w '\nLookup time:\t%{time_namelookup}\nConnect time:\t%{time_connect}\nPreXfer time:\t%{time_pretransfer}\nStartXfer time:\t%{time_starttransfer}\n\nTotal time:\t%{time_total}\n' -o /dev/null -s http://twitter.com/statuses/public_timeline.xml
```

We are using a number of the variables available to show how long it took to
resolve the domain name, how long it took to make the connection, the
pretransfer time, then how long it took to start the transfer.

The output we get is

```sh
Lookup time:    0.024
Connect time:    0.181
PreXfer time:    0.181
StartXfer time:    0.554

Total time:    1.591
```

Nearly 1.6 seconds - that's pretty slow.

You can even up your Twitter status using cURL if you want.

```sh
curl --basic --user "username:password" --data-ascii "status=dancing round in high heels" http://twitter.com/statuses/update.json
```

cURL is a great tool for web developers and I'll certainly be using it more.

## References

- [cURL Man page][2]
- [How to Use cURL to Test RESTful Rails][1]
- [PHP: cURL Manual][3]
- [Linux Journal | Linux Tips: curl Examples][4]

[1]:
  http://blog.inquirylabs.com/2006/08/04/how-to-use-curl-to-test-restful-rails/
[2]: http://curl.haxx.se/docs/manpage.html
[3]: http://www.php.net/curl
[4]: http://linux-journal.blogspot.com/2005/04/curl-examples.html

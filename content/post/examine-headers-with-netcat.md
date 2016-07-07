{
  "slug": "examine-headers-with-netcat",
  "title": "Examining request headers with netcat",
  "date": "2014-02-19T08:38:19+00:00",
  "description": "How to use Netcat to examine request headers from user agents or applications.",
  "tags": [
    "Opinion"
  ]
}

## Outside in Request Headers

If you are writing web applications in an increasingly distributed world the chances are you will be using other web services outside your application. Often these services expect headers to be set for things like [User-Agent][1] and [Authorization][2]. Most frameworks allow you to dump the headers for the request you are making but to be really sure of the headers you are sending you may want to examine them from the outside in.

You can do this with [netcat][3]. Netcat is touted as the TCP/IP Swiss Army knife and with Network Programming becoming more important is an excellent tool.

    netcat -lp 10839

This instructs netcat to listen on port 10839. Now you can make a request to it and see what your application or user agent is sending.

Here's an example with the [w3m][4] browser

    w3m http://localhost:10839 

The request headers are logged to the console.

    GET / HTTP/1.0
    User-Agent: w3m/0.5.3
    Accept: text/html, text/*;q=0.5, image/*
    Accept-Encoding: gzip, compress, bzip, bzip2, deflate
    Accept-Language: en;q=1.0
    Host: localhost:9999

Here's another example with the [Chromium][5] browser in incognito mode.

    GET / HTTP/1.1
    Host: localhost:10839
    Connection: keep-alive
    Cache-Control: max-age=0
    Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8
    User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/32.0.1700.107 Safari/537.36
    Accept-Encoding: gzip,deflate,sdch
    Accept-Language: en-US,en;q=0.8

More likely you will want to direct a request from within your application to netcat to verify your headers. Netcat is a super simple way to quickly debug and examine headers from outside your application.

[1]: http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.43
[2]: http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.8
[3]: http://nc110.sourceforge.net/
[4]: http://w3m.sourceforge.net/
[5]: http://www.chromium.org/

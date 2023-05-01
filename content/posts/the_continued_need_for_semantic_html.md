+++
date = "2009-06-04T00:00:00+01:00"
description = "Two new search tools in Wolfram and Google Squared have been released that demonstrate the need for a standards based approach to web semantics and data."
tags = ["Yahoo", "Google", "XHTML", "Opinion", "Web Standards"]
title = "The continued need for semantic HTML"
+++

## HTML is king

From [its invention][1] in 1989 to [present day developments][2], HTML has been
the foundation for documents on the web. Documents are marked up by humans or
machines using HTML and pushed into the ether of the web where they are
subsequently consumed by humans and robots. Initially the [HTML
specification][3] worked well for creators and consumers alike and [Google][4],
the most ubiquitous search service, grew out of the ability to parse and
intelligently index HTML content. Google did this so well the company name
became a verb synonymous with discovering things via the internet. Fait accompli
you might think.

## Innovation

Google produced a product that killed others, but with the emergence of [Web
2.0][5] (a much maligned term if ever there was one) Google's standard search
engine is beginning to look behind the times for a number of reasons. Content is
being generated more quickly and more frequently. Services like Twitter are
quicker to [return results in nearly real-time][6] and [APIs][7] are allowing
developers in userland to create [custom views][8] and [mashups][9] of disparate
sets of data.

## Huge effort for low return

Of course Google continues to innovate but in using [Google Squared][10] I
couldn't help feeling that a massive amount of human and computational effort
had been extended on my search of [British Beer][11]. I can only imagine the
data harvesting and algorithms that are going on behind the scenes to give me
three results. Granted of course that [Google Squared][10] is still a labs
product.

The same is true of Wolfram which is [attempting to make search
computational][12]. In terms of aggregating disparate pieces of information it
must be reliant on some hefty algorithms and a lot of processing power.

## More complex than it should be

Indexing, storing and processing data seems more complex than it should be.
[Yahoo's YQL][13] seems to turn the data harvesting and algorithm heavy model on
its head. By making data available through [Open Tables][14] there is a
[RESTful][15] route to the primary source data that is available to anyone.
Essentially the World Wide Web becomes its own database. The web exists as the
data and a giant [relational database][16] with the ability to create meta views
of that data. There is no need for it to exist in multiple instances in search
engine datacentres. I am not saying that traditional search engines are going to
go away, but that from a design pattern perspective the Open Tables model seems
a cleaner and more efficient way of retrieving data from the web.

In addition to APIs and YQL (which is essentially an attempt to standardise an
interface to APIs) is a long-standing move to add more semantic meaning to HTML.
[Microformats][17] have emerged as a genuine means of adding additional semantic
meaning to HTML and allowing third party services access to data in a
standardised, structured way. Microformats exist for [contact information][18],
[calendars][19] and [reviews][20]. This allows parsers to access the primary
source of data and use it however they like. I even produced

[an example][21] of how Microformats can return contact details from a URL. No
need for a third party search engine - instant access to the primary data source
in real time.

## Standards needed

What struck me about Google Squared in particular was that pretty much
everything it was trying to do could be solved by giving HTML more semantic
meaning. Of course defining this is a massive task but in [a previous job][22]
as an Information Professional, I learned that for good reason there are
international standards for indexing books, journals and data that knowledge
professionals rely on. In my opinion the web is still badly lacking these
standards and frameworks for giving content semantic meaning.

Google's [goal][23] is "to organize the world's information and make it
universally accessible and useful". The goal of the World Wide Web in general
should now be to make world's data universally accessible. The means for
[controlling][24] [access][25] to open data are coming along nicely and as a
community I feel we should redouble our efforts to make sure data is open to
all. YQL and Microformats show that standardising APIs and Semantic HTML
respectively can be done at a meta level. For me harvesting massive amounts of
data in the search space is not the way to go. Instead we should work towards
creating a standards based approach to open data on the web.

[1]: http://www.w3.org/People/Raggett/book4/ch02.html
[2]: http://dev.w3.org/html5/spec/Overview.html
[3]: http://www.w3.org/TR/html4/
[4]: http://www.google.com/
[5]: http://oreilly.com/pub/a/oreilly/tim/news/2005/09/30/what-is-web-20.html
[6]:
  http://www.telegraph.co.uk/scienceandtechnology/technology/twitter/4269765/New-York-plane-crash-Twitter-breaks-the-news-again.html
[7]: http://en.wikipedia.org/wiki/API
[8]: http://findth.at/
[9]: http://searchmashup.com/
[10]: http://www.google.com/squared
[11]: http://www.google.com/squared/search?q=british+beer
[12]: http://www.wolframalpha.com/about.html
[13]: http://developer.yahoo.com/yql/
[14]: http://datatables.org/
[15]: http://en.wikipedia.org/wiki/Representational_State_Transfer
[16]: http://en.wikipedia.org/wiki/Relational_database
[17]: http://microformats.org/
[18]: http://microformats.org/wiki/hcard
[19]: http://microformats.org/wiki/hcalendar
[20]: http://microformats.org/wiki/hreview
[21]: /examples/hcardme/
[22]: http://www.mckinsey.com/
[23]: http://www.google.com/corporate/
[24]: http://oauth.net/
[25]: http://openid.net/

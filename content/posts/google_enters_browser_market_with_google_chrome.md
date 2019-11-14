{
  "title": "Google enters browser market with Google Chrome",
  "date": "2008-09-02T00:00:00+01:00",
  "description": "The news that Google is to launch Google Chrome, a web browser is good news for the browser market and web applications in general.",
  "tags": [
    "Browsers",
    "Google"
  ]
}
## Why a new browser?

Pick through this:

> So why are we launching Google Chrome? Because we believe we can add value for users and, at the same time, help drive innovation on the web.

The reason of course is that the browser is now responsible for running web based applications like calendars, word processors, rss readers and email. Who is leading the market in this area? Google is.

With Google producing many of the leading products in the online application market it makes sense for them to take control of the delivery platform. Details of what goes on under the hood reveal more of the strategy behind the decision to build a browser:

> We also built a more powerful JavaScript engine, V8, to power the next generation of web applications that aren't even possible in today's browsers.

This would seem a logical step. Application developers are increasingly at the mercy of the browser that the end user is using. By producing their own browser Google will be able to innovate more quickly and bypass waiting for the open source projects like WebKit and Firefox to respond to their stategic requirements.

## Features

The [Comic Book][1] published by Google gives more information on the features of Google Chrome and reveals Google's responses to running JavaScript heavy Web Applications.

Google Chrome will apply process isolation to the browser and have separate processes rendering in separate tabs. The advantage of this approach is that if a web application crashes the browser you will just lose a tab rather than all open tabs. This all points to the desktop moving online - a phenomenon that is widely anticipated but has been stifled by browser performance.

Furthermore Google will give consumers the ability to see how sites are performing and will identify sites that consume heavy amounts of memory. This is available in part via Firefox extensions but explicitly making this a feature will give consumers the ability to scrutinise the performance of sites. This can only be a good thing for the industry and for user experience on the web in general.

The news that WebKit is larely used as the rendering engine under the hood is good news. WebKit has been at the forefront of the browser market for some time. More interesting is the decision to write a new JavaScript engine that parses and then compiles code for the browser. More details are required on this but if the end result is faster JavaScript heavy websites then this can only be a good thing.

## Design

Historically Google has been weak at design. The comic suggests this may continue with a Software Engineer talking us through the design decisions. The decision to move tabs to the top of the page and make each tab its own entity is a good one. It makes sense for web applications to have their own controls. 

Google Chrome will display the most visited pages in a grid, an idea that seems to be heavily influenced by [Opera's UI][2]. The difference though is that the browser learns the sites that you visit most frequently and builds the page for you. I really like this idea of using technology to build the UI specifically for the user.

## Security

Not surprisingly malware and phishing are a major concern and it is interesting to see the decision has been taken to assign permissions on a user level. This assumes no rights until explicitly granted by the user, again a decision that makes a lot of sense.

## Conclusion

The news that Google is entering the browser market is great news for the web in general. Microsoft's browser Internet Explorer is now looking under more pressure and if Google can tie their browser to killer web applications then IE's market share will surely be further eroded. I for one am really looking forward to testing the newcomer to the market.

 [1]: http://www.google.com/googlebooks/chrome/
 [2]: http://www.opera.com/

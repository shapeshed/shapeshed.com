{
  "title": "Experimenting with CSS3 and HTML5",
  "date": "2009-08-14T00:00:00+01:00",
  "description": "I've been creating more and more code examples and increasingly using GitHub for sharing code. I wanted to experiment with a few things so I <a href=\"http://shapeshed.github.com/\">created a site</a> on <a href=\"http://pages.github.com/\">GitHub pages</a>.",
  "tags": [
    "CSS3",
    "HTML5",
    "JavaScript",
    "CSS",
    "Design"
  ]
}

[![Experimental Site on Github Pages][1]][2] 

## No Database

With Github pages you are not able to use a database. This was actually an attraction for me. Increasingly the data that I want to show is distributed around various part of the internet. [Christian Heilmann][2] has demonstrated how it is possible to create a site almost entirely from APIs. Through expriements with YQL and native APIs it became clear that most of the data that I wanted to show is available through APIs.

The site makes JSONP calls to Twitter, LastFM, Flickr and Lighthouse. There's no caching as yet or error handling but hopefully this can be addressed in the future. 

## HTML5

I wanted to experiment with [HTML5][3] and realistically I couldn't do this on a client site. Writing HTML5 just felt right - there are now tags for the header, navigation and footer - elements I've used on every site I've ever created. I didn't really use any of the new APIs that are offered by HTML5 so perhaps that's something for the future. I'm now even more encouraged to use HTML5.

## CSS3

I've been using elements of CSS3 for some time but this was a chance to really let rip. Of course this leaves browsers like [Internet Explorer][4] out in the cold but that wasn't really the point of this project. In fact I chose not to support Internet Explorer at all. Why? Because I could I suppose. Supporting IE is the day job.

## Jekyll

The engine behind the site is [Jekyll][9], a simple static site generator. It parses Markdown or Textile documents and outputs a static site. I found it easy to learn and feature rich enough for this project.

## Open source

Pretty much everything I've have learned in terms of my job has been through people sharing their knowledge. So I love the idea that people can clone the site repository and play with it, or even enhance it.

You can view [the site here][6] and see what's under the hood at [the Github repository][7].

 [1]: /images/articles/github_site.jpg
 [2]: http://shapeshed.github.com/
 [3]: http://icant.co.uk/
 [4]: http://www.whatwg.org/specs/web-apps/current-work/multipage/
 [5]: http://www.microsoft.com/windows/internet-explorer/default.aspx
 [6]: http://github.com/mojombo/jekyll/tree/master
 [7]: http://shapeshed.github.com/
 [8]: http://github.com/shapeshed/shapeshed.github.com/
 [9]: https://github.com/jekyll/jekyll

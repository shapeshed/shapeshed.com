{
  "title": "Updating content using unobtrusive ajax",
  "date": "2007-05-09T00:00:00+01:00",
  "description": "Pulling in content from external providers can cause page load times to increase dramatically. Using unobtrusive ajax and caching you can keep content up to date for everyone (including those with javascript turned off) whilst minimising the impact on page load times.",
  "tags": [
    "AJAX",
    "JavaScript",
    "DOM"
  ]
}

## The issue

Web services are great. They allow you to keep your data elsewhere and have access to it through an API. You can keep your links with [del.icio.us][1], your photos with [Flickr][2], and your listening habits with [Last.fm][3]. This is a growing area and it is only going to get bigger.

The problem is that pulling in content from external providers can slow your page load time drastically. There are times when APIs are slow to respond and rather than displaying your data, users have to suffer a page loading slowly as the server side script does battle with a slow API.

## Caching helps

Caching the result of requests certainly helps. You can place responses from APIs in a text file, or even a database. When another user visits the site a script can decide whether it is really necessary to go back to the API server all over again. If not then the cached version can be served and no need to go all the way back to the API.

The problem though is that if the script decides that it is indeed time to go back to the API to update the data and the external server is slow the user still gets a long page load time.

## Unobtrusive Ajax to the rescue

You can keep content up to date and minimise the impact on page load time. Using unobtrusive javascript you can also keep content up to date for users with and without javascript. 

Using an AJAX call you can fetch the data after the page has loaded. Here's the sequence of events. 

1.  Page loaded with cached data in place using server side scripting to read the cache
2.  Javascript off - cached data remains
3.  Javascript on - onload function fires AJAX call to server side script
4.  Server side script decides whether to used cache or to update the data from the API
5.  If no update is required server side script returns cached data
6.  If an update is required server side script fetches data from API and returns updated data
7.  Server side script updates cache
8.  Javascript receives AJAX response and writes it to the page using the DOM.

This method would seem to have several advantages to me:

*   It allows javascript users to update content for users who don't have javascript
*   It doesn't break when javascript is turned off
*   It is friendly to search engines
*   Good cross browser support
*   It reduces impact on the users page load time, allowing data to be updated after page load and giving a better user experience.
*   No impact on accessibility

## Work in progress

To date this method seems to be running smoothly. I'd be interested to hear what others think about this so please leave a comment if you have an opinion. This method is being used in the Twitter and LastFm feeds in the footer of this site, but I can see it being useful for many other things.

 [1]: http://del.icio.us/
 [2]: http://www.flickr.com/
 [3]: http://www.last.fm/

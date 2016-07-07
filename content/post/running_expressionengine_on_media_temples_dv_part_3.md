{
  "title": "Running ExpressionEngine on Media Temple's (dv) Part 3",
  "date": "2007-12-03T00:00:00+00:00",
  "description": "In the final part of the series we look at how to optimise the front end code on your site and cut response times by up to 50%.",
  "tags": [
    "ExpressionEngine",
    "JavaScript",
    "CSS",
    "XHTML",
    "Media Temple"
  ]
}

## Optimising front end code

The final part of this mini-series is not really specific to ExpressionEngine or to the (mt)(dv)3. But the theory is relevant to ExpressionEngine deployment, the (dv) server and indeed to all websites.

## Decrease load times

A fast and responsive site is critical to user experience. Jakob Neilsen has [written][1] that a responsive site it is a strong part of ensuring a good user experience. You may not know that you can cut your load time by 40 - 50% without a great deal of effort. 

## What you'll need

The tools we'll use to analyse page loading times are:

*   [Firefox][2]
*   [Firebug][3]
*   [YSlow plugin for Firebug][4]
*   [Firefox Web Developer Toolbar][5]

With these tools you'll be able to analyse how your site is performing and check that performance improvements are actually taking effect. First you'll need to see where you are before optimising. Fire up your page and then using the Web Developer Toolbar go to Information > View Document Size. This shows you with a handy breakdown how much your page weighs. You should be aiming for under 150k and ideally lower than that if you can. A common mistake is not to optimise images resulting in hefty file sizes being downloaded to the browser and slowing down the site. 

![Viewing document size][6] 

You can also see in real time what takes time to load by using Firebug and clicking on the Net tab and then reloading the page. You can actually watch the requests as the page loads. This will certainly let you see if there is a problem. 

![Viewing load time][7] 

## Learning from Yahoo

I really like the way that Yahoo share the knowledge they learn internally. They published the YSlow Firebug extension to help developers learn about how to reduce page load times and it has certainly helped me. Yahoo have even published a [video of Steve Souders][8] sharing this knowledge internally. He states you can expect performance increases of between 40 and 50% by following the recommendations and my experience supports that.

Most of Yahoo's recommendations are covered in the .htaccess configuration found in [part one][9] of this series. This covers setting expiry headers (something ExpressionEngine is poor at), turning off ETags, and GZipping. GZipping alone is a powerful way to speed up the information sent to the browser and hence your site. It allows you to send a compressed file that is then uncompressed by the browser. For the example above this drops CSS files alone from 21KB to 5KB. A real saving. 

Other recommendations are not really ExpressionEngine specific and come down to how you write your HTML, CSS and Javascript. Limiting HTTP requests for example comes down to trying to minimise the number of images, CSS and Javascript files on a page. Putting CSS in the head and Javascript above the document knowledge is simply good advice learnt from Yahoo. 

I recommend setting the Expires headers, GZipping and Turning off ETags using either an .htaccess file or a vhost.conf file. It immediately results in a quicker site. The other recommendations from Yahoo are also great and have resulted in much quicker EE sites for me. 

So really optimising ExpressionEngine is a three pronged approach:

1.  [Optimise the ExpressionEngine installation and turn on caching][9]
2.  [Optimise the server][10]
3.  Optimise the front end code

If you address all of these areas there is no reason that the (dv) Base should not serve you very well for running responsive websites using ExpressionEngine.

 [1]: http://www.useit.com/alertbox/9703a.html
 [2]: http://www.mozilla.com/firefox/
 [3]: http://www.getfirebug.com/
 [4]: http://developer.yahoo.com/yslow/
 [5]: https://addons.mozilla.org/en-US/firefox/addon/60
 [6]: http://shapeshed.com/images/articles/document_size.jpg 
 [7]: http://shapeshed.com/images/articles/firebug_load_time.jpg
 [8]: http://uk.video.yahoo.com/video/play?vid=1040890&fr=
 [9]: http://shapeshed.com/running_expressionengine_on_media_temples_dv_part_1/
 [10]: http://shapeshed.com/running_expressionengine_on_media_temples_dv_part_2/

{
  "title": "Running ExpressionEngine on Media Temple's (dv) Part 1",
  "date": "2007-11-22T00:00:00+00:00",
  "description": "In a series of articles I'm going to look at running ExpressionEngine on Media Temple's (dv) Base Server and optimising both ExpressionEngine and the server for optimum performance.",
  "tags": [
    "Apache",
    "ExpressionEngine",
    "Media Temple"
  ]
}

Like many web developers I use [Plesk][1] on Media Temple's [(dv) Base server][2]. Owing to growing popularity of this blog the server is straining a little. I've followed the excellent articles over at [David Seah's site][3] and also the [performance optimsation tips][4] on the Media Temple site with good results. But I was still getting memory issues. Whilst the tips are specific to a Media Temple (dv) 3 server they should be good for most linux distros. I must stress I take no responsibility for using this article. Use at your own risk. Everyone is here to learn so if you feel you can add something please do so by leaving a comment. 

## Optimising ExpressionEngine

In Part 1 we're going to look at [ExpressionEngine][5] and making sure your site is set up to be lean, mean and fast. Out of the box EE does a good job of managing performance. The [ExpressionEngine documentation][6] explains the caching options available to you. 

<dl>
<dt>Query caching</dt>

<dd>This allows frequently used queries to be cached in text files. You want this to be on so check it is by going to your Control Panel and Admin > System Preferences >Database Settings. Make sure Enable SQL Query Caching is set to Yes.</dd>

<dt>Tag caching</dt>

<dd>It is a good idea when you are creating template to tell ExpressionEngine to cache tags that are unlikely to change very often. You get a performance increase by telling tags to cache results so assess your content and what can be cached. The syntax you use is as follows: {exp:weblog:entries cache="yes" refresh="30"}. This would cache the tag for 30 minutes.</dd>

<dt>Template caching</dt>

<dd>If you think you can cache at a template level you can also do so by going into Admin > Templates > Preferences. You'll see an option "Enable Caching". Set this to yes for anything you feel can be cached. You can also set the time interval for when the cache should be refreshed.</dd>

<dt>Dynamic Weblog Query Caching</dt>

<dd>If you are not using <a href="http://expressionengine.com/docs/modules/weblog/parameters.html#par_show_future_entries">future entries</a> or <a href=" http://expressionengine.com/docs/modules/weblog/parameters.html#par_show_expired">expiring entries</a> in your weblog tag you should enable this. It will cache queries that are normally executed dynamically. To turn this on go to Admin > Global Weblog Preferences.</dd>

<dt>Query disabling</dt>

<dd>As you create your weblog tags be sure to turn off anything that you are not using. So if your weblog tag has no requirement for tags turn it off or EE will check for it. I tend to use: disable="tags|member_data|pagination|trackbacks"</dd> 

<dt>Gzip</dt>

<dd>If you have GZIP enabled on your server you should use it and tell ExpressionEngine. Go to Admin > Output and Debugging Preferences and Check "Yes" for Enable GZIP output. You can find out if you have got GZIP enabled by going to the PHP Info page found in Admin > Utilities. Search for SERVER["HTTP_ACCEPT_ENCODING"] and if you see GZIP you are good to go. Using GZIP compresses much of what gets sent to browsers. In my tests for example my stylesheet went from 18k to 4k after GZipping was enabled.</dd> 
</dl>

## Sending it to the browser

One area where EE is a little weak (probably so it is easy to install and use on many different platforms) is in the information it sends to the browser. If you are on a Apache server on Linux and [AllowOverride][7] is on you'll be able to speed up things further using an .htaccess file or better still modifying the Apache configuration.

Here's an the default file I use for .htaccess 

    FileETag none  # Turn off ETag 

    # Set Language and Character Set
    AddDefaultCharset utf-8
    AddLanguage en-gb .en

    # Ensure GZIP Compression is on
    php_value output_handler ob_gzhandler

    # Cache images and set default on everything else
    ExpiresActive on 
    ExpiresDefault A259200
    ExpiresByType image/gif A1209600 
    ExpiresByType image/png A1209600 
    ExpiresByType image/jpeg A1209600 
    ExpiresByType image/gif A1209600

    # Set css and js so they can be gzipped
    <IfModule mod_mime.c>
    AddType application/x-httpd-php .css
    AddType application/x-httpd-php .js
    </IfModule>

    # Turn off errors
    php_value display_errors off

    # Config settings for ExpressionEngine
    AcceptPathInfo On
    Options +FollowSymLinks

Let's go through this a little. Firstly we turn off [ETags][8]. You can find out about why ETags should be off at the [Yahoo Performance site][9]. Secondly I set the default character set and language. Then we make sure GZIP compression is on. Now the important bit. ExpressionEngine is poor at sending Expiry Headers (I'm sure there is a good reason) so often the browser will reload things it could easily cache. These rules set a short default expiry and a longer one for images. Next we want CSS and Javascript to be GZipped. To keep Firefox happy you need to add these lines to the top of your CSS files. 

    <?php header("Content-type: text/css"); ?>

Finally I want to make absolutely sure PHP errors are not shown and I turn on a couple of settings for EE. If you get an internal server error it is likely your host does not allow you to override certain settings. Get in touch with you host and ask. These work ok on (mt)(dv)3.

In part two I'll be looking at optimising the hardware side of things on the (dv) 3.

 [1]: http://www.swsoft.com/plesk/
 [2]: http://www.mediatemple.net/webhosting/dv/
 [3]: http://davidseah.com/
 [4]: http://kb.mediatemple.net/article.php?id=771
 [5]: http://expressionengine.com/
 [6]: http://expressionengine.com/docs/general/caching.html
 [7]: http://httpd.apache.org/docs/2.2/mod/core.html#allowoverride
 [8]: http://en.wikipedia.org/wiki/HTTP_ETag
 [9]: http://developer.yahoo.com/performance/rules.html#etags

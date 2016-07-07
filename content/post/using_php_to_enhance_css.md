{
  "title": "Using PHP to enhance CSS",
  "date": "2007-03-25T00:00:00+00:00",
  "description": "With a bit of PHP you can add an additional layer of logic to your CSS. You might choose to add seasonality to your site or change the layout entirely.  You are limited only by your imagination. ",
  "tags": [
    "CSS",
    "PHP"
  ]
}
## An example

Let's say a client has asked for a different background color for a website at weekends. The idea is that from Monday to Friday a grey background is shown and then at weekends an orange background is shown.

## The simple way

The simple way is use a bit of PHP to serve a weekday CSS file or a weekend PHP file if it is the weekend. In the CSS files you simple specify a different background colour. 

    <?php
    $day = date('D'); // Find out what day of the week it is

    // Set which days are the weekend
    $weekend = array("Sat", "Sun");

    // Check if it is the weekend
    if (in_array($day, $weekend) == true) {
        // Yes it is the weekend
        echo "<style type=\"text\css\" media=\"screen\">@import \"/css/weekend_screen.css\";</style>";    
    }
    else {
        // No it is the week
        echo "<style type=\"text/css\" media=\"screen\">@import \"/css/screen.css\";</style>";
    }
    ?>

## The complicated way

A more complicated but sophisticated way is to tell the server to interpret CSS files as PHP. This opens up a whole world of possibilities. In order to do this you need to add the following lines to your .htaccess file. If you don't know what an .htaccess file is you can find out [about it here][1]. Add this to your .htaccess file: 

    <IfModule mod_mime.c> AddType application/x-httpd-php .css </IfModule>

## CSS files

To make sure that browsers recognise CSS files as CSS make sure you add the following line to the top of your CSS files. 

     <?php header("Content-type: text/css"); ?>

That's all there is to it. You are now free to use PHP in your CSS. If you know the power of CSS you will know what you can do. If not I suggest you have a look at 

Visit [CSS Zen Garden][2] to see how you can change the appearance of a site with just CSS. Along with PHP you have even more possiblities.

## Some ideas

Using PHP with CSS is really limited to your imagination but here are some examples that I can see working well.

### Weekend designs

As above you can change the appearance of your site depending on the day of the week. You get the day using PHP and set CSS rules accordingly.

### Seasonality

You could change the appearance of your site depending on the time of the year. You get the month using PHP and set CSS rules accordingly.

### Style Switchers

You can allow users to change the appearance of your site. The user sets a cookie with a choice and a CSS file or rules are served accordingly.

### Respond to different browsers

Recognising which browser is being used and respond accordingly. PHP can discover which browser is being used.

I'm going to play around with this a little so if I come across anything good I'll post it. If you have any experience of using this method please leave a comment below.

 [1]: http://httpd.apache.org/docs/2.0/howto/htaccess.html
 [2]: http://www.csszengarden.com/

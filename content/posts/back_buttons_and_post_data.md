+++
date = "2006-08-11T00:00:00+01:00"
description = "An overview of how to stop browser warning messages appearing to users"
tags = ["PHP"]
title = "Back Buttons and POST data"

+++

I had a problem whereby users were returning to a page to which POST data had already been submitted and were receiving an ugly message from the browser saying that their POST data had expired. 

Of course there are times when you don't want users to resubmit POST data but this was a simple search results page which took users to a detail page.

It is not unreasonable that most users don't know what POST data is and in short I needed a work around.

I saw a few forum entries saying 'You should tell users not to use the back button!' With this kind of helpful approach I played around with converting the POST variables to SESSION variables before redirecting to the page that uses the variables. Within ten or so minutes the problem was solved. 

Post your form data to a page that processes the variable into a session variable. Then redirect to the page that uses that variable. Following processing the variable is now $\_SESSION['foo'] rather than $\_POST['bar']. This means you can move around as much as you like without triggering the browser message. I do not recommend this for any sensitive information though!

    <?php
    //This eliminates the back button messages of expired POST data by translating POST data in to a SESSION variable and then redirecting

    // Start session
    session_start(); 

    // Unset the variable if it exists 
    unset($_SESSION['foo']);
    if (isset($_POST['bar']))  	
         {
          $_SESSION['foo'] = $_POST['bar'];
         }

    // All done so redirect  
    header('Location: http://www.example.com');
    ?>

The POST data is available at the redirect page and subsequent pages as $_SESSION['foo'] and no ugly back button messages will be seen.

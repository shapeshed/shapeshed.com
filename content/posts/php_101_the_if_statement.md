+++
date = "2008-10-21T00:00:00+01:00"
description = "I get a fair few requests from designers asking for help with basic PHP. So I'm going to write a series on very basic PHP. It is not hard so let's start with a robot and the if statement. "
slug = "php-101-the-if-statement"
tags = ["PHP 101", "PHP"]
title = "PHP 101 - The if statement"
+++

## The if robot

![The if robot][1]

The if statement is integral to programming languages. It allows you to test for
something and then do something else. Using the if statement in PHP is easy and
is not difficult to learn. Imagine you are walking down a street in Edinburgh
and you see a robot standing on the side of the street. The robot has one big
red button on its chest.This is a classic example of a situation where an if
statement should be used.

## The code

Here's what an if statement looks like using the example of the if robot.

```php
<?php
$button = "pressed";

if ($button == "pressed") {
    echo "I am alive and will now perform Sex Machine by James Brown";
}
?>
```

First of all we have a php tag. This allows PHP code to be run. Then we have the
$button variable. A variable is just something that could be more than one
thing. Variables allow you to hold a piece of information temporarily. PHP
variables are identified by a dollar sign followed by the name. In this case it
is the button on the robot. It can be pressed, unpressed or broken. If the
button is pressed the robot will perform a song. The if statement tests whether
the statement within the brackets is true. The == operator tests whether the two
options are equivalent. In this case they are and we are using the echo
statement to write the status to the page. Finally we have our closing PHP tag.

## Testing different conditions

For our example we have used an if statement to do something if the button is
pressed. But there are two further options available to test for different
conditions - elseif and else. Using elseif we can test for something else and we
can then use else to pick up anything that didn't match any of our conditions.
Let's say we want to test if the button is broken or if nothing has happened. We
can do this:

```php
<?php
$button = "pressed";
if ($button == "pressed") {
    echo "I am alive and will now perform Sex Machine by James Brown";
}
elseif ($button == "broken") {
    echo "Malfunction! Broken, destroyed, smashed.";
}
else {
    echo "Nobody wants to press my button. I am so alone.";
}
?>
```

## Shorter syntax

When you are starting out I recommend that you use the syntax above as it is
easier to read and understand. Once you are comfortable though if you are just
testing for two conditions (true and false would be a good example) you can use
a shorter way of writing an if statement. Here's the standard way of finding out
if someone is hungry:

```php
<?php
$hungry = true;
if($hungry) {
    echo "Feed me now! I need food!";
} else {
    echo "Thank you my good man but I am not hungry";
}
?>
```

This can be also be written like this:

```php
<?php
$hungry = true;
echo $hungry ? "Feed me now! I need food!" : "Thank you my good man but I am not hungry";
?>
```

The alternative syntax is more difficult to read but much shorter.

## Links

- [PHP Manual - if statement][2]
- [Tizag tutorial - the if statement][3]
- [W3Schools - PHP If...Else statements][4]

## Credits

- [Robot photograph][5] taken by [pietroizzo][6]
- Original street art by Pixelpancho

[1]: /images/articles/if-robot.jpg
[2]: http://www.php.net/manual/en/control-structures.if.php
[3]: http://www.tizag.com/phpT/if.php
[4]: http://www.w3schools.com/php/php_if_else.asp
[5]: http://www.flickr.com/photos/pietroizzo/290679794/
[6]: http://www.flickr.com/photos/pietroizzo/

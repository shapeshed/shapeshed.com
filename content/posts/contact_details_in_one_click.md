+++
date = "2007-01-13T00:00:00+00:00"
description = "At some stage everyone has laboriously copied and pasted contact details from a website into their address book. Wouldn't it be nice if you could just click a graphic and see the details turn up in your address book?"
tags = ["Microformats", "CSS", "XHTML"]
title = "Contact details in one click"
+++

This tutorial will show how to create a button that will import contact details
into an address book. All you need is some knowledge of XHTML and a graphics
editor. But before the explanation you want to see it working don't you?

[![Add me to your address book](/images/articles/hcard_example.jpg "Add me to your address book")](http://suda.co.uk/projects/X2V/get-vcard.php?uri=/examples/hcard/)

### How is it done? Meet Microformats

Unless you have been hiding for the last year you will probably have heard of
Microformats. The idea is that Microformats add an additional level of meaning
to your XHTML using what's already available. So if you know XHTML and CSS the
good news is that Microformats will be easy.

Take this example of contact details on a web page:

```html
<p>George Ornbo</p>
<p>Shape Shed</p>
<p>email: george@shapeshed.com</p>
<p>address: 22 Centre Square, 17 Hardwicks Way, London SW18 4AG, UK</p>
<p>tel: +44 (0)2081419116</p>
```

Microformats sprinkle in some class names to give further semantic meaning to
the code. They also allow other programs to access the information contained
within the class names. There is even a handy
[hcard generator](http://microformats.org/code/hcard/creator) to do the work for
you. Otherwise you can review the
[hcard specification](http://microformats.org/wiki/hcard). You can attach the
class name to any element so you are free to use the full power of XHTML to
display it. So now my contact details look like this:

```html
<div class="vcard">
  <a class="url fn" href="/">George Ornbo</a>
  <div class="org">Shape Shed</div>
  <a class="email" href="mailto:george@shapeshed.com">george@shapeshed.com</a>
  <div class="adr">
    <div class="street-address">22 Centre Square, 17 Hardwicks Way</div>
    <span class="locality">London</span>
    <span class="postal-code">SW18 4AG</span>
    <span class="country-name">UK</span>
  </div>
  <div class="tel">+44(0)208 1419116</div>
</div>
```

Have a look at [the example page](/examples/hcard/). You can place this XHTML in
the same page or a page anywhere on the web - it doesn't matter.

### Creating the vcard

Now I've got my contact details in semantic code I can do things with it. Like
send it to a page that will generate a vCard. This is what we use with the image
link. [Brian Suda](http://suda.co.uk) has a big Microformat brain and has
written
[code to transfer an hCard on any page into a vCard](http://suda.co.uk/projects/X2V/).
Amazing. So to generate a vCard from my XTHML page I just send the details to
the script with the link:
http://suda.co.uk/projects/X2V/get-vcard.php?uri=/examples/hcard/. The user
doesn't care of course and they get my contact details in just one click.

[![Add me to your address book](/images/articles/hcard_example.jpg "Add me to your address book")](http://suda.co.uk/projects/X2V/get-vcard.php?uri=/examples/hcard/)

### Amazed? This is just the beginning

Using Microformats in your code is a great way to give people access to your
data without building a full scale API. I believe we are just seeing the
beginning of some amazing uses of Microformats that will allow relative novices
to publish, manipulate and work with data published with just the power of HTML.
Who needs a database?

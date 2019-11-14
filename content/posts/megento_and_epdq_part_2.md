{
  "title": "Magento and ePDQ - Part 2",
  "slug": "megento-and-epdq-part-2",
  "date": "2009-03-24T00:00:00+00:00",
  "description": "Having successfully set up a Magento install I have now moved onto integrating ePDQ with Magento. I discovered there is no off the shelf gateway available for ePDQ so I had to write my own. ",
  "tags": [
    "ePDQ",
    "Magento"
  ]
}

If you are looking for a payment gateway for ePDQ I'm not releasing my module commercially but there is now an <a href="http://www.magentocommerce.com/extension/2050/barclaycard-epdq-cpi-payment-module">offical ePDQ module available</a>

## No ePDQ module available

After the initial excitement that an [ePDQ module][1] was available for Magento this turned out not to be true. The module stopped development a couple of versions ago so is no longer compatible with the latest version of Magento.

## Steep learning curve

Developing for Magento is not straightforward. I had thought that a working knowledge of the [Zend Framework][2] would stand me in good stead but the Magento developers have extended this framework to bring some excellent features into play. These are not really documented anywhere however so I had to pick my way through a fair bit of source code to understand how Namespacing and the configuration setup worked for modules.

I used the Wiki article on creating a [Custom Module with Custom Database Table][3] and also used the excellent Module Creator available on that page. This set up a bare bones module and also helped me to understand how Magento works.

## Hacking an ePDQ module

I worked through the PayPal module and within a couple of days understood how Magento manages code and also front end templates. I have to confess that this was a bit painful at times. There isn't a great deal of documentation available other than the [phpDocs][4]. Coming from a product like [ExpressionEngine][5] the forums are much less busy so I found a couple of questions I had went unanswered.

## ePDQ support

On the ePDQ side the supporting documents are pretty good, although the support model relies on speaking to a developer at ePDQ. I found the support excellent once they did respond to my enquiries, but that it did take a little time. I wonder why they don't have forums where users can help each other out? I was incorrect in part one of this series that ePDQ doesn't have a sandbox available. Once I requested one this was set up pretty quickly.

## A working module

So now I have a working module that I've shown to the client and that they are happy with. With a bit of tarting up I might even package it up as a product.

## Impressed with Magento

Now that I've got my head around the architecture and namespacing (which is an great extension to PHP's native capabilities) I'm very impressed with Magento. For an Open Source project it is highly customisable and extendible. I'm now moving onto working with the client to define a structure for their products. I'll post about this process shortly.

My impressions so far are that even a relatively experienced PHP coder will need to take a day or so to become familiar with the architecture and setup of Magento. Once the learning curve is over it seems a very powerful piece of kit.

 [1]: http://www.magentocommerce.com/extension/530/barclays-epdq/
 [2]: http://framework.zend.com/
 [3]: http://www.magentocommerce.com/wiki/custom_module_with_custom_database_table
 [4]: http://docs.magentocommerce.com/
 [5]: http://expressionengine.com/

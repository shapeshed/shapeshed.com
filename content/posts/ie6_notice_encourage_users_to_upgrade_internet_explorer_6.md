+++
date = "2009-07-28T00:00:00+01:00"
description = "IE6 is evil and must die so I've created IE6 Notice a 2kb JavaScript file that adds a notice to sites encouraging users to upgrade from IE6. "
slug = "ie6-notice-encourage-users-to-upgrade-internet-explorer-6"
tags = ["Browsers", "Microsoft", "Web Standards"]
title = "IE6 Notice - Encourage users to upgrade IE6"
+++

## What it is

IE6 Notice adds a notice for IE6 users encouraging them to upgrade their
browser. Users may choose to hide the notice and their preference will be
remembered.

<iframe width="560" height="315" src="https://www.youtube.com/embed/xF2-QbP8Z1k" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## How to use it

Adding the notice to your site just requires you to include a single 2kb
JavaScript file in your HTML. Copy the following and paste it before the closing
body tag of your HTML. If you'd rather not include a remote JavaScript file on
your site you can [download the source][1] and host it locally.

<!-- prettier-ignore -->
```html
<!--[if IE 6]>
<script type="text/javascript" src="http://shapeshed.github.com/ie6-notice/ie6notice-1.0.0.min.js"></script>
<![endif]-->
```

## Find out more

There's a [dedicated page for IE6 Notice][2]. You can also [grab the source][1]
from Github - it is licensed under an [Apache License 2.0][3]

[1]: http://github.com/shapeshed/ie6-notice/
[2]: http://shapeshed.github.com/ie6-notice/
[3]: http://www.apache.org/licenses/LICENSE-2.0.html

{
  "slug": "expressionengine-plugin-friendly-404-pages",
  "title": "ExpressionEngine plugin - Friendly 404 pages",
  "date": "2008-11-01T00:00:00+00:00",
  "description": "I've written a simple plugin for ExpressionEngine that suggests valid pages to users based on the final segement of a 404 page.",
  "tags": [
    "ExpressionEngine",
    "PHP"
  ]
}
## Where am I?

ExpressionEngine [can serve 404 pages][1] but once the user reaches the 404 page there isn't much to help them recover from the error. You could of place a [simple search form][2] in the template but wouldn't it be quicker if we could do it for the user?

## How it works

The plugin works by looking at the final segment of the 404 URI. For example http://www.yourdomain.com/about-us/products might be an invalid address which serves a 404 page. By using the plugin on your 404 templates ExpressionEngine will look for pages matching "products". If a match is found it will be suggested to the user. A simple usability improvement.

## Plugin and documentation

The plugin is available on [Google Code (ss-friendly-404 in Featured Downoads)][3] and [documentation ][4]is available there. There is also a thread on the [EE Forums][5].

 [1]: http://expressionengine.com/docs/general/throttling.html
 [2]: http://expressionengine.com/docs/modules/search/simple.html
 [3]: http://code.google.com/p/shapeshed-ee-addons/
 [4]: http://code.google.com/p/shapeshed-ee-addons/wiki/Friendly404Plugin
 [5]: http://expressionengine.com/forums/viewthread/92908/

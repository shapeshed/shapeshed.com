+++
date = "2011-04-18T00:00:00+01:00"
description = "A walkthrough on how to create and deploy a basic site with Node.js and the Express framework. Examples of generating an express site, how to use templating and styles, creating basic routes and deploying the app to the Internet."
lastmod = "2016-10-24T00:00:00+00:00"
slug = "creating-a-basic-site-with-node-and-express"
tags = ["Node.js", "JavaScript"]
title = "Creating a basic site with Node.js and Express"
+++

## What we are going to do

This walkthrough will go over setting up a basic site using [Node.js][4] and
Express. The walkthrough is aimed at beginners exploring Node.js as I've had
many questions from friends and colleagues about creating and deploying node
apps. If you are not a beginner the article probably won't be of much use to
you. We are going to use [express][1], an excellent web framework for node
created by [TJ Holowaychuk][2] who seems to be pumping out Node.js libraries
like he was ten men.

Here is [the site][13] we are going to create. You might also want to grab the
[source code][18].

[![Example Express website][31]][13]

## Setup

First we need to setup our development environment. If you are on OSX I've
[covered how to setup Node.js and npm on OSX][5] in a previous article. If you
haven't got everything installed follow that article.

If you are on Linux there are plenty of [articles on Google][6].

For Windows users there are also [resources on Google][7] but it is a bit more
tricky.

## Prerequisites

If everything has installed ok you should now have Node.js and npm running on
your machine. At the terminal type `node -v` and `npm -v` and you should see
something like:

```sh
node -v
v6.7.0
npm -v
3.10.8
```

## Create an Express site

Still with me? We've covered a lot already! Now let's create an Express site.

First let's install express

```sh
npm install -g express-generator
```

You may find that you get a permissions error. If this is the case rerun the
command with `sudo`.

```sh
sudo npm install -g express-generator
```

The `-g` flag means that you are installing express globally on your system.

Now we can create an express application.

```sh
express -c stylus express_example
```

The `-c` states that we want to use stylus for css. You should see the following
output:

```sh
create : express_example
create : express_example/package.json
create : express_example/app.js
create : express_example/public
create : express_example/routes
create : express_example/routes/index.js
create : express_example/routes/users.js
create : express_example/views
create : express_example/views/index.jade
create : express_example/views/layout.jade
create : express_example/views/error.jade
create : express_example/bin
create : express_example/bin/www
create : express_example/public/javascripts
create : express_example/public/images
create : express_example/public/stylesheets
create : express_example/public/stylesheets/style.styl

install dependencies:
 $ cd express_example && npm install

run the app:
 $ DEBUG=express_example:* npm start
```

As per the instructions you'll need to install dependencies so do this

```sh
cd express_example && npm install
```

This will install packages and you will see a lot of output. When this is
complete you can boot your application.

## Boot the app

That's all the setup you need. Phew. Now you can boot the app. If you are on OSX
or Linux use the following command.

```sh
DEBUG=express_example:* npm start
```

If you are on Windows use the following command.

```sh
set DEBUG=express_example:* & npm start
```

You should see `Express server listening on port 3000` and if you open
[http://127.0.0.1:3000][39] you'll see the default Express page.

## Using Git

[Git][8] is a version control system that is used heavily in the Node.js
ecosystem, particulary with [Github][9]. If you aren't familiar with Git [Scott
Chacon][12] is your go-to man. He's written extensively and eloquently on Git
for beginners and experts. Checkout [Gitcasts][10] for if you are a beginner and
[ProGit][11] for more advanced stuff. We are going to use git to version our
site and publish it so let's set up our repo now. If your Express server is
still running hit CTRL + C to stop it.

```sh
git init
echo 'node_modules' > .gitignore
git add .
git commit -m 'initial commit'
```

## Developing Node.js sites

Normally when you develop a Node.js site you'll need to restart your application
each time you make a change. Thankfully our home-grown British JavaScript genius
[Remy Sharp][24] has solved this problem with [nodemon][25]. Nodemon will reload
your application each time it changes so you don't need to restart it. If you
have used [Shotgun][26] for Ruby with [Sinatra][36] it is similar to that. To
install run

```sh
npm install -g nodemon
```

Then you can start your app with

```sh
DEBUG=express_example:* nodemon
```

Nodemon automatically looks in your project setting to find the appropriate
files and setting to start your server. If this does not work try:

```sh
DEBUG=express_example nodemon npm start
```

Using nodemon means you don't have to restart your app each time you make a
change. For more infomation on nodemon see the [README][27]

## HTML in Express

Express is agnostic as to which templating language you use. Templating
languages can be a hot topic of debate but for this article I'm going to use
[jade][19]. If you've used [haml][28] it is similar to that. In the example we
use jade to setup a layout template.

```sh
doctype
html
  head
    title= title
    link(rel='stylesheet', href='/stylesheets/style.css')
    link(rel='stylesheet', href='/stylesheets/chunkfive-fontface.css')
  body
    header
      nav
        ul
          li
            a(href="/") Home
          li
            a(href="/about") About
          li
            a(href="/contact") Contact
    section#wrapper
        block content
        footer
          section.css-table
            section.four-column
              section.cell
                p Mauris porttitor <br />felis eu leo aliquet<br /> ac rutrum odio aliquet
              section.cell
                p Mauris porttitor <br />felis eu leo aliquet<br /> ac rutrum odio aliquet
              section.cell
                p Mauris porttitor <br />felis eu leo aliquet<br /> ac rutrum odio aliquet
              section.cell
                p Mauris porttitor <br />felis eu leo aliquet<br /> ac rutrum odio aliquet
```

Save this file as `/views/layout.jade` overwriting the file created by the
generator. This is a common template we can reuse. The line `block content`
pulls in content from the page it is used on. Express also supports variables
that you pass through to the template. In this case we pass the title variable.
If you are coming from Sinatra this will be familiar to you. If you are not I
recommend consulting the [Express documentation][29].

## CSS in Express

Again Express is agnostic to what you use to generate your CSS - you can use
vanilla CSS but for this example I'm using [Stylus][20]. This is very similar to
[Sass][30] and supports variables, mixins, functions and more. I really like it!
Here's an example from our stylesheet

```css
body
  font 62.5%/1.5  Helvetica, Arial, "Lucida Grande", "Lucida Sans", Tahoma, Verdana, sans-serif
  text-align center
  background #000

#wrapper
  width 920px
  text-align left
  margin-left auto
  margin-right auto
  background #fff
  padding 20px
  border-bottom-radius(15px)
```

You'll see that stylus is very terse - you don't need brackets or commas.

## Routing in Express

Routing is similar to [Sinatra][36], allowing you to set up RESTful routes.

In this example we setup three routes in [routes/index.js][38]

```javascript
var express = require("express");
var router = express.Router();

router.get("/", function (req, res) {
  res.render("index", {
    title: "Home",
  });
});

router.get("/about", function (req, res) {
  res.render("about", {
    title: "About",
  });
});

router.get("/contact", function (req, res) {
  res.render("contact", {
    title: "Contact",
  });
});

module.exports = router;
```

See the [Express documentation][37] for more.

## Publishing your site

We've now developed a basic Node.js site using express and we want to host it
somewhere. Publishing the site to [Heroku][14] is free and you can be up and
running in no time. You can sign up for an account at [Heroku][14] for free and
then install the [toolbelt][40].

Then you can use the command line tools to create a site on Heroku and publish
it.

```sh
heroku apps:create
git push heroku master
```

After some output you should see that your application is deployed and a line
with the url of your application. Copy and paste the URL and open it in your
browser. You should see your application deployed on the Internet.

```sh
remote:        https://[yoururl].herokuapp.com/ deployed to Heroku
```

## Conclusion

This article has showed how to create a very basic site using Node.js and
Express. It has introduced a number of things from the Node.js ecosystem and
showed you how to deploy the app to Nodester.

The strengths of Node.js as a technology are not so much in building static
websites like this. I encourage you to explore some of the Node.js libraries to
see what it can do. Particularly for real-time applications Node.js is extremely
exciting and I think we'll see some great apps built on Node.js. Try starting
with [socket.io][22] for a taste of what to expect.

If you find any inaccuracies in the post [send me an email][23] and I'll update
the post.

## Further reading

- [Node.js][4]
- [express - node web framework][1]
- [npm - node package manager][3]
- [jade - Node.js templating language][19]
- [stylus - Node.js css framework][20]
- [Setting up Node.js and npm on Mac OSX][5]
- [Source code for this article][18]

[1]: http://expressjs.com/
[2]: http://tjholowaychuk.com/
[3]: http://npmjs.org/
[4]: http://nodejs.org/
[5]: /setting-up-nodejs-and-npm-on-mac-osx/
[6]: http://www.google.com/search?q=install+node.js+linux
[7]: http://www.google.com/search?q=install+node.js+windows
[8]: http://git-scm.com/
[9]: https://github.com/
[10]: http://gitcasts.com/
[11]: http://progit.org/
[12]: http://scottchacon.com/
[13]: http://express-tutorial.herokuapp.com/
[14]: http://www.heroku.com/
[15]: http://chrismatthieu.com/
[16]: https://www.youtube.com/watch?v=IMCXbrI_Ygk
[17]: http://express_example.nodester.com
[18]: https://github.com/shapeshed/express_example
[19]: http://jade-lang.com/
[20]: http://stylus-lang.com/
[21]: http://nodester.com/api.html
[22]: http://socket.io/
[23]: /contact/
[24]: http://remysharp.com/
[25]: https://github.com/remy/nodemon
[26]: https://github.com/rtomayko/shotgun
[27]: https://github.com/remy/nodemon/blob/master/README.md
[28]: http://haml-lang.com/
[29]: http://expressjs.com/guide.html
[30]: http://sass-lang.com/
[31]: /images/articles/express_example.jpg
[32]: http://www.nodejitsu.com/
[33]: https://no.de/
[34]: http://www.cloudfoundry.com/
[35]: http://www.duostack.com/
[36]: http://www.sinatrarb.com/
[37]: http://expressjs.com/guide.html#routing
[38]: https://github.com/shapeshed/express_example/blob/master/routes/router.js
[39]: http://127.0.0.1:3000/
[40]: https://toolbelt.heroku.com/

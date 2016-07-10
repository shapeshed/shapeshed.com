{
  "title": "Continuously deploy Node apps with GitHub, Travis and Heroku",
  "date": "2013-12-10T08:08:29+00:00",
  "description": "GitHub, Travis and Heroku make it simple to build a continuous deployment pipeline for Node.js applications. Here is a walkthrough.",
  "tags": [
    "Node.js",
    "JavaScript"
  ]
}

## Heroku has WebSockets

Back in October Heroku announced that [WebSockets are now in public beta][14]. This had been a blocker for many Node.js developers using the platform so was great to see. By all accounts the service has been really good and comes with one of Heroku's best features - it is free to play and experiment. This is particularly useful for quick prototypes of hacks days that you want to bring up quickly then potentially trash.

This article will detail how to build a pipeline that will continuously deploy a Node.js application to Heroku via GitHub for source control and Travis CI for Continuous Integration. 

For the purpose of this article we'll use a simple [Express application][2] created for a [walkthrough on creating a basic Express application][3]. It has one test!

## GitHub

I'm assuming you know what [GitHub][15] is. You'll need an account and a Node.js application as a Git repository hosted on GitHub. You know what to do here.

## Travis CI

[Travis CI][16] is a Continuous Integration Service that is free for Open Source projects. It supports a range of languages including Node.js and also have offers private Continuous Integration for a fee. It is a first class service and I highly recommend it. To create an account you just sign in with your GitHub account - easy! You'll need to authorise Travis to access your GitHub account but after that you are done. 

In the top right hand corner you'll be able to view your GitHub accounts where you can flip the switch for use Travis on a repository.

Travis needs to know about your application so you need to add a new `.travis.yml` file to the root of your git repository. For Node.js it looks like this.

    language: node_js
    node_js:
      - "0.10"

Note you can run tests against a range of Node.js versions by specifying the versions you want. By default Travis will run the `npm test` command so make sure you set this up in your package.json file. If you are using [Mocha][4] it looks like this. 

    "scripts": {
      "test": "./node_modules/mocha/bin/mocha"
    }

Travis uses a [RubyGem][7] for some functions. RubyGems is Ruby's central repository and Ruby's npm while Gems are modules. You can install the Travis gem with

    gem install travis

If you need to install RubyGems there are [instructions here][8].

## Deploying to Heroku

To deploy to [Heroku][5] you need an account and you also need to install the heroku gem on your system. Once you have logged in create an application. You will also need the [Heroku toolbelt][6]. This installs everything you need to interact with the Heroku platform. There are full instructions for installing on all platforms on the site.

Once you've installed the toolbelt open a terminal and login.

    heroku login

With heroku and the travis gem install you can now add an encrypted version of your heroku api key to your `.travis.yml` file

    travis encrypt $(heroku auth:token) --add deploy.api_key

This will add some lines to your `.travis.yml` file. Open it up and you should see something like

    deploy:
      api_key:
        secure: FF7yK....

By default Travis will try to deploy to a Heroku application with the same name as your git repository. If you Heroku application is called something different you can edit the `.travis.yml` file and change it. You also need to add the provider as 'heroku'.

    deploy:
      app: express-example
      provider: heroku
      api_key:
        secure: FF7yK....

Commit the file to your git repository and push the file up to GitHub.
    
## The build and deployment pipeline

Now everything is set up here is the process flow of the build and deployment pipeline.

* Hack, hack, hack
* Git Commit Locally
* Git Push to GitHub
* A build is triggered on Travis
* If tests fail nothing happens
* If tests pass a deployment to heroku is triggered
* Your app is deployed to heroku by travis

## Getting fancy with branches

Travis is also aware of branches so if you want to deploy to different Heroku sites (say for staging and production) you can also configure this. To do this update your `travis.yml` file with the name of the branch and the heroku application to deploy to. 

    app:
      master: my-app-staging
      production: my-app-production

## Conclusion

With very little effort you can create a Continuous Deployment pipeline with GitHub, Travis and Heroku. There are other PaaS providers that support deploying from Heroku including [AppFog][17] and [Nodejitsu][18] so if you would rather not install the additional dependencies required by Heroku you may wish to look at them. At the time of writing AppFog offer a free service for up to 8 applications and Nodejitsu offer free hosting for Open Source projects.

Continuous Deployment removes the requirement to do any DevOps from you as a developer. It ensures that your application can only be deployed if your tests pass and you can even use branching to create a process for reviewing changes before they are released into the production branch. Deploying your application just becomes a git push. It is so simple why wouldn't you do it?

## Resources

* [Example application on Heroku][19]
* [Getting started with Node.js on Heroku][13]
* [Heroku Deployment on Travis][9]
* [Travis page for Example Project][10]
* [GitHub repo for Example Project][11]

[1]: https://blog.heroku.com/archives/2013/10/8/websockets-public-beta
[2]: https://github.com/shapeshed/express_example
[3]: https://shapeshed.com/creating-a-basic-site-with-node-and-express/
[4]: http://visionmedia.github.io/mocha/
[5]: https://www.heroku.com/
[6]: https://toolbelt.heroku.com/
[7]: https://rubygems.org/
[8]: https://rubygems.org/pages/download
[9]: http://about.travis-ci.org/docs/user/deployment/heroku/
[10]: https://travis-ci.org/shapeshed/express_example
[11]: https://github.com/shapeshed/express_example
[12]: https://github.com/shapeshed/express_example/blob/master/Procfile
[13]: https://devcenter.heroku.com/articles/getting-started-with-nodejs
[14]: https://blog.heroku.com/archives/2013/10/8/websockets-public-beta
[15]: https://github.com
[16]: https://travis-ci.org/
[17]: https://www.appfog.com/
[18]: https://www.nodejitsu.com/
[19]: http://express-tutorial.herokuapp.com/

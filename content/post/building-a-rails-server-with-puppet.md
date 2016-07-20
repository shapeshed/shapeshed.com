{
  "title": "Building a Rails server with Puppet",
  "date": "2011-06-22T00:00:00+01:00",
  "description": "A short write up of my experience learning and configuring Puppet to build and manage servers to serve Rails applications.",
  "tags": [
    "Puppet",
    "UNIX",
    "Ruby",
    "Rails"
  ]
}

## The goal

On a regular basis at [pebble.code][21] where I work we have a requirement to provision servers for clients, mostly for Rails apps. In the past we have used a combination of Cloud PaaS providers like [Heroku][22] or [Engine Yard][23], we have built servers manually (gasp) or used bash scripts. 

[Puppet][20] is a tool for building and managing servers and looked like a great fit for our requirements. 

## Learning curve

Puppet has a learning curve but there are lots of excellent resources available on the web. I found [Pulling Strings With Puppet][1] to be an excellent resource and there is also some [good documentation][2] on the Puppet site. I've written before on how to [set up Puppet on Ubuntu 10.04][3] and also how to [connect clients to a Puppet master][4]. 

Once you learn about [resources][13] and [modules][14] you are pretty much ready to get going.

## Setting up Puppet Dashboard

Puppet comes with a dashboard that can be run on the Puppet Master to give a graphic view into what your nodes are doing, providing reports of updates and letting you know if there are any problems. There's some good documentation [offered by PuppetLabs][18] on this to get you started.

I had some problems getting this going getting the error 

    can't activate rack (~> 1.0.1), already activated rack-1.2.2

[This thread][15] on the puppet-users mailing list gives a fix

    cd <path-to-dashboard> 
    git clone git://github.com/puppetlabs/puppet-dashboard.git 
    rm -r vendor/gems/rack-1.0.1 
    sed -i -e 's,~> 1.0.1,~> 1.2.2,' vendor/rails/actionpack/lib/action_controller.rb 

After that I was able to see the nodes and updates.

![Puppet Dashboard][19]

## Rails stack choices

Then came the hard part - creating Puppet modules and using third party ones to install software on the server. I ended up writing my own for some but used existing modules where possible. 

The ones I found most useful in building a Rails stack were

* [puppet-rvm][7]
* [puppet-nginx][8]
* [puppetlabs-mysql][9]
* [puppet-monit][10]

One issue is where to put the responsibility for some items in the stack. The web server is a good example. In my case I chose to use Unicorn and manage the installation of this via [bundler][11] and the Gemfile of the application.  I could have chosen to use Puppet for this with something like Passenger. For automation Passenger is difficult to upgrade as it needs to be recompiled against Apache or Nginx. By chosing Unicorn I can upgrade it easily using bundler. To manage Unicorn I use an [init][12] script and hook this up to Monit and capistrano recipes. I'm still not sure about this approach but it works at least. 

## Switching the Puppet Master to Unicorn

As the number of nodes grew, and particularly where a new node was added I found that the default WEBrick server that ships with Puppet was not good enough and I started to hit some errors. Thankfully there is an [excellent wiki article][5] on the Puppet Labs site walking through how to switch Puppet to using [Unicorn][6]. Unicorn is a great web server and handles load balancing itself - perfect for my requirements.

## Workflow

I chose to deploy using Capistrano and a git based workflow. I have an init script for the Unicorn Master powering Puppet so I can take advantage of the rolling restarts offered by Unicorn. 

## Still to do...

I still need to create a good framework for testing. Currently I run things against a blank VM. There are a [few][17] [patterns][16] for testing which I would like to become a bit more familiar with and use. I'd like to extend a few existing modules and write a few new ones, particularly for user management. 

## The good bit

The good bit is that we can now create a secure, bootstrapped server that can host any rack application with any cloud provider within about 20 minutes. Moreover we can manage SSH keys with Puppet so it is easy to grant and revoke developer access. 

There's more to learn but in my opinion the investment of time was well worth it.

After reading this article [Matt Tanase][25] contacted me about a great project called [Blueprint][24]. If you are porting existing infrastructure to Puppet have a look.

[1]: http://www.amazon.com/Pulling-Strings-Puppet-Automated-Administration/dp/1590599780
[2]: http://docs.puppetlabs.com/
[3]: https://shapeshed.com/setting-up-puppet-on-ubuntu-10-04/
[4]: https://shapeshed.com/connecting-clients-to-a-puppet-master/
[5]: http://projects.puppetlabs.com/projects/1/wiki/Using_Unicorn
[6]: http://unicorn.bogomips.org/
[7]: https://github.com/blt04/puppet-rvm
[8]: https://github.com/jfryman/puppet-nginx
[9]: https://github.com/puppetlabs/puppetlabs-mysql
[10]: https://github.com/deck/puppet-monit
[11]: http://gembundler.com/
[12]: https://gist.github.com/750379
[13]: http://docs.puppetlabs.com/learning/ral.html
[14]: http://docs.puppetlabs.com/learning/modules1.html
[15]: http://groups.google.com/group/puppet-users/browse_thread/thread/1cd0d79a33ff9c0e
[16]: http://docs.puppetlabs.com/guides/tests_smoke.html
[17]: http://projects.puppetlabs.com/projects/1/wiki/Branch_Testing
[18]: http://docs.puppetlabs.com/guides/installing_dashboard.html
[19]: https://shapeshed.com/images/articles/puppet_dashboard.jpg
[20]: http://puppetlabs.com/
[21]: http://pebblecode.com/
[22]: http://www.heroku.com/
[23]: http://www.engineyard.com/
[24]: https://github.com/devstructure/blueprint
[25]: http://howradical.com/

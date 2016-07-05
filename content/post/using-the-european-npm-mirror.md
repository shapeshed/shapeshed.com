{
  "layout": "post",
  "title": "Using the European npm mirror",
  "date": "2014-01-09T15:39:41+00:00",
  "description": "If you are located in Europe the European npm mirror is fast and reliable. With a few tweaks you can easily publish to the main registry too.",
  "tags": [
    "JavaScript",
    "Node.js"
  ]
}

The mighty [Maciej Malecki][1] created a [European npm mirror][2] for all the Node.js developers this side of the Atlantic. It is much faster to install packages from and takes some load off the main registry. 

Here are some stats&trade; on installing the yeoman-generator module.

    npm install --registry http://registry.npmjs.org yeoman-generator  10.09s user 1.62s system 47% cpu 24.473 total
    npm install --registry http://registry.npmjs.eu yeoman-generator  6.10s user 1.11s system 34% cpu 20.903 total

So 6.10 seconds in Europe, 10.09 seconds from the main registry. Four seconds faster.

You can start using the European mirror right away by running a single command.

    npm config set registry http://registry.npmjs.eu 

This will update your `.npmrc` to include the following line

    registry = http://registry.npmjs.eu/

Now when you run `npm install` if you haven't disabled verbose logging you'll see the http calls going out to the European mirror.

    npm http GET http://registry.npmjs.eu/argparse
    npm http GET http://registry.npmjs.eu/glob
    .. 

## Publishing

You cannot publish to the European mirror - it is read only. This means there is a little bit of work to do when you want to publish a module. There are a couple of ways to achieve this. You can simply specify the registry when you publish

    npm publish --registry http://registry.nodejs.org

Or you can set this in your `package.json` file

    "publishConfig": {
      "registry":"http://registry.npmjs.org/"
    }

## nrm

If you frequently want to switch modules the [nrm][4] module may help.

    $ nrm ls

    * npm ---- https://registry.npmjs.org/
      cnpm --- http://r.cnpmjs.org/
      eu ----- http://registry.npmjs.eu/
      au ----- http://registry.npmjs.org.au/
      sl ----- http://npm.strongloop.com/
      nj ----- https://registry.nodejitsu.com/

    $ nrm use cnpm  //switch registry to cnpm

Thanks to [hemanth.hm][5] for this tip.

## Conclusion

If you are in Europe enjoy a faster, sexier npm experience by switching to the European registry! You can also bask in the warm glow of being a good npm citizen by taking some load off the main repository.

Given [CouchDB][3]'s excellent replication capabilities it would be nice to see more mirrors popping up. You could even write a proxy in front of the mirrors to make sure you always have a service available. 

[1]: http://mmalecki.com/
[2]: http://npmjs.eu/
[3]: https://couchdb.apache.org/
[4]: https://www.npmjs.org/package/nrm
[5]: http://www.h3manth.com/

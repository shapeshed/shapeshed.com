{
  "slug": "thoughts-on-yarn",
  "title": "Thoughts on yarn",
  "date": "2016-10-13T01:00:00+00:00",
  "description": "Yarn announced itself as a new package manager for JavaScript. In fact is a better npm client but its release suggests that change may be coming to JavaScript package management with issues of security and centralisation up for debate.",
  "tags": [
    "JavaScript",
    "Opinion"
  ]
}

## Yarn is a better npm client

Yarn announced itself at [a new package manager for JavaScript][6]. Eventually the project may look at creating a registry but for now it is simply a better npm client. It is a drop in replacement for the official npm client and offers a global cache and better parallelisation. From my crude tests and anecdotal reports from friends and colleagues it is much faster and more efficient than the standard npm client. 

The problems outlined in the announcement are largely related to deployment and scaling the npm client in enterprise settings. Yarn seems to have re-solved some of the problems that the npm client has already addressed. Switch npm-shrinkwrap for a lockfile for example. It seems a shame that there was no aspiration to contribute to the open source npm client but multiple clients are no bad thing. 

Given developers want reliability and speed if the yarn project can succeed in improving download speeds and reliability I fully expect it to become the default. More interesting for me is that yarn is an expression that not everything is rosy in the JavaScript package management ecosystem.

## Tiny modules exploding

It is indisputable that [npm][2] has been a runaway success. The platform has seen explosive growth, has scaled and has become a daily tool for software developers.

<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">npm users downloaded 1.4 billion packages in the last 7 days, 5.2 billion in the last 28 days, and 48 billion in the last 365 days. <a href="https://t.co/pXaPTB6s1p">pic.twitter.com/pXaPTB6s1p</a></p>&mdash; Laurie Voss (@seldo) <a href="https://twitter.com/seldo/status/781716700618260482">September 30, 2016</a></blockquote>

<script async src="//platform.twitter.com/widgets.js"></script> 

150 new authors are now publishing packages every day. 

<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">This is a graph of how many people publish a package to npm for the very first time, per day -- 150-200 new authors per day! <a href="https://t.co/MEBY1qNFTJ">pic.twitter.com/MEBY1qNFTJ</a></p>&mdash; Laurie Voss (@seldo) <a href="https://twitter.com/seldo/status/783811524498296832">October 5, 2016</a></blockquote>

<script async src="//platform.twitter.com/widgets.js"></script>

The explosive growth is not surprising given that small modules are favoured over large monolithic code bases but the growth is indisputable and impressive. The npm service has matured to become stable and able to scale.

## Tiny modules, big dependency trees

The Node.js ecosystem has promoted writing tiny modules. Along with the upside of tiny reusable modules comes massive dependency trees. Have a look at the [yarn][1] dependency graph as an example. 

![Yarn dependency tree][14]

I have seen the large dependency trees cause build servers to lock up or fail which is frustrating when you are trying to ship code. Furthermore package versioning can lead to brittle builds if you do not specify exact versions or use npm shrinkwrap. 

With so many tiny userland modules there are issues of modules authors not following semantic versioning or just removing packages. One such example is [left-pad][3] a 52 line module for left padding a string. This module was [removed from the registry][4] by the author breaking deployment pipelines and a number of major projects that depended on it. The package was later restored and [the fallout][5] documented by npm. This incident led to many running their own npm cache to mitigate against deployments being disrupted.

## Being centralised is a problem

The history of npm is one moving from a hobby project and one of the original Node.js package managers. Remember [kiwi][9] anyone? npm eventually became the default choice and coupled with [Isaac Schlueter][10] taking over as the benevolent dictator of the Node.js project it became official. 

The npm project then took [$2.6 Million in seed funding][11] and became a for-profit organisation whilst maintaining an open source approach. This has been universally good for the Node.js ecosystem but has resulted in one for-profit organisation owning the hosting of the registry. The npm team have done a fantastic job in scaling the registry and maintaining an excellent service but I can't help feeling that the release of yarn is an expression that this model is less than perfect.

Far better for me would be to have a decentralised registry that allows replication and mirroring around the world similar to the way major Linux distributions run their registries. This reduces reliance one on single registry provider and reduces issues of scale. Packages are verified by checksums and signing so files can be hosted and downloaded from anywhere. Far from ruining npm's business model I feel there would still be opportunities to offer private registries and generate revenue. Perhaps we are too far down the road now though.

## Security is still a problem

Whilst npm does perform sha1sum checking packages are unsigned. Often authors will declare dependencies with a greater than syntax. Using something like `~1.2.3` will install anything greater than 1.2.3 and less than 1.3.0. As such it would be quite feasible for an npm author account to be compromised and for a new package version to be released that is less than 1.3.0. This version would proliferate around project installs, build servers and production sites as `npm install` is run.

A package `rimfafall` was released to [highlight this issue][7] but the conclusion was 'You are responsible for what you require'. With dependencies trees reaching to tens of thousands of modules this simply isn't feasible.

Whilst signing packages [has been discussed][8] it has not progressed so package installers are still vulnerable to an npm account being compromised. 

## Understanding licensing is a problem

A while back I was asked to perform an audit on a relatively small project for an large enterprise who were interested in understanding the Open Source licences used in a project. There are [packages][12] [available][13] to output this information. Let us suppose that an organisation requires that no GPL licenses are used in a project. Given the epic dependency trees of projects it is very hard to know this and unless you lock versions of packages you install this can change as you run `npm install`.

## Conclusion

Currently yarn is just a better npm client. The registry it uses is just a proxy to the main npm registry but the fact it does not point to the npm registry directly suggests that there may be some aspiration to include reworking the registry in the project.

The announcement of yarn is an expression of the maturity of JavaScript, Node.js and npm. Seen as a better npm client it offers a drop in replacement to resolve a number of issues experienced at scale. Seen as an expression that npm is not perfect it opens up potential flux and innovation in JavaScript package management. I would love to see package signing and a distributed registry addressed. Until then security and a single organisation owning the distribution of packages remain problems waiting to happen. 

[1]: http://npm.anvaka.com/#/view/2d/yarn
[2]: https://www.npmjs.com/
[3]: https://github.com/stevemao/left-pad/blob/master/index.js
[4]: http://www.theregister.co.uk/2016/03/23/npm_left_pad_chaos/
[5]: http://blog.npmjs.org/post/141577284765/kik-left-pad-and-npm
[6]: https://code.facebook.com/posts/1840075619545360/yarn-a-new-package-manager-for-javascript/
[7]: https://blog.liftsecurity.io/2015/01/27/a-malicious-module-on-npm
[8]: https://github.com/node-forward/discussions/issues/29
[9]: https://github.com/ciaranj/kiwi
[10]: http://blog.izs.me/
[11]: http://blog.npmjs.org/post/76320673650/funding
[12]: https://www.npmjs.com/package/nlf
[13]: https://github.com/marcello3d/node-licensecheck
[14]: /images/articles/yarn-dependencies.png "Yarn dependency tree"

---
title: What's wrong with scalenpm.org
date: '2013-12-04T10:50:00+00:00'
tags: []
author: George Ornbo
original: http://pebblecode.com/blog/whats-wrong-with-scalenpm-org/
---
<h3>npm is amazing</h3>

<p>Without doubt <a href="https://npmjs.org/">npm</a> is the best package manger I have used. As an end user it is a delight to use and makes sharing code extremely simple. I have used a range of package managers including PEAR, pip, CPAN, RubyGems and most of the Linux package managers. For me npm is best in class.</p>

<h3>scalenpm.org</h3>

<p>The strength of npm as a package manager has helped drive the adoption of Node.js and with that has come some scaling issues. The service has gone down several times recently. This is bad news for deployments that rely on npm (even though it is recommended not to). It harms the credibility of Node.js at a time when adoption amongst large corporations is gathering pace. The central registry is clearly a core piece of infrastructure that underpins the success of the technology.</p>

<p>The <a href="https://scalenpm.org/">scalenpm.org</a> site outlines the problem and proposes a solution</p>

<blockquote>
  <p>We are Nodejitsu. We run the npm registry service for you.</p>

  <p>We’re a startup. We run npm because we love node and we’re very well qualified for the job. But in the last year, npm has become a giant beast of a project. We run it lean, both from an engineering and hardware perspective, because it’s just too expensive to do otherwise.</p>

  <p>We wondered, how could we possibly get the money for the hardware and engineers to do this the right way and keep it free for the community?</p>
</blockquote>

<p>The basic gist of scalenpm.org is that Nodejitsu run npm as a bare bones project and can they have some money to address the scaling issues.</p>

<p>The community has responded strongly and the funding goal of $200k has been achieved already. Clearly there are many individuals and businesses that rely on npm and value it very highly and trust Nodejitsu to be the custodian.</p>

<h3>npm and Nodejitsu</h3>

<p>Nodejitsu has been pivotal in the adoption of Node.js and has been a prolific business in publishing widely used modules to npm. They offer Node.js hosting and consulting services and are <a href="http://www.crunchbase.com/company/nodejitsu">VC funded to the tune of $2.6M</a>. The are a key business in the Node.js community and are a commercial business backed by Venture Capitalists. The mid-term goal for Nodejitsu and the smart developers with equity stakes must be to sell the business and make a return.</p>

<p>In this context the $200,000 figure requested raises some questions.</p>

<ul><li>Is the project going to be run as not-for-profit or for profit?</li>
<li>How many developers does this allocate and for how long?</li>
<li>Is there any scope to collaborate on this work?</li>
<li>Are the technical decisions up for debate?</li>
<li>Are they tied to CouchDB because of the recent acquisition of IrisCouch?</li>
</ul><p>There are areas that are not entirely transparent and other members of the Node.js community feel the same way.</p>

<blockquote>
  <p>Obviously everybody should support <a href="http://scalenpm.org">http://scalenpm.org</a>  BUT I wish there was a non-profit behind the effort, a la the @jquery foundation</p>
</blockquote>

<p><cite><a href="https://twitter.com/sambreed/status/405788913664421888">@sambreed</a></cite></p>

<blockquote>
  <p>scalenpm.org  feels to me like a crowd funded round of VC for @nodejitsu wrapped up as a benefit to the community.</p>
</blockquote>

<p><cite><a href="https://twitter.com/teabass/status/405467400344068097">@teabass</a></cite></p>

<h3>A potential scenario</h3>

<p>Let&rsquo;s explore a scenario. Microsoft want to push the adoption of Node.js and enhance the Azure platform. They buy Nodejitsu. Nodejitsu are happy as they exit. The scalenpm.org project is partially complete. Microsoft want all Nodejitsu staff to be involved with getting Nodejitsu on Azure to market as quickly as possible. The scalenpm.org project fades away.</p>

<p>This may be highly unlikely but it is possible. Whilst I highly respect Nodejitsu and generally trust them to do the right thing the fact they are a VC backed commercial business with a requirement to make a return on investment makes them a very bad choice to be the custodians. It has nothing to do with Nodejitsu and everything to do with ensuring npm maintains consistency and independence.</p>

<p>It would be quite trivial to entirely separate npm and to build a team that is funded by crowdsourcing to scale and maintain a core piece of infrastructure. This might include engineers seconded from Nodejitsu or not. For Node.js to continue to grow this team should be permanent, properly remunerated and operate transparently and openly. The current arrangement is less than that.</p>

<h3>Enterprise pressures</h3>

<p>The Node.js community is seeing pressures from reaching maturity. Companies are positioning themselves to take advantage of the increased adoption in Enterprise. <a href="http://www.joyent.com/">Joyent</a> and <a href="http://strongloop.com/">StrongLoop</a> have recently <a href="http://www.joyent.com/blog/the-power-of-a-pronoun">locked</a> <a href="http://strongloop.com/strongblog/collaboration-not-derision-in-the-node-community/">horns</a> over a pronoun but I suspect there are bigger issues at play here.</p>

<p><a href="http://www.joyent.com/blog/production-node-js-core-support-for-all">All</a> <a href="https://www.nodejitsu.com/enterprise/npm/">over</a> <a href="http://strongloop.com/strongblog/announcing-strongloop-node-1-0-ga-an-enterprise-ready-node-js-distribution/">the</a> ecosystem businesses are putting the word &lsquo;Enterprise&rsquo; around Node.js and adding zeros to their consulting rates. In no way do I have an issue with businesses making money from Open Source but the longevity of a project must not be jeopardised by outside commercial interests. If you want a case study about how things can go wrong look at any of the Open Source projects that Oracle took control off.</p>

<p>For npm (and some might argue Node.js as a whole) to achieve real credibility with the Enterprise these projects must acknowledge the support they receive from corporations but ensure that they are not beholden to them. This is not my sentiment; it is corporate IT procurement officers questioning whether npm can scale and is in safe hands, that Joyent is not pushing other players out of the market and ultimately that Node.js as a community and a technology is really enterprise ready.</p>

<p>As a community we should debate the independence of the entire project openly and democratically.  Failing to do so will lead to division, forks and a derailing of the huge impetus behind Node.js. If Node.js is really Enterprise ready the community need to demonstrate planning to show that the registry can scale, is independent and has a long term sustainable plan.</p>

<p>I&rsquo;ve seen first hand the scrutiny that a major global corporation is applying to Node.js in considering it for adoption. The perception that the registry isn&rsquo;t scalable and the manner of Joyent&rsquo;s recent communications have provided some poor PR recently and has been noted.</p>

<p>On a positive note the speed with which scalenpm.org reached the funding target shows the strength of the community. My opinion is that creating an independent team that runs and maintains npm would be the first step towards responding to difficult questions from Enterprise officers. Until very recently I had not really questioned the relationship that Node.js has with Joyent. Based on conversations with those pushing for adoption in a global corporation however recent events have brought that relationship into question. But that&rsquo;s a topic for another discussion.</p>

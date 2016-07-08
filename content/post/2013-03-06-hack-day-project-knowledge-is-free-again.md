---
title: 'Hack Day Project: Knowledge is free again'
date: '2013-03-06T09:46:31+00:00'
tags: [hacks]
author: George Ornbo
original: http://pebblecode.com/blog/hack-day-project-knowledge-is-free-again/
---
<p><img src="http://media.tumblr.com/28c3a2564a9b25655113beb15ae2630b/tumblr_inline_mj8gcmPEvf1qz4rgp.png" alt=""/></p>

<h2>The idea(s)</h2>

<p>Initially our team had two ideas. The first was to create a repository of lectures and associated data (lecturer, attendees, videos, slides) and to provide a tool for university lectures to add their resources and lectures very easily. The prospect of having access to this data spawned other ideas but the one we settled on was a topic based voting application that would allow users to vote the best content for a topic to the top.</p>

<h2>Filtering to one idea</h2>

<p>We quickly felt that we had bitten off more than we could chew so fell back to the repository for lectures application. We chose Rails for this since it is represented a reasonably classic CRUD application. John Mildinhall, our User Centred Design Specialist designed a beautiful workflow for the application that Vince and I proceeded to butcher.</p>

<h2>The name</h2>

<p>We settled initially on &lsquo;Knowledge is Free Again&rsquo; shortening this to kifa. We were reliably informed this was a racist term in some parts of the world so Vince changed it to kif, although he didn&rsquo;t realise this is hash in Morocco.</p>

<h2>Slow progress</h2>

<p>We found iterating on Rails slow progress compared to the JavaScript (Node.js and front-end) projects that we have been working on more recently. But we did have a decent workflow in place with Travis and Heroku to push changes. We implemented sign-on with Twitter using <a href="https://github.com/intridea/omniauth">OmniAuth</a> and then started adding views about 2.30pm.</p>

<h2>Largely unfinished</h2>

<p>By the end of the day we had a semi working application that we were able to demonstrate to the other teams but with much functionality incomplete. This was somewhat disappointing given the purity of John&rsquo;s vision.</p>

<p><img src="http://media.tumblr.com/dadf56adbb939366e3f0955254668d6d/tumblr_inline_mj8ge0QQqR1qz4rgp.png" alt=""/></p>

<h2>The idea in a nutshell</h2>

<p>For us the idea is still a good one. Knowledge exists in silos in different universities and there isn&rsquo;t a good way to link students and lecturers studying the same topics to resources. We felt that the application would be most useful for building other applications on top of it though. With an open JSON API if the application were used it would provide a rich data source on lectures and seminars around the world that developers could use to create all kinds of applications.</p>

<p>The source for the project is available on <a href="https://github.com/pebblecode/kifa">GitHub</a> and the somewhat half-baked demo is available at <a href="http://kifa.herokuapp.com">http://kifa.herokuapp.com</a>.</p>

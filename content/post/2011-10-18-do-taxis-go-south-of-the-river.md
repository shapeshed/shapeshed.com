---
title: Do taxis go south of the river?
date: '2011-10-18T09:49:00+01:00'
tags: [rails, ruby, projects]
author: George Ornbo
original: http://pebblecode.com/blog/do-taxis-go-south-of-the-river/
---
<p>Recently we’ve been engaged by AddApps to help with their start-up <a href="http://www.londontaxiapp.com/">LDNTaxiApp</a>.</p>
<h3>What’s the app?</h3>
<p>LDNTaxiApp is a mobile app that matches London’s Black Cabs with Londoners needing to go places. The idea is that you open the app on your mobile, hail a cab and one will magically arrive. Here are a few screenshots.</p>
<p><img src="http://media.tumblr.com/tumblr_lp3jonAWgW1qz7kgs.jpg"/></p>
<p><img src="http://media.tumblr.com/tumblr_lp3jpoGH4w1qz7kgs.jpg"/></p>
<p>The app is in the <a href="http://itunes.apple.com/gb/app/ldntaxiapp/id427543366">app store</a> and has been in production use for around 3 months with thousands of completed journeys.</p>
<h3>Prototype to production</h3>
<p>Our initial engagement was to add some new features to an existing Rails application and to work with <a href="http://uk.linkedin.com/pub/robert-redmond/13/6b4/30">Rob</a>, the lead iPhone developer, to hook everything up to the iPhone. We worked to a fast release schedule building out infrastructure along the way. Within a couple of weeks we had availability of taxis, order fulfilment and push notification messaging done.</p>
<p>Some libraries that really helped us were <a href="https://github.com/bvandenbos/resque-scheduler">resque_scheduler</a> that supported an order being swept after a period of time, <a href="https://github.com/kdonovan/apn_sender">apn_sender</a> for Apple Push Notifications and <a href="https://github.com/jlecour/geokit-rails">geokit-rails</a> for all of the geo-location calculations.</p>
<h3>Testing in the field</h3>
<p>At pebble we write automated tests for features but we weren’t able to test in the field. Some things we learned were:</p>
<ul><li>The iPhone 3GS had more network issues than other devices</li>
<li>The 3G network can be unreliable</li>
<li>Variables increase to include mobile networks, Apple’s APN network and handset hardware</li>
</ul><p>It is a much harder space to test effectively than a classic web app.</p>
<h3>Building views onto the data</h3>
<p>The team at LDNTaxiApp are amazing at listening to and contacting customers. They wanted an administration app to be able to have a view onto what was going on, how to identify problems in the process and make better decisions about the direction of the app. For us the application really came alive when we added a realtime map of the taxis available in London. As a Londoner this is fascinating. Where are the most taxis? Where do they typically go? What time of the day is most busy? This of course is all valuable data that LDNTaxiApp is building up. We could see pretty quickly though that the adage that taxis don’t go south of the river is true.</p>
<p><img src="http://media.tumblr.com/tumblr_lp3jryw2od1qz7kgs.png"/></p>
<h3>Start-ups need pragmatism</h3>
<p>Apple’s approval process is long and frustrating. Finding a bug in your iPhone client means that it is likely that your customers will continue to find the bug for two weeks before it goes through the approval process. For that reason where possible fixes were applied to the Rails application. From a software engineering point of view this is clearly a bad decision but in a business context is totally understandable.</p>
<p>Working with an existing technology stack there were areas we could see that real improvements could be made. For example reducing the reliance on MySQL for short lived data like locations and moving it to a in-memory store like <a href="http://redis.io/">Redis</a> or <a href="http://www.mongodb.org/">MongoDB</a>. With the requirement for near real-time data we also talked about moving the API to something like <a href="http://www.erlang.org/">Erlang</a> or <a href="http://nodejs.org/">node.js</a>.</p>
<p>This is all very well if you have millions of pounds of funding but in our case we had a limited budget and an app in production use that worked well. Pragmatism was the order of the day here and the realisation that for a start-up perfect technology is not as important as getting to market. Just one of the things we learned from the client.</p>
<h3>What went well</h3>
<p>The project was a strong success in terms of following an <a href="http://en.wikipedia.org/wiki/Agile_software_development">Agile</a> process. Effectively we were pair programming with Rob who was developing the iPhone app in parallel. On the few days we were not able to be physically located together fewer features were completed. Sharing knowledge between developers was key. Releasing quickly to the development server meant we could respond quickly to changes on both sides.</p>
<p>The application held up well to being featured in the <a href="http://www.thisislondon.co.uk/standard/article-23963594-black-cabs-set-up-iphone-app-to-let-you-know-where-they-are.do">Evening Standard</a> and the Sunday Times according to New Relic the database and application servers are returning good response times with high customer satisfaction rates.</p>

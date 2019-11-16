+++
author = "George Ornbo"
date = "2015-06-09T12:31:08+01:00"
original = "http://pebblecode.com/blog/hack-day-wfh-bot/"
slug = "hack-day-wfh-bot"
tags = ["hacks"]
title = "Hack Day - WFH Bot"

+++
<h2>What was problem you originally pitched?</h2>

<p>It is hard for pebble staff to know where people are working from on each day. Some staff are in the office for some of the day and others work remotely for most of the time. We currently use a WFH email chain to let the company know if you are working from home but with the bigger number of people working at pebble this is getting less scalable.</p>

<h2>What did you build</h2>

<p>We created five streams of work.</p>

<p><img src="http://static.tumblr.com/syeid8e/BTmnpod1e/hackday_-_wtfaiwft.001.jpg" alt="WFH Architecture"/></p>

<p>The first was a RESTful API to allow different clients to update the status of a pebble employee.</p>

<p>The second was a Slack bot that would allow staff to update their status by using ‘wfh’ for working from home and ‘wfo’ for working from the office.
An integration was created for TribeHR our HR system to pull in sickness and holidays and set the status correctly for that.</p>

<p>An email daemon was also created to send a single mail at 10 am to all of the company.</p>

<p><img src="http://static.tumblr.com/syeid8e/Kzwnpod7f/screen_shot_2015-06-08.png" alt="Email Daemon"/></p>

<p>Finally a front end was created to allow the status of people to be shown on a big screen.
<img src="http://static.tumblr.com/syeid8e/ILtnpodam/screen_shot_2015-06-08_at_15.57.35.png" alt="WFH Front-end"/><img src="http://static.tumblr.com/syeid8e/ncunpod95/screen_shot_2015-06-08_at_15.57.54.png" alt="WFH Front-end"/></p>

<h2>What tech / magic / sorcery did you use to make this awesomeness?</h2>

<p>The most important part of the day for the team was creating the RESTful API. This allowed the work to be quickly divided up. The API was created using C# but the fact that the language was separated from the interface meant that other members of the team were free to use whatever they wanted to update it.</p>

<p>An experiment was made with Rust but it became apparent that this would take too long. The connector to TribeHR was created using Node.js as was the email cron.</p>

<p>The biggest strength of the day was that we had a multi-disciplinary team using different technologies working together because of the single API interface.</p>

<h2>What were the big gotcha’s?</h2>

<p>The team saw some friction between using different technology stacks. Once the RESTful API was bootstrapped we looked to make the updates real-time and the API team implemented SignalR to offer this. We then ran into problems with CORS in the browser and after an hour or so of tweaking settings we were unable to solve issues with headers.</p>

<h2>What’s next?</h2>

<p>The product is working in pebble now with many members of staff using it to up their status each day. The email job is working well and has been setup as a cron job on one of our servers. This bot had a brief malfunction when initially introduced thinking it was ok to send an update every minute. After a dressing down it is now working well.</p>

<p>To finish the project the team need to get the front-end hosted somewhere and for this to be displayed on a big screen in the office. We also need to resolve the SignalR issues either by using a proxy server to remove the CORS issues or to be able to set the headers correctly.</p>

<p>We also may look at creating a slack channel or a slack command that will list the status of staff since the company is gravitating heavily around Slack now.</p>

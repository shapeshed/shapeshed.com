+++
author = "George Ornbo"
date = "2015-06-09T12:31:08+01:00"
original = "http://pebblecode.com/blog/hack-day-wfh-bot/"
description = "Are you WFH or WFO?"
slug = "hack-day-wfh-bot"
tags = ["hacks"]
title = "Hack Day - WFH Bot"
+++

## What was problem you originally pitched?

It is hard for pebble staff to know where people are working from on each day.
Some staff are in the office for some of the day and others work remotely for
most of the time. We currently use a WFH email chain to let the company know if
you are working from home but with the bigger number of people working at pebble
this is getting less scalable.

## What did you build

We created five streams of work.

![WFH Architecture](/images/articles/hackday_-_wtfaiwft.001.jpg)

The first was a RESTful API to allow different clients to update the status of a
pebble employee.

The second was a Slack bot that would allow staff to update their status by
using ‘wfh’ for working from home and ‘wfo’ for working from the office. An
integration was created for TribeHR our HR system to pull in sickness and
holidays and set the status correctly for that.

An email daemon was also created to send a single mail at 10 am to all of the
company.

![Email Daemon](/images/articles/screen_shot_2015-06-08.png)

Finally a front end was created to allow the status of people to be shown on a
big screen.

![WFH Front-end](/images/articles/screen_shot_2015-06-08_at_15.57.35.png)

![WFH Front-end](/images/articles/screen_shot_2015-06-08_at_15.57.54.png)

## What tech / magic / sorcery did you use to make this awesomeness?

The most important part of the day for the team was creating the RESTful API.
This allowed the work to be quickly divided up. The API was created using C# but
the fact that the language was separated from the interface meant that other
members of the team were free to use whatever they wanted to update it.

An experiment was made with Rust but it became apparent that this would take too
long. The connector to TribeHR was created using Node.js as was the email cron.

The biggest strength of the day was that we had a multi-disciplinary team using
different technologies working together because of the single API interface.

## What were the big gotcha’s?

The team saw some friction between using different technology stacks. Once the
RESTful API was bootstrapped we looked to make the updates real-time and the API
team implemented SignalR to offer this. We then ran into problems with CORS in
the browser and after an hour or so of tweaking settings we were unable to solve
issues with headers.

## What’s next?

The product is working in pebble now with many members of staff using it to up
their status each day. The email job is working well and has been setup as a
cron job on one of our servers. This bot had a brief malfunction when initially
introduced thinking it was ok to send an update every minute. After a dressing
down it is now working well.

To finish the project the team need to get the front-end hosted somewhere and
for this to be displayed on a big screen in the office. We also need to resolve
the SignalR issues either by using a proxy server to remove the CORS issues or
to be able to set the headers correctly.

We also may look at creating a slack channel or a slack command that will list
the status of staff since the company is gravitating heavily around Slack now.

---
author: George Ornbo
tags:
- Programming
date: 2016-02-17T00:00:00Z
title: The importance of a good bug report
description: Good bug reports offer significant time and cost savings. Not to mention happier developers.
original: http://pebblecode.com/blog/the-importance-of-a-good-bug-report/
---

## It doesn't work

In preparing for a production release I have been playing the role of QA tester. As a developer I have much more experience on the receiving end of QA and in my time I have seen good bug reports and terrible bug reports.

> The site is broken. Please fix it.

<cite>Some client</cite>

> Why isn't this working how I expect it to?

<cite>Another client</cite>

As a developer reports like this are toxic for several reasons:

* You have no idea what the problem is
* The reporter is clearly not interested in helping you
* There is a tone that it is your fault
* It is demoralising
* You will need to invest time to diagnose what the problem is

## What is a bug?

The term bug was popularised by [Grace Hopper][1] who referred to moth that had got stuck in the relay of a Mark II Computer in 1947. The moth was causing the computer to malfunction so to fix it had to be removed, or debugged.

A bug is a defect in how software is expected to work. It can be used to describe an error, flaw, failure or fault in a computer program. It can also be used to describe unexpected behaviour even if the software is working.

Whilst bugs are a fact of life in software development too often they are dealt with reactively. Developers schedules are often filled to bursting with features offering them little or not time to fix bugs. Bugs will always be present in software so it is important to plan to expect them.

## How to report a bug

If you find a bug software projects often have a standard way of reporting it. This may be tied to a bug tracker, a piece of software used for managing bugs. Some examples of bug trackers are [BugZilla][2], [JIRA][3], [GitHub Issues][4]. Often projects do not accept bug reports other than through bug trackers.

Some things that don't work well

* Tweeting a developer and saying something is broken
* Walking over to someone's desk and telling them about the bug
* Smashing the desk, banging your head and screaming 'Why doesn't it work!?'

Some things that do work

* Using Bug Trackers
* Providing a clear bug report
* Understanding that your bug may not be top priority

## How developers think

Developers are time poor and generally under pressure to solve problems quickly. In my experience they are usually high functioning individuals and very helpful. Although they might not say it when they receive a poor bug report they are probably thinking some of the following

* That isn't a bug
* That doesn't make sense
* I don't know how to replicate this
* This person doesn't understand
* There are too many things for me to work out

Clearly for the relationship between reporter and developer this is not a good outcome. So how do you write a good bug report?

## A good bug report

A good bug report is about reducing the number of variables for a developer.

### Environment

Normally developers will work on a couple of environments as the push code out to production. Specifying where the bug happened allows a developer to understand which version of the code they should be looking at. Pasting the URL is a good idea here.

### User Story / Feature

If the bug relates to a user story or feature reference it in the bug report. This can help reference the correct behaviour. Referencing a feature like 'Adding a user' can also be useful in reducing the number of variables.

### Browser

Different browsers behave in different ways so giving the developer the browser and the version number of the browser is invaluable. An example might be 'Chrome 48.0.2564.109 (64-bit)'.

### Platform

Software can be run on a multitude of platforms so it is a good idea to specify where it is being run. This might be as simple as 'mobile', 'desktop', or 'tablet'. It is often very helpful to give the make of the platform too. If you are reporting something on Mobile for example giving the device type can be very useful.

An example might be 'mobile, Nexus 5'

### Operating System

The underlying operating system can also affect how software runs so giving a developer this information can reduce the time to fixing a bug.

An example might be 'Windows XP' or 'Mac OSX 10.11.1'.

The more information that can be provided here the better so include the version number of the operating system if you can.

### Expected behaviour

This should be used to let the developer know what you expected to happen. Often you can refer to a user story here. Otherwise be clear in what you expected to happen.

### Actual behaviour

This should be used to describe what actually happened. Screenshots can be very useful here.

### Steps to replicate

This is perhaps the most useful part of bug report. Assume the developer has no knowledge of the bug you've found. Describe exactly the steps that you took to discover the bug. This can be useful in that if you can't replicate it yourself there is little chance a developer can.

Use numbered bullet points to replicate the bug

1. Login to the homepage .
2. Follow the link 'Book now'
3. Fill this in to the form
4. Click submit
5. Observe the error screen

## Conclusion

Good bug reports can save significant amounts of time and money. It is well worth defining a bug reporting process in your team whether you have a formal QA tester or not. The risks of bad bug reports are that significant waste is introduced into your team. Most developers can tell war stories about bad bug reports but it simply does not need to be this way. Whether or not you use a bug tracker to enforce good bug reports or not investing in a good bug reporting process will increase productivity and developer happiness.

I think I met a happy developer. Once.

[1]: https://en.wikipedia.org/wiki/Grace_Hopper
[2]: https://www.bugzilla.org/
[3]: https://www.atlassian.com/software/jira/
[4]: https://github.com/


+++
author = "George Ornbo"
date = "2011-10-18T10:24:00+01:00"
original = "http://pebblecode.com/blog/on-technical-debt/"
tags = ["programming"]
title = "On Technical Debt"
+++

Listening to a
[recent Ruby Rogues podcast](http://rubyrogues.com/technical-debt/) the topic of
Technical Debt came up that really rang true for many of our projects and
clients.

### Making Agile Decisions

The discussion notes that the point of Agile is to get a product to market as
quickly as possible to prove the business value or otherwise of an idea. In the
course of an Agile project decisions are made to facilitate this. It might be a
quick and dirty feature, not having full test coverage or hacking together a
quick library to support a feature going into production.

The point is that this is completely correct - you want to get a product out
there and prove a business idea. But there should be a realisation that if you
are developing and supporting software long term there will be a point at which
these decisions will have to be paid back.

### Accruing Technical Debt

In almost all of our projects at pebble we have examples of this and this
represents normal, Agile software development. But discussing Technical Debt
with a client is a good way to let the client know in simple, understandable
terminology of the impact of a decision. By discussing it this way we can be
clear that at some point the debt from a decision may have to be repaid. By the
same token there will be scenarios where taking on more technical debt is the
right choice.

### Repaying Technical Debt

In the context of our work depending on how much debt a project / client wants
to take on there is a good case for us scheduling a debt repayment sprint in our
Agile projects once and a while. The business value is that it will support
future features, stability and decrease long term development costs. There will
also be cases where accruing debt is completely acceptable. It should be
assessed on a case by case basis.

### Clear Terminology For Clients

I like this terminology in terms of how we can work through business level
decisions with clients and make informed choices for the direction of Agile
software development.

We have been prone to sharp intakes of breath at feature requests in the past
and have explicitly stated this is something we hate noticing ourselves doing.
As an Agile house we should never being saying no to features but positioning
them within a business context and helping clients to make informed decisions.
Terminology like Technical Debt lets us do that and communicate clearly and
openly with the client.

[The discussion](http://rubyrogues.com/technical-debt/) comes highly recommended
if you are involved with Agile software development.

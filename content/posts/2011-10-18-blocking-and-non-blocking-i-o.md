+++
author = "George Ornbo"
date = "2011-10-18T10:25:04+01:00"
original = "http://pebblecode.com/blog/blocking-and-non-blocking-i-o/"
slug = "blocking-and-non-blocking-io/"
tags = ["ruby", "rails", "nodejs", "io", "async"]
title = "Blocking and non-blocking I/O"
+++

A theoretical look at non-blocking and blocking I/O

## What is blocking I/O on the web?

Blocking I/O is code that causes processing to stop until it returns. Consider
this [Rails](http://rubyonrails.org/) code:

```ruby
class User < ActiveRecord::Base

  after_create :send_welcome_email

  def send_welcome_email
    Notifier.welcome_email(self).deliver
  end

end
```

Simple enough - a new user gets a welcome email after signing up. This method is
blocking - processing stops until the mail is queued and we are returned from
the Notifier class. This is standard practice in a Rails app and generally is
fine for sending single emails.

## When this can be a problem

Consider an example where we have a collaborative application sending emails to
users when other users comment on something. Let’s say for arguments sake we
have 50 separate emails to send (in the real world I know this is unlikely). If
we use similar code to the example above when someone posts a comment processing
will be blocked until all 50 emails have been sent.

So our app can be slowed by:

- The time it takes to process 50 emails
- A slow network to the mail server
- Heavy load on the mail server

Until we return from this the slowness is passed directly to the user.

Increasingly web applications do not exist on a single server. They are becoming
complex networked applications using cloud infrastructures, third-party APIs and
services across the internet. In these kind of applications the potential for
blocking operations like our small email example becomes bigger. In a world
where speed matters we have to be increasingly creative about ways to avoid
blocking operations.

## Ways to solve this

In the case of the email example in Rails we can use something like
[resque_mailer](https://github.com/zapnap/resque_mailer) to perform these tasks
asynchronously. We bring up resque workers as separate processes and use
[Redis](http://redis.io/) to store bits of data that the workers can use to do
their work. It is a great library and very easy to use. Instead of forcing the
user (and the execution of our application code) to wait until mail is sent we
put the task onto a queue and get a worker to execute it.

In Rails this means using the following

- Redis
- Background processes
- [Monit](http://mmonit.com/monit/),
  [bluepill](https://github.com/arya/bluepill) or
  [god](https://github.com/mojombo/god) to monitor the background process

That’s a lot of extra stuff so the question is - why are we blocking on this at
all?

## Non-blocking I/O

Here’s some example code from nodemailer, a library for sending email via
[node.js](http://nodejs.org/)

```javascript
var nodemailer = require("nodemailer");

nodemailer.SMTP = {
  host: "smtp.example.com",
};

nodemailer.send_mail(
  {
    sender: "me@example.com",
    to: "you@example.com",
    subject: "Hello!",
    html: "<p><b>Hi,</b> how are you doing?</p>",
    body: "Hi, how are you doing?",
  },
  function (error, success) {
    console.log("Message " + success ? "sent" : "failed");
  }
);
```

In this case sending mail is non-blocking. The results of the function are
passed to the callback function which acts accordingly. The callback can call
another function, throw an error, or write to a log. But crucially this doesn’t
block the execution of other parts of the application. This is really good as by
design we are saying nothing is allowed to block so we don’t need Redis,
background processes and tools to monitor the background processes. Furthermore
by using this philosophy we can create complex networked applications without
needing to worry about one node in the network slowing the application to a
halt.

Non-blocking I/O is liberating in the sense that we don’t need to worry about
anything blocking. Some argue that this approach leads to spaghetti code and can
be difficult to debug. I don’t yet have an opinion on this but in terms of a
design philosophy and knowing how things work on the web I really like the
approach of saying ‘nothing should block’. What’s your view?

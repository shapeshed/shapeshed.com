---
title: Blocking and non-blocking I/O
date: '2011-10-18T10:25:04+01:00'
tags: [ruby, rails, nodejs, io, async]
author: George Ornbo
slug: blocking-and-non-blocking-io/
original: http://pebblecode.com/blog/blocking-and-non-blocking-i-o/
---
<p>A theoretical look at non-blocking and blocking I/O</p>

<h2>What is blocking I/O on the web?</h2>

<p>Blocking I/O is code that causes processing to stop until it returns. Consider this <a href="http://rubyonrails.org/">Rails</a> code:</p>

<pre><code>class User &lt; ActiveRecord::Base

  after_create :send_welcome_email

  def send_welcome_email
    Notifier.welcome_email(self).deliver
  end

end
</code></pre>

<p>Simple enough - a new user gets a welcome email after signing up. This method is blocking - processing stops until the mail is queued and we are returned from the Notifier class. This is standard practice in a Rails app and generally is fine for sending single emails.</p>

<h2>When this can be a problem</h2>

<p>Consider an example where we have a collaborative application sending emails to users when other users comment on something. Let&rsquo;s say for arguments sake we have 50 separate emails to send (in the real world I know this is unlikely). If we use similar code to the example above when someone posts a comment processing will be blocked until all 50 emails have been sent.</p>

<p>So our app can be slowed by:</p>

<ul><li>The time it takes to process 50 emails</li>
<li>A slow network to the mail server</li>
<li>Heavy load on the mail server</li>
</ul><p>Until we return from this the slowness is passed directly to the user.</p>

<p>Increasingly web applications do not exist on a single server. They are becoming complex networked applications using cloud infrastructures, third-party APIs and services across the internet. In these kind of applications the potential for blocking operations like our small email example becomes bigger. In a world where speed matters we have to be increasingly creative about ways to avoid blocking operations.</p>

<h2>Ways to solve this</h2>

<p>In the case of the email example in Rails we can use something like <a href="https://github.com/zapnap/resque_mailer">resque_mailer</a> to perform these tasks asynchronously. We bring up resque workers as separate processes and use <a href="http://redis.io/">Redis</a> to store bits of data that the workers can use to do their work. It is a great library and very easy to use. Instead of forcing the user (and the execution of our application code) to wait until mail is sent we put the task onto a queue and get a worker to execute it.</p>

<p>In Rails this means using the following</p>

<ul><li>Redis</li>
<li>Background processes</li>
<li><a href="http://mmonit.com/monit/">Monit</a>, <a href="https://github.com/arya/bluepill">bluepill</a> or <a href="https://github.com/mojombo/god">god</a> to monitor the background process</li>
</ul><p>That&rsquo;s a lot of extra stuff so the question is - why are we blocking on this at all?</p>

<h2>Non-blocking I/O</h2>

<p>Here&rsquo;s some example code from nodemailer, a library for sending email via <a href="http://nodejs.org/">node.js</a></p>

<pre><code>var nodemailer = require('nodemailer');

nodemailer.SMTP = {
    host: 'smtp.example.com'
}

nodemailer.send_mail(
    {
      sender: 'me@example.com',
      to:'you@example.com',
      subject:'Hello!',
      html: '&lt;p&gt;&lt;b&gt;Hi,&lt;/b&gt; how are you doing?&lt;/p&gt;',
      body:'Hi, how are you doing?'
    },
    function(error, success){
      console.log('Message ' + success ? 'sent' : 'failed');
    }
);
</code></pre>

<p>In this case sending mail is non-blocking. The results of the function are passed to the callback function which acts accordingly. The callback can call another function, throw an error, or write to a log. But crucially this doesn&rsquo;t block the execution of other parts of the application. This is really good as by design we are saying nothing is allowed to block so we don&rsquo;t need Redis, background processes and tools to monitor the background processes. Furthermore by using this philosophy we can create complex networked applications without needing to worry about one node in the network slowing the application to a halt.</p>

<p>Non-blocking I/O is liberating in the sense that we don&rsquo;t need to worry about anything blocking. Some argue that this approach leads to spaghetti code and can be difficult to debug. I don&rsquo;t yet have an opinion on this but in terms of a design philosophy and knowing how things work on the web I really like the approach of saying &lsquo;nothing should block&rsquo;. What&rsquo;s your view?</p>

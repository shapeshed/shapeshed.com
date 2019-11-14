---
title: Sending usage stats to Campfire
date: '2012-04-23T11:08:00+01:00'
tags: []
original: http://pebblecode.com/blog/sending-usage-stats-to-campfire/
author: George Ornbo
---
<h3>Automate all the things</h3>

<p>We use Campfire heavily at pebble {code}. After a brief flirtation with IRC we found it was the easiest way to get everyone in the team involved. We post quite a few things to Campfire:</p>

<ul><li>Git commits from GitHub</li>
<li>Git commits from local, private repositories</li>
<li>Build notifications from Jenkins</li>
<li>A few things from Marvin, our <a href="https://github.com/github/hubot">hubot</a>.</li>
</ul><p>As everyone is in Campfire is makes lots of sense for us to do this. We don&rsquo;t waste time having to ask people in the team what they are doing since it is all there.</p>

<h3>How are our apps doing?</h3>

<p>We have recently created a couple of web applications in <a href="http://tricklrapp.com">Tricklr</a> and <a href="http://vistazoapp.com">Vistazo</a>. Every now and again people ask &lsquo;How many users do we have?&rsquo; or 'How many projects are there&rsquo;. Typically questions like this result in</p>

<ul><li>SSHing into the server</li>
<li>Logging into PostgreSQL</li>
<li>Running some queries</li>
<li>Pasting the results into Campfire</li>
</ul><p>About the fourth time of doing this it became obvious this is a job for automation!</p>

<h3>First pass</h3>

<p>A first pass at this resulted in a quick rake task after about 20 minutes from start to deploy. The rake task uses <a href="https://github.com/collectiveidea/tinder">tinder</a> a neat little gem for interacting with Campfire from Ruby.</p>

<pre><code>task "campfire:stats" =&gt; :environment do
  campfire = Tinder::Campfire.new '[YOUR_ACCOUNT_NAME]', :token =&gt; '[YOUR_TOKEN]'
  room = campfire.find_room_by_id([YOUR_ROOM_ID])
  # Get the data you want with ActiveRecord
  users = User.count
  room.speak "OHAI! Stats from YOUR APP"
  room.paste "Users: #{users}"
end
</code></pre>

<p>For a quick and dirty solution not bad. This is added to a cron job run on the server at 9.30 each day, just after everyone gets/logs in.</p>

<h3>Feature requests</h3>

<p>Some things that would be good to have:</p>

<ul><li>Comparison with yesterday, last week and the month before. </li>
<li>Make it a Marvin script! This would allow Marvin to tell anyone how the apps were doing on request.</li>
<li>Package it up as a Node.js module or gem</li>
</ul>

+++
author = "George Ornbo"
date = "2012-04-23T11:08:00+01:00"
original = "http://pebblecode.com/blog/sending-usage-stats-to-campfire/"
tags = []
title = "Sending usage stats to Campfire"
+++

+++ author = "George Ornbo" date = "2012-04-23T11:08:00+01:00" original =
"http://pebblecode.com/blog/sending-usage-stats-to-campfire/" tags = \[\] title
= "Sending usage stats to Campfire" +++

### Automate all the things

We use Campfire heavily at pebble {code}. After a brief flirtation with IRC we
found it was the easiest way to get everyone in the team involved. We post quite
a few things to Campfire:

- Git commits from GitHub
- Git commits from local, private repositories
- Build notifications from Jenkins
- A few things from Marvin, our [hubot](https://github.com/github/hubot).

As everyone is in Campfire is makes lots of sense for us to do this. We don’t
waste time having to ask people in the team what they are doing since it is all
there.

### How are our apps doing?

We have recently created a couple of web applications in
[Tricklr](http://tricklrapp.com) and [Vistazo](http://vistazoapp.com). Every now
and again people ask ‘How many users do we have?’ or 'How many projects are
there’. Typically questions like this result in

- SSHing into the server
- Logging into PostgreSQL
- Running some queries
- Pasting the results into Campfire

About the fourth time of doing this it became obvious this is a job for
automation!

### First pass

A first pass at this resulted in a quick rake task after about 20 minutes from
start to deploy. The rake task uses
[tinder](https://github.com/collectiveidea/tinder) a neat little gem for
interacting with Campfire from Ruby.

```ruby
task "campfire:stats" => :environment do
  campfire = Tinder::Campfire.new '[YOUR_ACCOUNT_NAME]', :token => '[YOUR_TOKEN]'
  room = campfire.find_room_by_id([YOUR_ROOM_ID])
  # Get the data you want with ActiveRecord
  users = User.count
  room.speak "OHAI! Stats from YOUR APP"
  room.paste "Users: #{users}"
end
```

For a quick and dirty solution not bad. This is added to a cron job run on the
server at 9.30 each day, just after everyone gets/logs in.

### Feature requests

Some things that would be good to have:

- Comparison with yesterday, last week and the month before.
- Make it a Marvin script! This would allow Marvin to tell anyone how the apps
  were doing on request.
- Package it up as a Node.js module or gem

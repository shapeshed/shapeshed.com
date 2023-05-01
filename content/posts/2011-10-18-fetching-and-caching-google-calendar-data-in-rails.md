+++
author = "George Ornbo"
date = "2013-10-18T10:28:35+01:00"
original = "http://pebblecode.com/blog/fetching-and-caching-google-calendar-data-in-rails/"
tags = ["Google Calendar", "Rails"]
title = "Fetching and caching Google Calendar data in Rails"
+++

Recently we had a requirement to show Google Calendar data for a client on a
Rails intranet project. The requirements were a bit outside what’s offered by
the embedded iFrame option so we needed a better solution to retrieve Google
calendar data.

### Options for getting data from Google Calendar

The simplest option is just to use the iFrame that Google provide that is
accessible from your Google Calendar under Settings > Calendars > Name of your
Calendar > Embed This Calendar. You don’t really get to customise this though so
what you see is what you get

If you want the raw data so you can do things with it Google publish the
[gdata-ruby-util](http://code.google.com/p/gdata-ruby-util/) Ruby library which
provides an interface into Google’s Data APIs. This is a very useful gem,
providing full access to lots of data across Google services. From a Ruby
perspective it seemed like you need to write a lot of code for a simple API
call.

Better for our requirments was the
[GCal4Ruby](http://rubyforge.org/projects/gcal4ruby/) gem that provides a clean
interface to Google Calendar data. It works for both Google and Hosted Accounts
and with just six lines of ruby you can get event data for a particular
calendar:

```ruby
service = GCal4Ruby::Service.new

service.authenticate("USERNAME", "PASSWORD")
cal = GCal4Ruby::Calendar.find(
    service,
    'YOUR_CALENDAR',
    {:scope => :first}
)
events = GCal4Ruby::Event.find(
    cal,
    "",
    {
     :range => {:start => Time.parse("08/04/2000"),
     :end => Time.parse("09/04/2010")}
    }
)
```

Once you’ve got the data you can iterate over it as you want

```ruby
for event in events
    #do stuff here
    puts event.title
end
```

### Caching

The API call takes a while to come back so we don’t really want the user
experience to be impacted by slow load times. We can use
[Rails caching](http://guides.rails.info/caching_with_rails.html) to store the
response and only fetch it when we need to. We put this into a rake task so that
we could call it using a cron script to keep the calendar up to date

```ruby
task :gcal_update  => :environment do
    Rails.cache.delete('gcal_events')
    Rails.cache.fetch('gcal_events') {
    gservice = GCal4Ruby::Service.new
    gservice.authenticate("USERNAME", "PASSWORD")
    calendar = GCal4Ruby::Calendar.find(gservice, 'your calendar',  {:scope => :first})
    events = GCal4Ruby::Event.find(calendar, "", {
        :range => {:start => Time.now.beginning_of_day, :end => Time.now.advance(:days => 7)},
        :singleevents => true,
        :max_results => 1000,
        :sortorder => "ascending" })
        upcoming_events = {}
        # We're saving the next 7 days of events
        days = Date.today..Date.today.advance(:days => 7)
        # initialize the hash
        days.each{ |day| upcoming_events["#{day.to_s}"] = []
    }
    events.each do |e|
        # should find out if its an all day event or a recurring event.
        event = Hash.from_xml(e.to_xml)["entry"]
        days.each do |day|
            current_event = {}
            if (event["when"]["startTime"].to_date <= day) and (event["when"]["endTime"].to_date >= day)
                # save useful data into a hash
                current_event["all_day"] ||= event["when"]["startTime"].to_time.to_date < event["when"]["endTime"].to_time.to_date ? true : false
                current_event["title"] = event["title"]
                current_event["uri"] = event["link"][0]["href"]
                current_event["time"] = event["when"]["startTime"].to_time.strftime('%H:%M') if event["when"]["startTime"].to_date == event["when"]["endTime"].to_date
                upcoming_events["#{day.to_s}"].push(current_event)
            end
        end
    end
  upcoming_events
}
end
```

### Showing the calendar

Now in our controller we have an easy way to get the latest calendar data and we
can then loop over it in our view

```ruby
@calendar = Rails.cache.read('gcal_events')
```

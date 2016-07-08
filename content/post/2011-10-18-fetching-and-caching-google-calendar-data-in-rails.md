---
title: Fetching and caching Google Calendar data in Rails
date: '2011-10-18T10:28:35+01:00'
tags: [Google Calendar, Rails]
author: George Ornbo
original: http://pebblecode.com/blog/fetching-and-caching-google-calendar-data-in-rails/
---
<p>Recently we had a requirement to show Google Calendar data for a client on a Rails intranet project. The requirements were a bit outside what&rsquo;s offered by the embedded iFrame option so we needed a better solution to retrieve Google calendar data.</p>

<h3>Options for getting data from Google Calendar</h3>

<p>The simplest option is just to use the iFrame that Google provide that is accessible from your Google Calendar under Settings &gt; Calendars &gt; Name of your Calendar  &gt; Embed This Calendar. You don&rsquo;t really get to customise this though so what you see is what you get</p>

<p>If you want the raw data so you can do things with it Google publish the <a href="http://code.google.com/p/gdata-ruby-util/">gdata-ruby-util</a> Ruby library which provides an interface into Google&rsquo;s Data APIs. This is a very useful gem, providing full access to lots of data across Google services. From a Ruby perspective it seemed like you need to write a lot of code for a simple API call.</p>

<p>Better for our requirments was the <a href="http://rubyforge.org/projects/gcal4ruby/">GCal4Ruby</a> gem that provides a clean interface to Google Calendar data. It works for both Google and Hosted Accounts and with just six lines of ruby you can get event data for a particular calendar:</p>

<pre><code>service = GCal4Ruby::Service.new

service.authenticate("USERNAME", "PASSWORD")
cal = GCal4Ruby::Calendar.find(
    service,
    'YOUR_CALENDAR',
    {:scope =&gt; :first}
)
events = GCal4Ruby::Event.find(
    cal,
    "",
    {
     :range =&gt; {:start =&gt; Time.parse("08/04/2000"),
     :end =&gt; Time.parse("09/04/2010")}
    }
)
</code></pre>

<p>Once you&rsquo;ve got the data you can iterate over it as you want</p>

<pre><code>for event in events
    #do stuff here
    puts event.title
end
</code></pre>

<h3>Caching</h3>

<p>The API call takes a while to come back so we don&rsquo;t really want the user experience to be impacted by slow load times. We can use <a href="http://guides.rails.info/caching_with_rails.html">Rails caching</a> to store the response and only fetch it when we need to. We put this into a rake task so that we could call it using a cron script to keep the calendar up to date</p>

<pre><code>task :gcal_update  =&gt; :environment do
    Rails.cache.delete('gcal_events')
    Rails.cache.fetch('gcal_events') {
    gservice = GCal4Ruby::Service.new
    gservice.authenticate("USERNAME", "PASSWORD")
    calendar = GCal4Ruby::Calendar.find(gservice, 'your calendar',  {:scope =&gt; :first})
    events = GCal4Ruby::Event.find(calendar, "", {
        :range =&gt; {:start =&gt; Time.now.beginning_of_day, :end =&gt; Time.now.advance(:days =&gt; 7)},
        :singleevents =&gt; true,
        :max_results =&gt; 1000,
        :sortorder =&gt; "ascending" })
        upcoming_events = {}
        # We're saving the next 7 days of events
        days = Date.today..Date.today.advance(:days =&gt; 7)
        # initialize the hash
        days.each{ |day| upcoming_events["#{day.to_s}"] = []
    }
    events.each do |e|
        # should find out if its an all day event or a recurring event.
        event = Hash.from_xml(e.to_xml)["entry"]
        days.each do |day|
            current_event = {}
            if (event["when"]["startTime"].to_date &lt;= day) and (event["when"]["endTime"].to_date &gt;= day)
                # save useful data into a hash
                current_event["all_day"] ||= event["when"]["startTime"].to_time.to_date &lt; event["when"]["endTime"].to_time.to_date ? true : false
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
</code></pre>

<h3>Showing the calendar</h3>

<p>Now in our controller we have an easy way to get the latest calendar data and we can then loop over it in our view</p>

<pre><code>@calendar = Rails.cache.read('gcal_events')
</code></pre>

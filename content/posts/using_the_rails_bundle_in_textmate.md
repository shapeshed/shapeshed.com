+++
date = "2010-02-25T00:00:00+00:00"
description = "I've been exploring the Rails bundle in TextMate. It is really useful but I had a few issues getting it up and running so if it helps anyone else I'm documenting them here."
tags = ["Rails", "TextMate"]
title = "Using the Rails bundle in TextMate"
+++

## My environment

I'm running Snow Leopard and installed Ruby, RubyGems and Rails by following the
excellent [Hivelogic][1] article.

I had mostly been using the command line for things like running tests but the
bundle has that baked in allowing you to run the test you have open with a
simple COMMAND + R shortcut.

## Issues

The first issue I came up against was that TextMate wasn't finding the right
version of Rails.

```sh
    Missing the Rails 2.3.5 gem. Please `gem install -v=2.3.5 rails`, update your RAILS_GEM_VERSION setting in config/environment.rb for the Rails version you do have installed, or comment out RAILS_GEM_VERSION to use the latest version installed.
```

I assumed this was a path issue so added /usr/local/bin to /etc/profile but no
luck. The solution is to add this to TextMate's Shell Variables. Go to
Preferences > Advanced > Shell Variables. Then add a row with the variable
"PATH" and the value "/usr/local/bin" (or wherever you want TextMate to look).

This allows individual tests to be run but when running all tests via the bundle
I got

```sh
    rake aborted! stack level too deep /Users/george/Sites/istink/Rakefile:10 (See full trace by running task with --trace) (in /Users/george/Sites/istink)
```

Done

There is a [ticket on the Macromates][2] site about this. The solution is to add
this line to the top of your Rakefile

```ruby
$:.reject! { |e| e.include? 'TextMate' }
```

This gets over that problem but I then ran into a conflict with TextMate's
Builder file which was throwing another error

```ruby
    /Applications/TextMate.app/Contents/SharedSupport/Support/lib/builder.rb:86:in `blank_slate_method_added': stack level too deep (SystemStackError) 	from
    ... snip ...
```

I found a [helpful comment][3] on [Dr Nic's][4] site that fixes the problem. So
I did

```sh
    cd /Applications/TextMate.app/Contents/SharedSupport/Support/lib/
    mv Builder.rb Builder.rb.old
```

It works! Now I can run any tests I want from within TextMate with the shortcut
^/. Productivity up!

[1]:
  http://hivelogic.com/articles/compiling-ruby-rubygems-and-rails-on-snow-leopard
[2]: http://ticket.macromates.com/show?ticket_id=F4DA8B03
[3]:
  http://drnicwilliams.com/2008/01/31/get-ready-for-the-textmate-trundle-to-rails-20-bundle/#comment-129179
[4]: http://drnicwilliams.com/

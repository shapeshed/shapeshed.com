{
  "slug": "twitter-feature-request-hash-tag-follows",
  "title": "Twitter feature request - hash tag follows",
  "date": "2009-08-28T00:00:00+01:00",
  "description": "Hash tag follows would eliminate pointless retweets and provide users with a looser way of creating relationships. ",
  "tags": [
    "Opinion"
  ]
}

## My situation

I'm an active member of the [ExpressionEngine][1] community and [Twitter][2] is a great for keeping up to date with the latest developments and software releases. The best way to keep up with things is via hash tags (either [#EE][3] or [#ExpressionEngine][4]).

## My problem

I had been using [Nambu][5] as my Twitter client which supports saved searches. After the [tr.im debacle][6] I decided to move to [Tweetie][7]. This doesn't support saved searches. Wouldn't it be much easier if hashtags would just appear in your stream?

## My solution

I [wrote a bot][8] that fetches #EE and #ExpressionEngine tags from the Search API and retweets them. 

## My mistake

After releasing the bot I quickly realised that this was going to piss people off. Many users use the RSS feed or clients that support saved searches. So the effect of the bot was just to pollute the stream with retweets. So I made the updates protected so they don't show in the public timeline. The bot will also self destruct if hash tag follows come to Twitter or a better solution arises. If you do want #ExpressionEngine or #EE tags in your stream just follow [@ee_bot][9]. If you don't the bot won't affect your streams of either tag.

## An apology

If I annoyed anyone I'm sorry. That was never my intention.

## Why hash tag follows?

In my opinion hash tag follows would solve lots of problems. Users who want to connect for a short time only, say a concert, a sporting event or a conference could follow a hash tag. Communities of users could follow hash tags as a looser group (although groups would be good too). There would be no need to manually follow lots of users, no need for duplicated posts or retweets.

So my request to Twitter is to implement hash tag follows. It would remove the requirement for pointless retweets, and would provide looser connections between large groups of interested users.

 [1]: http://expressionengine.com/
 [2]: http://twitter.com/
 [3]: http://search.twitter.com/search?q=%23EE
 [4]: http://search.twitter.com/search?q=%23ExpressionEngine
 [5]: http://nambu.com/
 [6]: http://blog.tr.im/post/159369789/tr-im-r-i-p
 [7]: http://www.atebits.com/tweetie-mac/
 [8]: http://github.com/shapeshed/arthur/
 [9]: http://twitter.com/ee_bot

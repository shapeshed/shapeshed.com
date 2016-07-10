{
  "title": "How to Sync iCal and Google Calendar",
  "date": "2007-10-22T00:00:00+01:00",
  "description": "A short tutorial on syncing iCal with Google Calendar for free with iCal on your Mac being the master calendar.",
  "tags": [
    "Apple",
    "Google"
  ]
}
## The setup

[Google Calendar][1] is great if you want to stay in touch with your calendar when you are on the road or away from your computer. It is free and is a brilliant application. To use it you can [sign up for an account here][2]. Secondly you'll need an [iCal Exchange][3] account. iCal Exchange is a free service that provides a hosted space for your iCal calendars. 

## Setting up iCal Exchange

To set up iCal Exchange login to your account. You will see two URLs at the bottom of the screen. You need the Public URL. This is an important point - to use this setup you will need to use a public calendar. Google doesn't yet support passwords on URLs so if you don't want your calendar to be public then I'm afraid this setup won't work for you! Copy the public URL - http://icalx.com/public/yourname/.

![iCal Exchange][4] 

In iCal select the calendar you wish to publish and then go to Calendar > Publish. Select Private URL.

![Publishing a Calendar in iCal][5] 

Fill in the information with the details from your iCal Exchange account. Then in the bottom right hand corner click the information icon. This will bring up information on the account. Change auto publish from 'no' to 'after each change'. This means whenever you create or amend an entry it will be published to iCal Exchange.

![Auto Publishing Calendars][6] 

Then go back into Ical Exchange and refresh. All being well you should see your calendar. There is a link to the .ics. Right click the link and copy it to the clipboard. 

## Setting up Google Calendar

Log in to your Google Calendar account. In the left hand pane you should see your calendars. At the very bottom is a link "Manage Calendars". Click this. 

![Manage Calendars in Google Calendar][7] 

Then on the following page click "Add Calendar". Then choose "Add by URL". Paste the .ics link in that you copied from iCal Exchange. All being well you should now have your Calendar available in Google Calendar and it will automatically sync with your local copy of iCal.

## Another setup

You can of course have Google Calendar as the master. Under calendar details you will see a link for .ics. You can use this to subscribe to the calendar in iCal. Up to you which way round you do it!

 [1]: http://www.google.com/calendar
 [2]: https://www.google.com/accounts/NewAccount
 [3]: http://www.icalx.com/
 [4]: https://shapeshed.com/images/articles/icalx.jpg 
 [5]: https://shapeshed.com/images/articles/ical_publish.jpg 
 [6]: https://shapeshed.com/images/articles/auto_publish.jpg 
 [7]: https://shapeshed.com/images/articles/manage_calendars.jpg

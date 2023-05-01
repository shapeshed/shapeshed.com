+++
date = "2014-01-21T16:04:36+00:00"
description = "The HTML5 Speech Recognition API allows JavaScript to have access to a browser's audio stream and convert it to text."
slug = "html5-speech-recognition-api"
tags = ["HTML", "JavaScript"]
title = "The HTML5 Speech Recognition API"
+++

Chrome version 25 [rolled out speech recognition][1] so you can now invite users
to talk to your web applications.

## Basic usage

```javascript
var recognition = new webkitSpeechRecognition();
recognition.onresult = function (event) {
  console.log(event);
};
recognition.start();
```

This will invite the user to allow a page access to their microphone. If you
allow access you can start talking and when you stop the `onresult` event will
be fired, making the results of the speech capture available as a JavaScript
object.

Within this object is the result

```javascript
{
  ..
  results: {
    0: {
      0: {
        confidence: 0.695017397403717,
        transcript: "look Mum I'm talking into a web page!"
      },
      isFinal:true,
      length:1
    },
    length:1
  },
  ..
}
```

## Streaming results

You can either wait until the user has stopped talking or have results pushed to
you when they are ready.

```javascript
var recognition = new webkitSpeechRecognition();
recognition.continuous = true;
recognition.interimResults = true;
recognition.onresult = function (event) {
  console.log(event);
};
recognition.start();
```

This means you can start to render results before the user has started talking.
This is action on the [Google demo][2].

## Accounting for accents

You can account for accents by setting the language that the speaker is using.
I'm in the United Kingdom so it looks like this.

```javascript
var recognition = new webkitSpeechRecognition();
recognition.lang = "en-GB";
```

I found results improved after I had set the language.

## x-webkit-speech

Unrelated but Webkit browsers also support Speech Input fields like this

```html
<input type="text" x-webkit-speech />
```

This accepts input via audio, performs speech recognition and puts the text into
the input box. Interestingly there is no prompt to the user to allow access to
the browser. You can see this in action [here][2].

## Security

Pages hosted on HTTP need to ask permission each time they want to make an audio
capture in a similar way to requesting access to other items via the browser.
Pages on HTTPS do not have to repeatedly request access. This seems a security
hole to me in that an application could record audio in a room at will once a
user has authorized it. The Chrome API interacts with Google's Speech
Recognition API so all of the data is going via Google and whoever else might be
listening.

In the context of JavaScript the entire page has access to the output of the
audio capture so if you page is compromised the data from the instance could be
read.

## Conclusion

I can see the Speech Recognition API being very useful if results are good for
plain old data entry. It would be interesting to see if this could capture
something like a conversation so that you may be able to have an instant
transcript. There are clearly some security concerns with this API however most
notably that an HTTPS Web Application could start listening any time after you
have approved access.

At the time of writing browser support seems patchy with Chrome seeming to be
the only vendor to have implemented it.

After writing the article [@TalAter][5] contacted me about [annyang][6], a
library he has written to make using the API easier.

## References

- [Speech recognition demo][1]
- [x-webkit-speech demo][2]
- [Introduction to the Web Speech API][3]
- [Web Speech API Specification][4]

[1]: https://www.google.com/intl/en/chrome/demos/speech.html
[2]: http://blogs.sitepointstatic.com/examples/tech/speech-input/index.html
[3]:
  http://updates.html5rocks.com/2013/01/Voice-Driven-Web-Apps-Introduction-to-the-Web-Speech-API
[4]: https://dvcs.w3.org/hg/speech-api/raw-file/9a0075d25326/speechapi.html
[5]: https://twitter.com/TalAter
[6]: https://talater.com/annyang/

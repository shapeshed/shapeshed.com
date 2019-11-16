+++
date = "2016-10-21T00:00:00+00:00"
description = "The BBC publishes high quality 320 kbps HLS AAC streams that can be used to listen to radio from the command-line using mpv. Here are the URLs and some aliases to start listening quickly."
slug = "listening-to-bbc-radio-with-mpv"
tags = ["UNIX", "Linux"]
title = "Listening to BBC Radio with mpv"

+++

## BBC Radio feeds

To the annoyance of some the BBC [removed support for Windows Media][2] and have migrated to using the AAC codec and http streaming. The good news is that the AAC streams are high quality and freely available. [Matthew Peet][1] shared the links to the 320 kbps HLS AAC streams on his site. 

<ul>
<li><a href="http://a.files.bbci.co.uk/media/live/manifesto/audio/simulcast/hls/uk/sbr_high/ak/bbc_radio_one.m3u8">
BBC radio 1 AAC/.m3u8</a></li>

<li><a href="http://a.files.bbci.co.uk/media/live/manifesto/audio/simulcast/hls/uk/sbr_high/ak/bbc_radio_two.m3u8">BBC radio 2 AAC/.m3u8</a></li>
<li><a href="http://a.files.bbci.co.uk/media/live/manifesto/audio/simulcast/hls/uk/sbr_high/ak/bbc_radio_three.m3u8">BBC radio 3 AAC/.m3u8</a></li>
<li><a href="http://a.files.bbci.co.uk/media/live/manifesto/audio/simulcast/hls/uk/sbr_high/ak/bbc_radio_fourfm.m3u8">BBC radio 4 AAC/.m3u8</a></li>
<li><a href="http://a.files.bbci.co.uk/media/live/manifesto/audio/simulcast/hls/uk/sbr_high/ak/bbc_radio_four_extra.m3u8">BBC radio 4 Extra AAC/.m3u8</a></li>
<li><a href="http://a.files.bbci.co.uk/media/live/manifesto/audio/simulcast/hls/uk/sbr_high/ak/bbc_radio_five_live.m3u8">BBC radio 5 live AAC/.m3u8</a></li>
<li><a href="http://a.files.bbci.co.uk/media/live/manifesto/audio/simulcast/hls/uk/sbr_high/ak/bbc_radio_five_live_sports_extra.m3u8">BBC radio 5 live sports extra AAC/.m3u8</a></li>
<li><a href="http://a.files.bbci.co.uk/media/live/manifesto/audio/simulcast/hls/uk/sbr_high/ak/bbc_6music.m3u8">BBC radio 6 Music AAC/.m3u8</a></li>
</ul>

## Listening with mpv

[mpv][1] is a fantastic cross-platform media player that can handle most formats thrown at it. It is based on [mplayer][4] and [mplayer2][5]. Playing a BBC stream is just a case of passing the URL to it. Magic.

    mpv 'http://a.files.bbci.co.uk/media/live/manifesto/audio/simulcast/hls/uk/sbr_high/ak/bbc_6music.m3u8'

## Some useful aliases

I made some [aliases][7] for the stations so I can stream with simple command. Running `playbbcr6` for example plays BBC 6 Music.

    alias playbbcr1="mpv 'http://a.files.bbci.co.uk/media/live/manifesto/audio/simulcast/hls/uk/sbr_high/ak/bbc_radio_one.m3u8'"
    alias playbbcr4="mpv 'http://a.files.bbci.co.uk/media/live/manifesto/audio/simulcast/hls/uk/sbr_high/ak/bbc_radio_fourfm.m3u8'"
    alias playbbcr5l="mpv 'http://a.files.bbci.co.uk/media/live/manifesto/audio/simulcast/hls/uk/sbr_high/ak/bbc_radio_five_live.m3u8'"
    alias playbbcr5lsx="mpv 'http://a.files.bbci.co.uk/media/live/manifesto/audio/simulcast/hls/uk/sbr_high/ak/bbc_radio_five_live_sports_extra.m3u8'"
    alias playbbcr6="mpv 'http://a.files.bbci.co.uk/media/live/manifesto/audio/simulcast/hls/uk/sbr_high/ak/bbc_6music.m3u8'"

## Listening to iPlayer Radio content

It is also possible to pass any URL from iPlayer (audio and video) to mpv. More magic

    mpv http://www.bbc.co.uk/programmes/b07z4djf

## Listening from outside the UK

Whilst I was over in the USA (virtually at least) listening to these streams was not possible so there looks to be geo-blocking on these streams. A UK VPN would work I imagine.  

    playbbc6
    Playing: http://a.files.bbci.co.uk/media/live/manifesto/audio/simulcast/hls/uk/sbr_high/ak/bbc_6music.m3u8
    [ffmpeg] http: HTTP error 403 Forbidden
    [lavf] avformat_open_input() failed


## Further reading 
* [mpv][3]
* [BBC Radio Audio Streams][1]
* [High Quality BBC Radio Streams][6]

[1]: http://mathewpeet.org/lists/BBC_radio_audio_streams/
[2]: http://www.bbc.co.uk/blogs/internet/entries/28dfd220-7ca1-3683-ac16-3938cfb4b882
[3]: https://mpv.io/
[4]: http://www.mplayerhq.hu/
[5]: https://github.com/mplayer2
[6]: http://steveseear.org/high-quality-bbc-radio-streams/
[7]: https://shapeshed.com/unix-alias/

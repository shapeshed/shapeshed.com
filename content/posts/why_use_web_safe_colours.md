+++
date = "2006-10-19T00:00:00+01:00"
description = "I've always designed using the web safe colour palette. Recently I realised I didn't actually know why. After a bit of research it would seem it is less relevant than I thought."
tags = ["Browsers", "Web Standards", "Photoshop"]
title = "Why use Web Safe Colours?"

+++

## Background

Web Safe, or Browser Safe colours consist of 216 colors that display non-dithered, consistent colour on any computer or device capable of displaying 8-bit color. Although 8-bit color can display 256 colors only 216 are displayed consistently. Web / Browser safe colours were defined in 1996 when the majority of computers had 8-bit cards. Today that figure is around [3% and falling][1]. Indeed [Lynda Weinman][2], credited with inventing the Web Safe Colour Pallette now [thinks it is obsolete.][3]

## The experiment

Using my Macbook Pro I wanted to test out how colours displayed under different settings. So I picked a row of web safe colours, a row of [web smart colours][4] and a row of colors that were not in either palette. The results were not entirely as expected.

### Millions

All of the colors displayed without dither.

### Thousands

All of the colors displayed without dither.

### 256

Unsurprisingly this looked generally awful. If I had a 256 screen I would probably smash it to pieces with a baseball bat. What was interesting though was that the green in the web safe colours were dithered. So what is the point of web safe colours? Is it just my monitor?

![Experiment at 256 Resolution][5] 

## So I can forget about web safe colours?

Yes I would say you can. Unless you want to design for the 3% of 8-bit users you can ditch the web safe palette. But most mobile phone browsers can only display 256 colors. Although they will catch up, for the time being Web Safe is not dead. If you want your site to be viewable on all mobile devices you shouldn't ditch the palette just yet. 

## Try it yourself

I'm interested to know what other users / monitors experience. So why not download the [Photoshop File][6] or view the [JPEG file][7] and let me know how it looks to you?

 [1]: http://www.w3schools.com/browsers/browsers_stats.asp
 [2]: http://www.lynda.com/
 [3]: http://www.lynda.com/hex.asp
 [4]: http://www.morecrayons.com/palettes/webSmart/
 [5]: /images/articles/256.jpg 
 [6]: /images/articles/web_safe_experiment.psd
 [7]: /images/articles/web_safe_experiment.jpg

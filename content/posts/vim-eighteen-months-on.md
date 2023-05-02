+++
date = "2011-03-21T00:00:00+00:00"
description = "I switched to Vim for editing text about 18 months ago. Here's an overview of my experience."
tags = ["UNIX", "Vim"]
title = "Vim eighteen months on"
+++

## Goodbye TextMate?

About 18 months ago I made the decision to give Vim a go as my primary text
editor. I had been using vi extensively for server admin work for a number of
years so I wasn't a total noob. TextMate was my default editor and broadly I was
happy with it but decided to give Vim a go.

## Baby steps

I started out with baby steps, looking back to TextMate and doing all of the
common things a switcher does, especially looking for TextMate's features in
Vim. Vim's contexts were familiar to me from working on servers so I was at an
advantage there but I quickly found Derek Wyatt's [awesome video series on
Vim][15]. Derek's videos were one of the main reasons my adoption was so
positive. If you are thinking of switching to Vim I strongly recommend this
resource. The videos start at a beginner level and work through to advanced
techniques, are excellently produced and give a particular helping hand for
newcomers. If you've never used Vim the [Welcome to Vim][1] video is the best.

Many people recommend using [MacVim][3] to ease the transition. [Henrik Nyh][4]
has a great article on [switching from TextMate using MacVim][5]. I didn't
follow this route but it may be helpful to some.

Installation of MacVim via [homebrew][17] on OSX is easy

brew install macvim

MacVim works like a standard application so you don't need to edit directly in
the terminal and comes with many common keyboard shortcuts that you'll likely be
used to.

## The setup phase

As with with many things in UNIX you get back what you put in. The [RTFM][2]
mantra is true for Vim - it has massive and excellent documentation that you
could spend months going through. The default install of Vim needs to be
configured which takes time. Initially I scoured github for dotfiles and
basically took configuration from developers that I admire - [Tim Pope][6] and
[Mislav Marohni&#263;][18]. I tweaked a little here and there, marrying up a
color scheme with my terminal color scheme of choice [ir_black][7]. If you want
to pick through my dotfiles [they are here][8].

Pretty much after that I had a text editor that looked good, had sensible
defaults for web programming and recognised the file formats I was editing. Then
came the hard bit - getting to intermediate level.

![Screenshot of Vim][16]

## Learn as you go

Vim does take time to learn. Initially it would be fair to say that I became
slower. Probably for around a month. But as you go you quickly learn how Vim
works and are delighted by the time-saving over other editors in almost every
feature. Learning to stop using the mouse is a paradigm shift but one I highly
recommend. When you get to a stage where you can quickly split windows and
navigate round without using a mouse you'll see the light. I challenge anyone to
commit Vim's many commands to muscle memory but the more you work with Vim the
more it becomes automatic and that's where Vim's power lies.

My tip is to take a little at a time and when you come up against a common
problem read the manual and learn how to do. For example you might want to
lowercase some text. You could do this through deleting the text and rewriting
it or you could you use Vim's excellent help to learn how Vim does it:

```sh
:help lowercase
```

![Screenshot of Vim's help showing lowercase entry][19]

This takes you straight to the documentation where you can learn the keystrokes
that Vim uses before doing it in a split window context. Typically it takes me
four or five lookups before I remember what the keystrokes are. If I ever forget
looking it up again in the help text is so easy it is not an issue.

Around about the time I was moving from a novice to intermediate Vim user
[Vimcasts][9] arrived on the scene. [Drew Neil][10] produces high quality
screencasts on all aspects of using Vim and I highly recommend this resource. A
book is also apparently in the offing from this sage so stay tuned for more from
Drew.

## Pumping iron, building muscle memory

The more you use Vim the more you build on your muscle memory. More and more I'm
finding I consult the documentation less and just do it. In short I'm starting
to feel like I'm over the hump and am seeing the many benefits of the learning
stage. But it would be fair to say that I had to pump a lot of iron to get to
this stage. Months 6 - 12 were a big learning curve in that respect, and I'm
still learning all the time. I don't feel I'll ever learn everything about Vim
but I now feel I'm at a stage where I know how to get better.

## Now

Fast forward 18 months and I feel I would be significantly less productive
without using Vim not just for coding but also for text editing. So I can use
vim for writing emails I now use [Mutt][11], a lightweight powerful email client
for the terminal. I use the [Vimium][12] extension for [Chromium][13], and of
course Vim for all of my coding. The experiment has been an extremely happy one
for me.

![Screenshot of Express windows in Vim][20]

## Not for everyone

I accept that Vim is not for everyone. Casual coders, or anyone who doesn't want
to get their hands dirty should probably stick with TextMate. Yahuda Katz
famously blogged that [switching to Vim was not easy][14] and I accept many of
his points. Vim isn't going to be something you can pick up and use
straightaway.

But if you stick with it you might just see the light. I did and can only give
Vim a massive ringing endorsement.

## Translations of this article

- [Bulgarian - Albert Ward][22]

## Further reading

- [Derek Wyatt's videos on Vim][15]
- [Vimcasts][9]
- [TextMate to Vim with Training Wheels][5]
- [MacVim][3]
- [Everyone Who Tried to Convince Me to use Vim was Wrong][14]
- [Janus][21]

[1]: https://vimeo.com/6999927
[2]: http://en.wikipedia.org/wiki/RTFM
[3]: http://code.google.com/p/macvim/
[4]: http://henrik.nyh.se/
[5]: http://henrik.nyh.se/2011/01/textmate-to-vim-with-training-wheels
[6]: https://github.com/tpope/tpope
[7]: http://blog.toddwerth.com/entries/show/6
[8]: https://github.com/shapeshed/dotfiles
[9]: http://vimcasts.org/
[10]: http://drewneil.com/
[11]: http://www.mutt.org/
[12]: https://chrome.google.com/webstore/detail/dbepggeogbaibhgnhhndojpepiihcmeb
[13]: http://www.chromium.org/Home
[14]:
  http://yehudakatz.com/2010/07/29/everyone-who-tried-to-convince-me-to-use-vim-was-wrong/
[15]: https://vimeo.com/user1690209/videos
[16]: /images/articles/vim_screenshot.webp
[17]: https://github.com/mxcl/homebrew
[18]: https://github.com/mislav/dotfiles
[19]: /images/articles/lowercase_vim_help.webp
[20]: /images/articles/express_screenshot.webp
[21]: https://github.com/carlhuda/janus
[22]: http://www.fatcow.com/edu/eighteen-months-bg/

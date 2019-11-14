---
title: Moving homebrew installs to a new Mac
date: '2013-04-12T09:29:00+01:00'
tags: []
author: George Ornbo
original: http://pebblecode.com/blog/moving-homebrew-installs-to-a-new-mac/
---
<p>You are a homebrew user and you have a new Mac. If you don&rsquo;t want to use Apple&rsquo;s migration tool to copy over everything you might be faced with running <code>brew install [formula]</code> for everything you have installed.</p>

<p>Unless you have a spare afternoon to do this you can achieve the same things with a few commands and be done in minutes, leaving you to get on with something more interesting.</p>

<p>On your old mac you can output a list of installed software from homebrew.</p>

<pre><code>brew list
</code></pre>

<p>By piping this into a file you can create a text file containing all of your installed software.</p>

<pre><code>brew list &gt; homebrew.txt
</code></pre>

<p>Now you can copy this to your new Mac by Airdrop if you are on the same network, <code>scp</code> or using a cloud service.</p>

<p>Once you have the file on your new Mac and assuming you have homebrew setup you can install all of the software with a single command</p>

<pre><code>cat homebrew.txt | xargs brew install
</code></pre>

<p>You might find that homebrew has removed some formulae since you installed it. If this is the case just edit the file and remove the formula that is no longer available.</p>

<p>If you have your dotfiles in <a href="https://github.com/shapeshed/dotfiles">git repository</a> you&rsquo;ve suddenly got a pretty portable setup.</p>

+++
author = "George Ornbo"
date = "2013-04-12T09:29:00+01:00"
original = "http://pebblecode.com/blog/moving-homebrew-installs-to-a-new-mac/"
tags = []
title = "Moving homebrew installs to a new Mac"
+++

You are a homebrew user and you have a new Mac. If you don’t want to use Apple’s
migration tool to copy over everything you might be faced with running
`brew install [formula]` for everything you have installed.

Unless you have a spare afternoon to do this you can achieve the same things
with a few commands and be done in minutes, leaving you to get on with something
more interesting.

On your old mac you can output a list of installed software from homebrew.

```sh
brew list
```

By piping this into a file you can create a text file containing all of your
installed software.

```sh
brew list > homebrew.txt
```

Now you can copy this to your new Mac by Airdrop if you are on the same network,
`scp` or using a cloud service.

Once you have the file on your new Mac and assuming you have homebrew setup you
can install all of the software with a single command

```sh
cat homebrew.txt | xargs brew install
```

You might find that homebrew has removed some formulae since you installed it.
If this is the case just edit the file and remove the formula that is no longer
available.

If you have your dotfiles in
[git repository](https://github.com/shapeshed/dotfiles) you’ve suddenly got a
pretty portable setup.

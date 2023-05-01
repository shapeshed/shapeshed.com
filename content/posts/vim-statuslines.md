+++
date = "2017-05-12T01:00:00+00:00"
description = "Statuslines in Vim are not hard to create. Making your own means one less dependency in your life."
slug = "vim-statuslines"
tags = ["Vim", "UNIX"]
title = "Build your own Vim statusline"
+++

## What is a statusline in Vim?

The statusline in Vim is the bar along the bottom of the Vim window. By default
it does not show when you open Vim until there is more than one window. The
statusline is intended to give you information about the status of a buffer with
the default statusline including the path, permissions, line and a percentage
representation of where you are in the file. For many people the default
behaviour of vim is enough and you can get on with your life without having to
configure anything.

![Default Vim Statusline][10]

## Showing the statusline

The statusline can be shown regardless of whether you have more than one buffer
open with the following setting in your `.vimrc`.

```vim
set laststatus=2
```

Similarly it may be disabled entirely if you never want to see it.

```vim
set laststatus=0
```

## Hello World statusline

A very basic statusline can be achieved by adding the following to the `.vimrc`
file.

First ensure that the status bar is enabled all the time.

```vim
set laststatus=2
```

Then set the statusline

```vim
set statusline=helloworld
```

Reload Vim and a not so useful hello world status bar will show.

![Hello World Vim Statusline][11]

## Building a statusline

A useful pattern to use when building a statusline is to concatenate the line
and build the statusline over multiple lines in your `vimrc`

```vim
set statusline=
set statusline+=hello
set statusline+=world
```

This makes the statusline easier to read when building and maintaining it.

## Vimscript functions

Statuslines can use [Vim functions][1] and it is possible to show anything that
can be programmed in [Vimscript][2] in the statusline. This might be the
weather, [the price of ETH][3] or more commonly the git branch that you are on.
The following returns the current branch and an empty string if there is no git
repository.

```vim
function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction
```

This function can then be used in a statusline.

```vim
set statusline=
set statusline+=%{StatuslineGit()}
```

![Git branch on statusline][12]

## Showing data

Vim has a number of variables that may be used in status lines. The `f`
character for example shows the path to the file in the buffer and the [vim
documentation][4] outlines clearly the data that can be shown.

```vim
set statusline=
set statusline+=\ %f
```

## Colour

Colour is perhaps the hardest part to configure in statuslines. [The
documentation][7] is harder to decipher here but offers the highlight colour
names that may be used to change the colour of the statusline. These colors are
named highlights and will vary with your colorscheme, you can preview all
highlight groups with `:so $VIMRUNTIME/syntax/hitest.vim`. The syntax for using
these color groups is as follows:

```vim
set statusline=
set statusline+=%#LineNr#
set statusline+=\ %f
```

## A few lines over a plugin

After reading the documentation and understanding how statuslines work it was
easy to construct a statusline that works for me.

```vim
function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

set statusline=
set statusline+=%#PmenuSel#
set statusline+=%{StatuslineGit()}
set statusline+=%#LineNr#
set statusline+=\ %f
set statusline+=%m\
set statusline+=%=
set statusline+=%#CursorColumn#
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c
set statusline+=\
```

![My statusline][13]

Of course it may be easier for many people to use [powerline][8] or
[airline][9]. Personally 22 lines of code is enough to have a working statusline
and I have one fewer dependency.

## References

- [How to control/configure vim colors][5]
- [Learn Vimscript The Hard Way - Status Lines][6]
- [Powerline for Vim][8]
- [Airline for Vim][9]
- [Vim statusline documentation][4]

[1]: http://learnvimscriptthehardway.stevelosh.com/chapters/23.html
[2]: http://learnvimscriptthehardway.stevelosh.com/
[3]: https://ethereumprice.org/
[4]: http://vimdoc.sourceforge.net/htmldoc/options.html#'statusline'
[5]:
  http://alvinalexander.com/linux/vi-vim-editor-color-scheme-syntax#possible-highlight-groups
[6]: http://learnvimscriptthehardway.stevelosh.com/chapters/17.html
[7]: http://vimdoc.sourceforge.net/htmldoc/syntax.html
[8]: https://github.com/Lokaltog/vim-powerline
[9]: https://github.com/vim-airline/vim-airline
[10]: /images/articles/vim-default-statusline.png
[11]: /images/articles/statusline-helloworld.png
[12]: /images/articles/git-branch-statusline.png
[13]: /images/articles/my-statusline.png

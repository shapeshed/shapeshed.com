{
  "slug": "vim-netrw",
  "title": "Vim: you don't need NERDtree or (maybe) netrw",
  "date": "2016-10-18T00:00:00+00:00",
  "image": "images/articles/vim-netrw.png",
  "description": "Vim's netrw file browser is good enough. With a few tweaks there is no need for plugin like NERDtree. For many tasks you may not even need netrw.",
  "tags": [
    "vim"
  ]
}

![Screenshot of netrw directory browser][2]

## netrw - the unloved directory browser

The `netrw` plugin normally ships with vim and is the default filebrowser. It gets a bad rap and ships with all kinds of features likes remote editing over SSH and FTP, and anecdotally [has many bugs][3]. Most developers just jump straight for the [`NERDtree` plugin][4] but in my opinion the default `netrw` plugin does most of what people use `NERDtree` for. Moreover, for opening files and traversing codebases there are other native vim options available. 

## Invoking netrw

Invoking netrw can be achieved in three ways

* `:Explore` - opens `netrw` in the current window
* `:Sexplore` - opens `netrw` in a horizontal split
* `:Vexplore` - opens `netrw` in a horizontal split

You can also snigger by typing `:Sex` to invoke a horizontal split. 

## Changing the directory view in netrw

The directory listing view can be modified to show more or less information on files and directories, change the sorting order and hiding certain files.

With the directory browser open hit `i` to cycle through the view types. There are four different view types: thin, long, wide and tree. A preferred view type can be made permanent by setting it in a `.vimrc` file.

    let g:netrw_liststyle = 3

![The tree list style view][5]

*The tree list view in netrw.*

## Removing the banner

The directory banner is mostly useless. To remove it temporarily press `I`. To remove it permanently add the following to your `.vimrc`.

    let g:netrw_banner = 0

## Changing how files are opened

By default files will be opened in the same window as the netrw directory browser. To change this behaviour the `netrw_browse_split` option may be set. The options are as follows

* `1` - open files in a new horizontal split
* `2` - open files in a new vertical split
* `3` - open files in a new tab 
 
To make the selection permanent add the following to your `.vimrc`.

    let g:netrw_browse_split = 1

## Set the width of the directory explorer

The width of the directory explorer can be fixed with the `netrw_browse_split` option. The following sets the width to 25% of the page.

    let g:netrw_winsize = 25

## NERDtree like setup

If NERDtree is your thing `netrw` can give you a similar experience with the following settings

    let g:netrw_banner = 0
    let g:netrw_liststyle = 3
    let g:netrw_browse_split = 4
    let g:netrw_altv = 1
    let g:netrw_winsize = 25
    let g:netrw_banner = 0
    augroup ProjectDrawer
      autocmd!
      autocmd VimEnter * :Vexplore
    augroup END

![Getting a NERDtree like experience][6]

*A nerdtree like setup with netrw.*

## My settings

I keep things minimal and am happy with most of the defaults. In fact for now I just remove the banner. I told you I like minimal :-).

    let g:netrw_banner = 0

## vim-vinegar

It is worth mentioning [vim-vinegar][7], a plugin that looks to enhance `netrw` and is popular with users looking to avoid installing NERDtree. 

> Well, vinegar.vim enhances netrw, partially in an attempt to mitigate the need for more disruptive "project drawer" style plugins.

In trying to use less vim plugins so I'm not a user but horses for courses etc.

## You may not need netrw

Vim also supports arbitrary commands to be run following `!`. For a quick directory listing the following works.

    :! ls -lF

For a more complex command other commands like `ack`, [`grep`][8] or [`find`][9] can be used. 

There are a number of ways to open files in vim and if that is what you use `netrw` for. Using `find` within `vim` can open files and supports tab completion.

    :find path/to/file.txt

To open a file in a vertical split use the following. This also supports tab completion. 

    :vs path/to/file.txt

To open a file in a horizontal split use the following. This also supports tab completion. 

    :sp path/to/file.txt

To open a file in a new tab use the following. This also supports tab completion. 

    :tabnew path/to/file.txt

For exploring codebases I also find [using `ctags`][10] is a better than grepping or trying to guess where methods are defined. First you need to generate a tags file using the `ctags` command.

    ctags -R .

Once this file is created vim can take you to a function or method definition automatically with `CTRL-[`. It is like magic and much more intelligent than random file browsing. 

## Conclusion

The directory browser that ships with vim is not particularly intuitive and ships with a wealth of features I will most likely never use. I get the sense that many developers just blindly install a shiny plugin without understanding what `netrw` can do. Sure, `netrw` is not perfect but less dependencies in my life and striving for simplicity is a good thing. 

## Further reading 
* [Why does NERDtree exist? What's wrong with netrw?][11]
* [netrw documentation][12]
* [vim-vinegar][7]
* [nerdtree][4]
* [Vim and ctags][10]
* [Make netrw really behave like Nerdtree][13]

[1]: http://linux.die.net/man/1/ls
[2]: /images/articles/vim-netrw.png "vim netrw directory browser"
[3]: https://github.com/tpope/vim-vinegar/issues/21#issuecomment-39447112
[4]: https://github.com/scrooloose/nerdtree
[5]: /images/articles/vim-netrw-tree.png "vim netrw tree view"
[6]: /images/articles/vim-netrw-nerdtree.png "vim netrw nerdtree like experience"
[7]: https://github.com/tpope/vim-vinegar
[8]: https://shapeshed.com/unix-grep/
[9]: https://shapeshed.com/unix-find/
[10]: https://andrew.stwrt.ca/posts/vim-ctags/
[11]: https://www.reddit.com/r/vim/comments/22ztqp/why_does_nerdtree_exist_whats_wrong_with_netrw/
[12]: http://vimdoc.sourceforge.net/htmldoc/pi_netrw.html#netrw
[13]: http://ellengummesson.com/blog/2014/02/22/make-vim-really-behave-like-netrw/

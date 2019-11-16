+++
date = "2016-10-20T00:00:00+00:00"
description = "Vim 8 added a native way to load third-party packages. This means, for me at least, there is no longer any need to use a third party plugin helper like Pathogen."
slug = "vim-packages"
tags = ["vim"]
title = "Vim: So long Pathogen, hello native package loading"

+++

## Vim 8 brings native third-party package loading

Vim 8, released on 12th September, added a new feature of being able to load third party packages natively. 

> Plugins keep growing and more of them are available than ever before.  To keep
the collection of plugins manageable package support has been added.  This is
a convenient way to get one or more plugins, drop them in a directory and
possibly keep them updated.  Vim will load them automatically, or only when
desired.  See |packages|

The approach is very similar to the [Pathogen][1] package it adds paths to the Vim runtime path where packages can be added. This is sensible as there are very few changes required to switch from Pathogen to using the native functionality. 

## How it works

If you store your `vim` configuration in `~/.vim` a new folder needs to be created within this folder to hold plugins. This is somewhat confusingly `~/.vim/pack/foo`. The folder `foo` can be anything. You can keep it at `foo`, change it to `my-plugins` or your whatever you like. I chose to use my internet handle.

    mkdir -p ~/.vim/pack/shapeshed

Within this folder a further folder `start` is needed to hold plugins. Vim will pick up any packages added to this folder and automatically load the plugins. 

Optionally another folder `opt` may be created to hold packages that are not loaded automatically. Packages added in the opt folder may be loaded using 

    :packadd packagename

This might be useful for debugging or an ad-hoc plugin.

## Directory layout

Directory layout for packages is given as the following. 

    .vim/pack/shapeshed/start/foobar/plugin/foo.vim    	  " always loaded, defines commands
    .vim/pack/shapeshed/start/foobar/plugin/bar.vim    	  " always loaded, defines commands
    .vim/pack/shapeshed/start/foobar/autoload/foo.vim  	  " loaded when foo command used
    .vim/pack/shapeshed/start/foobar/doc/foo.txt       	  " help for foo.vim
    .vim/pack/shapeshed/start/foobar/doc/tags          	  " help tags
    .vim/pack/shapeshed/opt/fooextra/plugin/extra.vim  	  " optional plugin, defines commands
    .vim/pack/shapeshed/opt/fooextra/autoload/extra.vim  	" loaded when extra command used
    .vim/pack/shapeshed/opt/fooextra/doc/extra.txt  	    " help for extra.vim
    .vim/pack/shapeshed/opt/fooextra/doc/tags  	          " help tags

where `foobar` and `fooextra` are names of plugins.

Other than the opt folder these are the default for existing packages so things are compatible. 

## Managing packages

The new functionality in vim does not add anything for managing plugins; it just loads them. How you manage plugins is up to you.

Managing packages is directly equivalent to using [Pathogen][1] so moving a plugin folder into place, cloning a git repository or using git submodules to move packages into the `start` folder are all options. Whilst I am not a huge fan of git submodules my `~/.vim` folder is part of my dotfiles and I find that that git submodules work for me.

In the simplest form you can just move a plugin into the `start` folder and it will be loaded automatically. It is up to you how you manage it. 

## Adding a package

Here is an example of how to add a package using Vim's native approach to packages and git submodules. 

    cd ~/dotfiles
    git submodule init
    git submodule add https://github.com/vim-airline/vim-airline.git vim/pack/shapeshed/start/vim-airline
    git add .gitmodules vim/pack/shapeshed/start/vim-airline
    git commit

## Updating packages

To update packages is also just a case of updating git submodules.

    git submodule update --remote --merge
    git commit

## Removing a package

Removing a package is just a case of removing the git submodule.

    git submodule deinit vim/pack/shapeshed/start/vim-airline
    git rm vim/pack/shapeshed/start/vim-airline
    rm -Rf .git/modules/vim/pack/shapeshed/start/vim-airline
    git commit

## Conclusion

Vim's native package management is very closely related to the approach taken by [Pathogen][1] in that it adds an additional location to the runtime path that packages can be added to. Beyond that it is up to you to manage the packages themselves, either through zip files, git or mercurial. It adds an additional feature of optional packages that may be loaded on demand.

In my testing I have found that packages work out of the box and I am confident enough to remove Pathogen and use the native approach to loading packages. Pathogen has worked really well for me but less third-party code is a good thing.

Vim's approach to package management is not particularly user friendly mainly because it pushes the management of packages into user land. Help tags are not automatically generated for packages either ([Vundle][2] has this) but this could probably be wrapped up in a script. Git submodules still feel clunky but they have worked well with Pathogen and I am confident this will work for me. Going native and reducing dependencies feels good!



## Further reading 
* [:help packages][4]
* [Pathogen][1]
* [Vundle][2]
* [Git Submodules][3]

[1]: https://github.com/tpope/vim-pathogen
[2]: https://github.com/VundleVim/Vundle.vim
[3]: https://git-scm.com/book/en/v2/Git-Tools-Submodules
[4]: http://vimhelp.appspot.com/repeat.txt.html#packages

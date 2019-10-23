{
  "slug": "vim-templates",
  "title": "Using template files in Vim",
  "date": "2017-04-26T00:00:00+00:00",
  "description": "Vim templates or skeletons, allow you to specify a template to be used for new files with a certain extension.", 
"tags": [
    "Unix",
    "Vim"
  ]
}


## Using templates in Vim

The Vim philosophy encourages users to automate repeated actions and provides a rich toolkit with great documentation to achieve that. One example of this type of micro-optimisation is having a template or skeleton file that populates the vim buffer when a new file is opened. 

With just a few lines in the `~/.vimrc` file it is possible to build a rich library of skeleton templates. There is no need to use a plugin and add a dependency overhead to your Vim configuration.

## What is a skeleton file?

A skeleton file is a template to scaffold the creation of new files. This means that whenever a new file is created a standard template is applied and applied to the Vim buffer. For a `ruby` file for example, the template may be an empty ruby class. The contents of the file are less important than the idea that for a specific file extension like `.go` or `.js` Vim can populate a new file with the contents of a template. 

## Why use a skeleton file?

* It standardises an approach to writing a script
* It can include licence information
* It can be shared
* It can be managed in version control

## An example skeleton file

A simple example is a shell script. Shell scripts should start with a [shebang][6] and often there is debate about the correct type of shebang for a bash script. My personal preference is to use

    #!/usr/bin/env bash

To ensure that I remember to add this in a consistent way this is a perfect candidate for a skeleton file.

The single line template is saved into `~/.vim/templates/skeleton.sh`. You may wish to add license or usage information to this template. 

## Populating new files 

To use a skeleton template when creating a new file the following will populate a new file with a `.sh` extension with the shell script template. 

    if has("autocmd")
      augroup templates
        autocmd BufNewFile *.sh 0r ~/.vim/templates/skeleton.sh
      augroup END
    endif

This can be explained as

* An if statement checks that the vim installation has the [autocmd][2] feature.
* A [group][3] is created called `templates`.
* An autocmd is created to be run each time the "starting to edit a non-existent file" event happens ([BufNewFile][4]).
* If the file has a `.sh` extension read the contents of `~/.vim/templates/skeleton.sh` and inserted it at line 0.

## Populating files without an extension

Suppose that we have created a new bash script called `backup`. This will not use the template as there is no `.sh` extension. Because Vim can read a file from disk and write it into the buffer this is not a problem. In Vim simply read the file into the buffer.

    :read ~/.vim/templates/skeleton.sh

## Customise to your tastes

Vim's lightweight approach to templating is extremely flexible, comes with zero dependencies and can be integrated into your [dotfiles][1]. It ensures consistency of style either for your own scripts or can be used as part of a standardised approach for a team.

For more see [`:help template`][5].

[1]: https://github.com/shapeshed/dotfiles
[2]: http://vimdoc.sourceforge.net/htmldoc/autocmd.html
[3]: http://vimdoc.sourceforge.net/htmldoc/autocmd.html#autocmd-groups
[4]: http://vimdoc.sourceforge.net/htmldoc/autocmd.html#BufNewFile
[5]: http://vimdoc.sourceforge.net/htmldoc/autocmd.html#skeleton
[6]: https://en.wikipedia.org/wiki/Shebang_(Unix)

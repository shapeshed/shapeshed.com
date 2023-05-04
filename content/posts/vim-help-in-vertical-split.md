+++
date = "2023-05-02T01:00:00+00:00"
description = "A simple vim tip to open help files in a horizontal split window for easier reading"
tags = ["Vim","UNIX"]
draft = true
title = "Open vim help files in a vertical split"
+++

![Some title][17]

## Making :help more readable

The default behaviour in vim opens help files in a horizontal split window. If
you use a horitzontal aspect ratio this means that the text is hard to read and
you have to scroll through a letterbox to read it. It is also hard to use the
help text to work on updating vim configuration files.

## Using vim's filetype plugins

If you read help files you may notice that the file has the filetype of `help`.
This means that we can hook into vim's approach to working with filetypes to
change the default behaviour see `:help ftplugin`. We can use a filetype plugin
to make help text open in a vertical split.

### vim

```vim
" See: h:autocmd, h:augroup
autocmd BufWinEnter <buffer> wincmd L
```

Save this at `~/.vim/ftplugin/help.vim`, reopen vim, type `:help help` and help
will now show in a horizontal split.

### nvim

If you are a nvim use can use `vimscript` but here is the same in `lua`.

```lua
-- See: h:api-autocmd, h:augroup
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
    pattern = { "<buffer>" },
    callback = function()
        vim.cmd([[
    wincmd L
    vert resize 80
    ]])
    end,
})
```

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
[10]: /images/articles/vim-default-statusline.webp
[11]: /images/articles/statusline-helloworld.webp
[12]: /images/articles/git-branch-statusline.webp
[13]: /images/articles/my-statusline.webp
[14]: https://github.com/nvim-lualine/lualine.nvim
[15]: https://github.com/nvimdev/galaxyline.nvim
[16]: https://github.com/famiu/feline.nvim
[17]: /images/articles/test-hero-4-3.png

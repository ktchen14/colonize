Colonize
========

This plugin maps `<CR>` to `:` in (Neo)Vim. The normal behavior of `<CR>` is:

```
+		or					*+*
CTRL-M		or					*CTRL-M* *<CR>*
<CR>			[count] lines downward, on the first non-blank
			character |linewise|.
```

This is rather useless for such an accessible key. In any context where `<CR>`
is actually useful (Netrw, QuickFix window, etc.), this plugin also moves that
function to `g<CR>`.

Installation
------------

Use your favorite plugin manager. Using [vim-plug]:

```vim
Plug 'ktchen14/vim-star'
```

Supported Contexts
------------------

- [x] Netrw
- [x] QuickFix window
- [x] [fugitive.vim](https://github.com/tpope/vim-fugitive)
- [x] [NERDTree](https://github.com/preservim/nerdtree)
- [x] [Tagbar](https://github.com/preservim/tagbar)

[vim-plug]: (https://github.com/junegunn/vim-plug)

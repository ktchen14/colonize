" Maintainer: Kaiting Chen <ktchen14@gmail.com>

if exists('g:loaded_colonize')
  finish
endif
let g:loaded_colonize = 1

nnoremap <CR> :
xnoremap <CR> :
onoremap <CR> :

" fugitive.vim

let g:nremap = {'<CR>': 'g<CR>'}

" NERDTree

let g:NERDTreeMapCustomOpen = 'g<CR>'

" tagbar

let g:tagbar_map_jump = 'g<CR>'

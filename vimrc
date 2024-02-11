set nocompatible

" #####################################
" Pathogen activation
" #####################################
execute pathogen#infect()

" #####################################
" Very basic settings
" #####################################
syntax on
filetype plugin indent on
set relativenumber
set number
let mapleader = " "
colorscheme slate

" Replace tabs with spaces (4)
set tabstop=2 shiftwidth=2 expandtab

" Configure tabs
set tabstop=4
set shiftwidth=4
set expandtab

" Automatically remove trailing whitespaces when saving files of specific
" types
autocmd FileType c,cpp,java,php,scala autocmd BufWritePre <buffer> :%s/\s\+$//e

" Set to auto read when a file is changed from the outside
set autoread

" Be smart when using tabs ;)
set smarttab

" colorcolumn / print margin
set colorcolumn=50,72
set textwidth=72
set fo+=t

" Relate md files to markdown type
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" Enable XML formatting
function! DoPrettyXML()
  " save the filetype so we can restore it later
  let l:origft = &ft
  set ft=
  " delete the xml header if it exists. This will
  " permit us to surround the document with fake tags
  " without creating invalid xml.
  1s/<?xml .*?>//e
  " insert fake tags around the entire document.
  " This will permit us to pretty-format excerpts of
  " XML that may contain multiple top-level elements.
  0put ='<PrettyXML>'
  $put ='</PrettyXML>'
  silent %!xmllint --format -
  " xmllint will insert an <?xml?> header. it's easy enough to delete
  " if you don't want it.
  " delete the fake tags
  2d
  $d
  " restore the 'normal' indentation, which is one extra level
  " too deep due to the extra tags we wrapped around the document.
  silent %<
  " back to home
  1
  " restore the filetype
  exe "set ft=" . l:origft
endfunction
command! PrettyXML call DoPrettyXML()

" Please check my spelling while typing (american english)
set spell spelllang=en_us

" Allow me to toggle on and off spell checking easily
map <F5> :setlocal spell! spelllang=en_us<CR>

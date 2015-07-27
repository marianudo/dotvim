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
let mapleader = ","

" Replace tabs with spaces (4)
set tabstop=4 shiftwidth=4 expandtab

" Configure tabs
set tabstop=4
set shiftwidth=4
set expandtab

" Shortcut to save current buffer and close it
:command Wd write|bdelete

" To close a buffer fast
:command D bdelete

" Groovy files syntax coloring
au BufNewFile,BufRead *.groovy  setf groovy 

" Set current directory to the currently editing file
" Commented out due to the installation of the vim-rooter plugin
" set autochdir

" ################################################
" Useful mappings
" ################################################
" Better split switching (Ctrl-j, Ctrl-k, Ctrl-h, Ctrl-l)
" map <C-j> <C-W>j
" map <C-K> <C-W>k
" map <C-H> <C-W>h
" map <C-L> <C-W>l
" map <C-M> :MRU
" map <C-Space> <C-X> <C-U>

" New window in different positions
" nmap <leader>sw<left>  :topleft  vnew<CR>
" nmap <leader>sw<right> :botright vnew<CR>
" nmap <leader>sw<up>    :topleft  new<CR>
" nmap <leader>sw<down>  :botright new<CR>

" New splits in different positions
" nmap <leader>s<left>   :leftabove  vnew<CR>
" nmap <leader>s<right>  :rightbelow vnew<CR>

" nmap <leader>s<down>   :rightbelow new<CR>

" Use space to jump down a page (like browsers do)...
noremap <Space> <PageDown>

" Remove trailing spaces with F5
:nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" Automatically remove trailing whitespaces when saving files of specific
" types
autocmd FileType c,cpp,java,php,scala autocmd BufWritePre <buffer> :%s/\s\+$//e

 " #####################################
 " Custom commands
 " #####################################
 " Commented out because I don't understand it
" :command Ccd cd %:p:h

" ###########################################
" Ultisnips configuration
" ###########################################
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
" If you want :UltiSnipsEdit to split your window.
" let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories=["UltiSnips"]

" ###########################################
" Configure NerdTree plugin
" ###########################################
nmap <leader>d :NERDTreeToggle<CR>
map <leader>r :NERDTreeFind<cr>

" ###########################################
" Configure ctrlp plugin
" Commented out due to desinstallation of the plugin
" ###########################################
" Use <leader>t to open ctrlp
" let g:ctrlp_map = '<leader>p'
" Ignore these directories
" set wildignore+=*/build/**,*/target/**
" disable caching
" let g:ctrlp_use_caching=0

" #####################################
" MRU plugin configuration
" #####################################
let MRU_Window_Height = 15

" #####################################
" Misc configuration
" #####################################
" http://stackoverflow.com/questions/1551231/highlight-variable-under-cursor-in-vim-like-in-netbeans
" :autocmd CursorMoved * exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))

" Set to auto read when a file is changed from the outside
set autoread

" Be smart when using tabs ;)
set smarttab

" Remap VIM 0 to first non-blank character
" map 0 ^

" Buffers - explore/next/previous: leader-u,leader-n, leader-p.
nnoremap <silent> <leader>u :BufExplorer<CR>
nnoremap <silent> <leader>n :bn<CR>
nnoremap <silent> <leader>p :bp<CR>

" pastetoggle http://stackoverflow.com/questions/2861627/paste-in-insert-mode
" set paste
set pastetoggle=<F4>

" colorcolumn / print margin
set colorcolumn=120

" Useful mapping to use ctags with ctrlp quickly
nnoremap <leader>. :CtrlPTag<cr>

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

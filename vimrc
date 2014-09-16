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
let mapleader = ","

" Replace tabs with spaces (4)
set tabstop=4 shiftwidth=4 expandtab

" Shortcut to save current buffer and close it
:command Wd write|bdelete

" Set current directory to the currently editing file
set autochdir

" ################################################
" Useful mappings
" ################################################
" Better split switching (Ctrl-j, Ctrl-k, Ctrl-h, Ctrl-l)
map <C-j> <C-W>j
map <C-K> <C-W>k
map <C-H> <C-W>h
map <C-L> <C-W>l
map <C-E> :MRU
map <C-Space> <C-X> <C-U>

" New window in different positions
nmap <leader>sw<left>  :topleft  vnew<CR>
nmap <leader>sw<right> :botright vnew<CR>
nmap <leader>sw<up>    :topleft  new<CR>
nmap <leader>sw<down>  :botright new<CR>

" New splits in different positions
nmap <leader>s<left>   :leftabove  vnew<CR>
nmap <leader>s<right>  :rightbelow vnew<CR>

nmap <leader>s<down>   :rightbelow new<CR>

" Use space to jump down a page (like browsers do)...
noremap <Space> <PageDown>

 " #####################################
 " Custom commands
 " #####################################
 :command Ccd cd %:p:h

" ###########################################
" Ultisnips configuration
" ###########################################
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories=["UltiSnips"]

" #############################################
" IndentLine configuration
" #############################################

" vertical line indentation
let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#09AA08'
let g:indentLine_char = '│'

" ###########################################
" Configure delimitMate plugin
" ###########################################
let delimitMate_expand_cr = 1

" ###########################################
" Configure NerdTree plugin
" ###########################################
nmap <leader>d :NERDTreeToggle<CR>

" ###########################################
" Configure ctrlp plugin
" ###########################################
" Use <leader>t to open ctrlp
let g:ctrlp_map = '<leader>t'
" Ignore these directories
set wildignore+=*/build/**,*/target/**
" disable caching
let g:ctrlp_use_caching=0

" #####################################
" MRU plugin configuration
" #####################################
let MRU_Window_Height = 15


set nocompatible
set number
set nu
set  guifont =Courier\ 12
set ignorecase
set smartcase

runtime! config/**/*.vim

call pathogen#infect()
call pathogen#helptags()
autocmd vimenter * NERDTree
autocmd TabEnter * NERDTree
syntax on
filetype plugin indent on

" NerdCommenter
"
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

let mapleader=","
set timeout timeoutlen=1500

" Mapping keys

map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-L> <C-W>l
map <C-H> <C-W>h

map <C-up> : tabp<CR>
map <C-down> : tabp<CR>

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set history=700
"
" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
"
let mapleader = ","

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme desert
set background=dark

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

"ecmascript 6
let g:syntastic_javascript_checkers = ['jshint']

let g:ycm_key_invoke_completion = '<C-b>'
let g:server_python_interpreter = '/usr/bin/python3'



let g:ycm_min_num_of_chars_for_completion = 2

let g:ycm_min_num_identifier_candidate_chars = 0

let g:ycm_auto_trigger = 1

let g:ycm_server_python_interpreter = 'python3'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

set completeopt-=preview

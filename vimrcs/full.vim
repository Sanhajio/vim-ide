"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer:
"       Omar Sanhaji — @sanhajio
"
" Description:
"       Two versions are available basic, and complete:
"           basic configuration doesn't require external tools.
"           Complete has plugins that needs external tools
"
" Sections:
"    -> General
"    -> Plugins
"    -> Mappings
"    -> Filetypes
"    -> Helper functions
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set encoding=utf8
set guifont =Courier\ 12
set history=700
set nocompatible
set nu
set number
set smartcase

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines


" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

filetype plugin indent on
syntax on

" Colors and Fonts

colorscheme desert
set background=dark

" => Text, tab and indent related

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set completeopt-=preview
set shiftwidth=2
set tabstop=2

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

let mapleader = ","

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" set the runtime path to include Vundle and initialize
set rtp+=~/Downloads/synonyms.vim
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=/usr/local/opt/fzf " If installed with homebrew
set rtp+=~/.fzf " If installed with git
call vundle#begin('~/.vim/bundle')

" installing plugins
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Basic functionalities
Plugin 'fholgado/minibufexpl.vim'
Plugin 'sheerun/vim-polyglot'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'junegunn/fzf.vim'
Plugin 'majutsushi/tagbar'
Plugin 'mileszs/ack.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'neoclide/coc.nvim', {'branch': 'release'}
call vundle#end()

" Tagbar

nmap <C-T> :TagbarToggle<CR>

" NERDTree
let g:NERDTreeShowHidden=1

" Use ALE and also some plugin 'foobar' as completion sources for all code.

" NerdCommenter

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

set timeout timeoutlen=1500

" FZF
nnoremap <C-N> :FZF<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Smart way to move between windows
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-L> <C-W>l
map <C-H> <C-W>h

" Move a line of text using ALT+[jk] or Command+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

" Mapping escape key to caps lock because of new macbook

let g:easyescape_chars = { "j": 1, "k": 1 }
let g:easyescape_timeout = 2000
inoremap jk <ESC>
inoremap kj <ESC>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Filetypes
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

au! BufNewFile,BufReadPost * set foldmethod=indent

" support terraform files
au! BufNewFile,BufReadPost *.{tf} set filetype=tf foldmethod=indent
autocmd FileType tf setlocal ts=2 sts=2 sw=2 expandtab

" support sql files
au! BufNewFile,BufReadPost *.{sql} set filetype=sql foldmethod=indent

autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" support Jenkins files
au! BufNewFile,BufReadPost *Jenkinsfile* set filetype=Jenkinsfile foldmethod=indent
autocmd FileType Jenkinsfile setlocal ts=2 sts=2 sw=2 expandtab

" support Jenkins files
au! BufNewFile,BufReadPost .{groovy} set filetype=groovy foldmethod=indent
autocmd FileType groovy setlocal ts=2 sts=2 sw=2 expandtab

" support .dockerfile files
au! BufNewFile,BufReadPost *.{dockerfile} set filetype=dockerfile foldmethod=indent

" support .jsonnet files
au! BufNewFile,BufReadPost *.{jsonnet} set filetype=jsonnet foldmethod=indent
au! BufNewFile,BufReadPost *.{libsonnet} set filetype=jsonnet foldmethod=indent


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

if has("autocmd")
    autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
endif

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
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=/usr/local/opt/fzf " If installed with homebrew
set rtp+=~/.fzf " If installed with git
call vundle#begin('~/.vim/bundle')

" installing plugins
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Basic functionalities
Plugin 'fholgado/minibufexpl.vim'
Plugin 'junegunn/fzf.vim'
Plugin 'majutsushi/tagbar'
Plugin 'mileszs/ack.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'sheerun/vim-polyglot'
Plugin 'tpope/vim-fugitive'
Plugin 'dense-analysis/ale'

" autocomplete, GoTo
Plugin 'prabirshrestha/async.vim'
Plugin 'prabirshrestha/asyncomplete.vim'
Plugin 'prabirshrestha/asyncomplete-lsp.vim'
Plugin 'prabirshrestha/vim-lsp'
Plugin 'mattn/vim-lsp-settings'

call vundle#end()

" Tagbar

nmap <C-T> :TagbarToggle<CR>

" NERDTree
let g:NERDTreeShowHidden=1

" lsp
let g:lsp_fold_enabled = 0
let g:lsp_diagnostics_enabled = 0         " disable diagnostics support
let g:lsp_signs_enabled = 1         " enable signs
let g:lsp_diagnostics_echo_cursor = 1 " enable echo under cursor when in
let g:asyncomplete_auto_popup = 1
let g:lsp_settings = {
  \  'vim-langserver': {
  \    'disabled': 0,
  \   },
\}


" MiniBufExpl Colors

hi MBENormal               guifg=#808080 guibg=fg
hi MBEChanged              guifg=#CD5907 guibg=fg
hi MBEVisibleNormal        guifg=#5DC2D6 guibg=fg
hi MBEVisibleChanged       guifg=#F1266F guibg=fg
hi MBEVisibleActiveNormal  guifg=#A6DB29 guibg=fg
hi MBEVisibleActiveChanged guifg=#F1266F guibg=fg

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

" Deoplete

" ALE
" need to install linters: flake8, pydocstyle, bandit, mypy
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1

let g:ale_go_gometalinter_options = '--fast'
let g:ale_go_go111module = 'auto'

let g:ale_completion_enabled = 1

let g:ale_linter_aliases = {
            \ 'Jenkinsfile': 'groovy',
            \ }

let g:ale_linters = {
            \ 'vim': ['vint', 'vimls'],
            \ 'go': ['golangci-lint', 'gofmt', 'gobuild', 'gopls', 'staticcheck'],
            \ 'python': ['flake8', 'pydocstyle', 'bandit', 'mypy'],
            \ }

let g:ale_fixers = {
            \ '*': ['remove_trailing_lines', 'trim_whitespace'],
            \ 'python': ['black'],
            \ 'go': ['gofmt', 'goimports'],
            \ }

" Use ALE and also some plugin 'foobar' as completion sources for all code.

inoremap <C-space> :ALEComplete<CR>
" nnoremap <C-j> :ALEDetail<CR>
" nnoremap <C-S-D>:AleDocumentation<CR>
" inoremap <C-Q><C-H>:AleHover<CR>
" inoremap <C-Q><C-H>:AleFindReference -vsplit<CR>
" inoremap <C-Q><C-G>:AleGoToDefinition -vsplit<CR>
" inoremap <C-Q><C-I>:AleOrganizeImports -vsplit<CR>

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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Filetypes
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" support yaml files
au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml foldmethod=indent
"au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
" support Jenkins files
au! BufNewFile,BufReadPost Jenkinsfile set filetype=Jenkinsfile foldmethod=indent

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

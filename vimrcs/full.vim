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
Plugin 'dense-analysis/ale'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'google/vim-jsonnet'
Plugin 'hashivim/vim-terraform'
Plugin 'junegunn/fzf.vim'
Plugin 'lgranie/vim-lsp-java'
Plugin 'majutsushi/tagbar'
Plugin 'mattn/vim-lsp-settings'
Plugin 'mileszs/ack.vim'
Plugin 'prabirshrestha/async.vim'
Plugin 'prabirshrestha/asyncomplete-lsp.vim'
Plugin 'prabirshrestha/asyncomplete.vim'
Plugin 'prabirshrestha/vim-lsp'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'sheerun/vim-polyglot'
Plugin 'tpope/vim-fugitive'

call vundle#end()

" Tagbar

nmap <C-T> :TagbarToggle<CR>

" NERDTree
let g:NERDTreeShowHidden=1

" lsp
let g:lsp_fold_enabled = 0
let g:lsp_auto_enable = 1
let g:lsp_diagnostics_enabled = 0         " disable diagnostics support
let g:lsp_signs_enabled = 1         " enable signs
let g:lsp_diagnostics_echo_cursor = 1 " enable echo under cursor when in
let g:asyncomplete_popup_delay = 15
let g:asyncomplete_auto_popup = 1
let g:lsp_settings = {
  \  'vim-langserver': {
  \    'disabled': 0,
  \   },
\}

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
            \ 'java': ['javac'],
            \ 'xml': ['xmllint'],
            \ }

let g:ale_fixers = {
            \ '*': ['remove_trailing_lines', 'trim_whitespace'],
            \ 'python': ['black', 'reorder-python-imports', 'autopep8'],
            \ 'go': ['gofmt', 'goimports'],
            \ 'java': ['google_java_format'],
            \ }
"

" Use ALE and also some plugin 'foobar' as completion sources for all code.

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

" ALE
" need to install linters: flake8, pydocstyle, bandit, mypy
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1

let g:ale_go_gometalinter_options = '--fast'
let g:ale_go_go111module = 'auto'

let g:ale_linter_aliases = {
            \ 'Jenkinsfile': 'groovy',
            \ }

let g:ale_linters = {
            \ 'ansible': 'ansible-lint',
            \ 'go': ['gometalinter', 'gofmt'],
            \ 'python': ['flake8', 'pydocstyle', 'bandit', 'mypy'],
            \ }

let g:ale_fixers = {
            \ '*': ['remove_trailing_lines', 'trim_whitespace'],
            \ 'python': ['black'],
            \ }

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

" all files
au! BufNewFile,BufReadPost * set foldmethod=indent ts=2 sts=2 sw=2 expandtab

" support terraform files
au! BufNewFile,BufReadPost *.{tf} set filetype=tf foldmethod=indent
autocmd FileType tf setlocal ts=2 sts=2 sw=2 expandtab

" support sql files
au! BufNewFile,BufReadPost *.{sql} set filetype=sql foldmethod=indent
autocmd FileType sql setlocal ts=2 sts=2 sw=2 expandtab

" support yaml files
au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml foldmethod=indent
" au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
" support Jenkins files
au! BufNewFile,BufReadPost Jenkinsfile set filetype=Jenkinsfile foldmethod=indent

" support json files
au! BufNewFile,BufReadPost *.{json} set filetype=json foldmethod=indent
autocmd FileType json setlocal ts=2 sts=2 sw=2 expandtab


" support Jenkins files
au! BufNewFile,BufReadPost *Jenkinsfile* set filetype=Jenkinsfile foldmethod=indent
autocmd FileType Jenkinsfile setlocal ts=2 sts=2 sw=2 expandtab

" support Jenkins files
au! BufNewFile,BufReadPost .{groovy} set filetype=groovy foldmethod=indent
autocmd FileType groovy setlocal ts=2 sts=2 sw=2 expandtab

" support markdown files
au! BufNewFile,BufReadPost *.{md} set filetype=markdown foldmethod=indent
autocmd FileType markdown setlocal ts=2 sts=2 sw=2 expandtab

" support markdown files
au! BufNewFile,BufReadPost *.{ts} set filetype=typescript foldmethod=indent
autocmd FileType typescript setlocal ts=2 sts=2 sw=2 expandtab

" support .dockerfile files
au! BufNewFile,BufReadPost *.{dockerfile} set filetype=dockerfile foldmethod=indent
autocmd FileType docckerfile setlocal ts=2 sts=2 sw=2 expandtab


" support .dockerfile files
au! BufNewFile,BufReadPost *.{py} set filetype=python foldmethod=indent
autocmd FileType python setlocal ts=4 sts=4 sw=4 expandtab

" support .dockerfile files
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

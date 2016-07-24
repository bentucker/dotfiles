runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()
set background=dark
set textwidth=90
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set cindent
set nu
set expandtab
set hlsearch
syntax on
filetype plugin indent on

let s:uname = system("uname")
if s:uname == "Darwin\n"
    set guifont=Inconsolata\ for\ Powerline:h14

    " enable powerline
    set rtp+=~/Library/Python/2.7/lib/python/site-packages/powerline/bindings/vim
endif

if has("gui_running")
    " set transparency=15
    set t_Co=16
endif

set laststatus=2
set statusline=%F%m%r%h%w\ [%{&ff}]\ [%Y]\ [%l,%v][%p%%]\ [%L]
let mapleader="`"

set term=xterm-256color
colors deep-space

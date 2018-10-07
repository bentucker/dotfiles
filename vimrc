" Pathogen load
filetype off
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()
execute pathogen#helptags()

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'christoomey/vim-tmux-navigator'

" All of your Plugins must be added before the following line
call vundle#end()            " required

set encoding=utf-8
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

" open NERDTree with Ctrl-N
nmap <C-n> :NERDTreeToggle<cr>

if has("gui_running")
    " set transparency=15
    set t_Co=16
    set guifont=Inconsolata\ for\ Powerline
else
    set t_Co=256
endif

let s:uname = system("uname")
if s:uname == "Darwin\n"
    set guifont=Inconsolata\ for\ Powerline:h14

    " enable powerline
    set rtp+=~/Library/Python/2.7/lib/python/site-packages/powerline/bindings/vim
endif

" Write all buffers before navigating from Vim to tmux pane
let g:tmux_navigator_save_on_switch = 2
" Disable tmux navigator when zooming the Vim pane
let g:tmux_navigator_disable_when_zoomed = 1

set laststatus=2
set statusline=%F%m%r%h%w\ [%{&ff}]\ [%Y]\ [%l,%v][%p%%]\ [%L]
let mapleader="`"

set term=xterm-256color

colors deep-space
let g:pymode_rope_autoimport = 0

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
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'flazz/vim-colorschemes'
Plugin 'w0rp/ale'

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

set undofile
set undodir=~/.vim/undodir
let s:undos = split(globpath(&undodir, '*'), "\n")
call filter(s:undos, 'getftime(v:val) < localtime() - (60 * 60 * 24 * 90)')
call map(s:undos, 'delete(v:val)')

augroup XML
    autocmd!
    autocmd FileType xml let g:xml_syntax_folding=1
    autocmd FileType xml setlocal foldmethod=syntax
    autocmd FileType xml :syntax on
    autocmd FileType xml :%foldopen!
augroup END

au BufNewFile,BufRead *.pgf set filetype=tex
let g:Tex_CompileRule_dvi = 'lualatex -interaction=nonstopmode $*'

" open NERDTree with Ctrl-N
nmap <C-n> :NERDTreeToggle<cr>

"if has("gui_running")
    "" set transparency=15
    "set t_Co=16
    "set guifont=Inconsolata\ for\ Powerline
"else
    "set t_Co=256
"endif

if &term =~ '256color'
    " disable Background Color Erase (BCE) so that color schemes
    " render properly when inside 256-color tmux and GNU screen.
    " see also http://sunaku.github.io/vim-256color-bce.html
    set t_ut=
endif

if has("termguicolors")
    " set true colors
    let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
    "set t_8f="\<Esc>[38;2;%lu;%lu;%lum"
    "set t_8b="\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
    "set t_8f=\[[38;2;%lu;%lu;%lum
    "set t_8b=\[[48;2;%lu;%lu;%lum
    "set termguicolors
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

colors deep-space
hi! Normal guibg=NONE ctermbg=NONE
hi! NonText ctermbg=NONE guibg=NONE
let g:pymode_rope_autoimport = 0

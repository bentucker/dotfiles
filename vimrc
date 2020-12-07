filetype off

" Try to load minpac.
packadd minpac

if !exists('g:loaded_minpac')
  " minpac is not available.

  " Settings for plugin-less environment.
else
  " minpac is available.
  call minpac#init()
  call minpac#add('k-takata/minpac', {'type': 'opt'})

  " Additional plugins here.
  call minpac#add('freeo/vim-kalisi')
  call minpac#add('w0ng/vim-hybrid')
  call minpac#add('bitterjug/vim-colors-bitterjug')
  call minpac#add('jonathanfilip/vim-lucius')
  call minpac#add('crusoexia/vim-monokai')
  call minpac#add('jacoborus/tender.vim')
  call minpac#add('pbrisbin/vim-colors-off')
  call minpac#add('muellan/am-colors')
  call minpac#add('blueshirts/darcula')
  call minpac#add('flazz/vim-colorschemes')

  call minpac#add('preservim/nerdtree', { 'on': 'NERDTreeToggle' })
  call minpac#add('Xuyuanp/nerdtree-git-plugin')
  call minpac#add('preservim/nerdcommenter')

  call minpac#add('vim-airline/vim-airline')
  call minpac#add('vim-airline/vim-airline-themes')

  call minpac#add('neoclide/coc.nvim', {'branch': 'release'})

  call minpac#add('christoomey/vim-tmux-navigator')
  call minpac#add('w0rp/ale')
  call minpac#add('python-mode/python-mode')
  call minpac#add('roxma/vim-tmux-clipboard')
  call minpac#add('tmux-plugins/vim-tmux-focus-events')
  call minpac#add('posva/vim-vue')
  call minpac#add('airblade/vim-gitgutter')
  call minpac#add('scalameta/coc-metals', {'do': 'yarn install --frozen-lockfile'})
  call minpac#add('vim-scripts/CycleColor')
  "call minpac#add('vim-syntastic/syntastic')
  call minpac#add('jmcantrell/vim-virtualenv')
  call minpac#add('tpope/vim-fugitive')
  call minpac#add('majutsushi/tagbar')

  " Make vim a first class Go development environment
  " https://github.com/fatih/vim-go
  call minpac#add('fatih/vim-go', { 'do': ':GoInstallBinaries' })

  " indentline
  " https://github.com/Yggdroot/indentLine
  call minpac#add('Yggdroot/indentLine')

  if has('nvim')
    call minpac#add('Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' })
  else
    call minpac#add('Shougo/denite.nvim')
    call minpac#add('roxma/nvim-yarp')
    call minpac#add('roxma/vim-hug-neovim-rpc')
  endif

  " minpac utility commands
  command! PackUpdate call minpac#update()
  command! PackClean call minpac#clean()
  command! PackStatus call minpac#status()

  " Plugin settings here.
endif

if exists('g:vscode')
    " VSCode extension
else
    " Auto start NERD tree when opening a directory
    autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | wincmd p | endif

    " Auto start NERD tree if no files are specified
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | exe 'NERDTree' | endif

    " Let quit work as expected if after entering :q the only window left open is NERD Tree itself
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
endif

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
let mapleader = ","

"disable showmode since using vim-airline; otherwise use 'set showmode'
set noshowmode

" file type recognition
filetype on
filetype plugin on
filetype indent on

" syntax highlighting
syntax on

" Make it easier to work with buffers
" http://vim.wikia.com/wiki/Easier_buffer_switching
set hidden
set confirm
set autowriteall
set wildmenu wildmode=full

" Start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
nnoremap <silent> <leader>tt :terminal<CR>
nnoremap <silent> <leader>tv :vnew<CR>:terminal<CR>
nnoremap <silent> <leader>th :new<CR>:terminal<CR>
tnoremap <C-x> <C-\><C-n><C-w>q

" Reload ~.vimrc with <leader>r
map <silent> <leader>r :source $MYVIMRC<CR> :echom "vimrc reloaded"<CR>

" Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y

" Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

" =====================================
" auto completion
" =====================================
set completeopt+=noinsert
set completeopt+=noselect
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#go#use_cache = 1

" toggle tagbar
nnoremap <silent> <leader>tb :TagbarToggle<CR>

" toggle line numbers
nnoremap <silent> <leader>n :set number! number?<CR>

" toggle line wrap
nnoremap <silent> <leader>w :set wrap! wrap?<CR>

" toggle buffer (switch between current and last buffer)
nnoremap <silent> <leader>bb <C-^>

" go to next buffer
nnoremap <silent> <leader>bn :bn<CR>

" go to previous buffer
nnoremap <silent> <leader>bp :bp<CR>
" https://github.com/neovim/neovim/issues/2048

" close buffer
nnoremap <silent> <leader>bd :bd<CR>

" kill buffer
nnoremap <silent> <leader>bk :bd!<CR>

" list buffers
nnoremap <silent> <leader>bl :ls<CR>
" list and select buffer
nnoremap <silent> <leader>bg :ls<CR>:buffer<Space>

" horizontal split with new buffer
nnoremap <silent> <leader>bh :new<CR>

" vertical split with new buffer
nnoremap <silent> <leader>bv :vnew<CR>

set undofile
set undodir=~/.vim/undodir
let s:undos = split(globpath(&undodir, '*'), "\n")
call filter(s:undos, 'getftime(v:val) < localtime() - (60 * 60 * 24 * 90)')
call map(s:undos, 'delete(v:val)')

"command! -nargs=0 Prettier :CocCommand prettier.formatFile
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
nmap <Leader>ws <Plug>(coc-metals-expand-decoration)

" Configuration for vim-scala
au BufRead,BufNewFile *.sbt set filetype=scala
autocmd FileType json syntax match Comment +\/\/.\+$+
augroup XML
    autocmd!
    autocmd FileType xml let g:xml_syntax_folding=1
    autocmd FileType xml setlocal foldmethod=syntax
    autocmd FileType xml :syntax on
    autocmd FileType xml :%foldopen!
augroup END

au BufNewFile,BufRead *.pgf set filetype=tex
let g:Tex_CompileRule_dvi = 'lualatex -interaction=nonstopmode $*'

" vim-vue
let g:vue_pre_processors = 'detect_on_enter'

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

" Write all buffers before navigating from Vim to tmux pane
let g:tmux_navigator_save_on_switch = 2
" Disable tmux navigator when zooming the Vim pane
let g:tmux_navigator_disable_when_zoomed = 1

"let g:airline_extensions = ['branch', 'tabline', 'denite', 'zoomwintab', 'fugitive', 'coc', 'bufferline']
"let g:airline_enable_branch=1
"let g:airline#extensions#coc#enabled = 1
"let airline#extensions#coc#error_symbol = 'E:'
"let airline#extensions#coc#warning_symbol = 'W:'
"let airline#extensions#coc#stl_format_err = '%E{[%e(#%fe)]}'
"let airline#extensions#coc#stl_format_warn = '%W{[%w(#%fw)]}'
"let g:airline_powerline_fonts = 1
"let g:loaded_vim_airline_zoomwintab = 1
"let g:airline#extensions#ale#enabled = 1
"let g:airline#extensions#branch#enabled = 1
"let g:airline#extensions#fugitive#enabled = 1
"let g:airline#extensions#branch#sha1_len = 10
"let g:airline#extensions#bufferline#enabled = 1
"let g:airline#extensions#bufferline#overwrite_variables = 1
"let g:airline#extensions#hunks#coc_git = 1
"let g:airline#extensions#promptline#enabled = 1
"let g:airline_section_z='%3p%% %#__accent_bold#%#__accent_yellow#%4l%#__restore__#:%3v'

set laststatus=2
"set statusline=%F%m%r%h%w\ [%{&ff}]\ [%Y]\ [%l,%v][%p%%]\ [%L]

colors slate
if has("gui_running")
    hi! Normal guibg=NONE ctermbg=NONE
    hi! NonText ctermbg=NONE guibg=NONE
else
    set bg=dark
endif
let g:pymode_rope_autoimport = 0

" Configuration for coc.nvim

" If hidden is not set, TextEdit might fail.
" set hidden
" 
" Some servers have issues with backup files
set nobackup
set nowritebackup

" You will have a bad experience with diagnostic messages with the default 4000.
set updatetime=300

" Don't give |ins-completion-menu| messages.
set shortmess+=c

" Always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Used in the tab autocompletion for coc
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Used to expand decorations in worksheets
nmap <Leader>ws <Plug>(coc-metals-expand-decoration)

" Use K to either doHover or show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType scala setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Trigger for code actions
" Make sure `"codeLens.enable": true` is set in your coc config
nnoremap <leader>cl :<C-u>call CocActionAsync('codeLensAction')<CR>

" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" Notify coc.nvim that <enter> has been pressed.
" Currently used for the formatOnType feature.
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
            \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Toggle panel with Tree Views
nnoremap <silent> <space>t :<C-u>CocCommand metals.tvp<CR>
" Toggle Tree View 'metalsBuild'
nnoremap <silent> <space>tb :<C-u>CocCommand metals.tvp metalsBuild<CR>
" Toggle Tree View 'metalsCompile'
nnoremap <silent> <space>tc :<C-u>CocCommand metals.tvp metalsCompile<CR>
" Reveal current current class (trait or object) in Tree View 'metalsBuild'
nnoremap <silent> <space>tf :<C-u>CocCommand metals.revealInTreeView metalsBuild<CR>

autocmd VimEnter * wincmd p

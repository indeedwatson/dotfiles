set background=dark
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
 call vundle#begin()
" " alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" Gist for vim
Bundle 'mattn/webapi-vim'
Bundle 'mattn/gist-vim'
" indentation guides
Plugin 'https://github.com/nathanaelkane/vim-indent-guides'
" automatic closing of quotes, parenthesis, brackets, etc
Plugin 'https://github.com/raimondi/delimitMate'
" syntax checking
Plugin 'https://github.com/scrooloose/syntastic'
" fuzzy file, buffer, tag finder
Plugin 'https://github.com/ctrlpvim/ctrlp.vim'
" buffer manager
Plugin 'https://github.com/jeetsukumaran/vim-buffergator'
" colors from wal
Plugin 'https://github.com/dylanaraps/wal'
" status/tabline
Plugin 'https://github.com/vim-airline/vim-airline'
" markdown
Plugin 'godlygeek/tabular'
Plugin 'https://github.com/plasticboy/vim-markdown'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line"

" format
set autoindent
set backup
set nu
set smartindent
set showmatch
set textwidth=80
set title
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set relativenumber
" syntax
set t_Co=256
syntax on

filetype on
filetype indent on
filetype plugin on
set modeline
set ls=2
set autoindent
set backspace=indent,eol,start
set complete-=i
set smarttab

let mapleader = "\<Space>"

nnoremap <Leader>o :CtrlP<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>g :Gist<CR>
nnoremap <Leader>q :q!<CR>
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" move lines up and down NOT WORKING
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv=

" powerline
let g:airline_powerline_fonts = 1

" Always show statusline
set laststatus=2

" Disable swap files
set noswapfile
set nobackup
set nowritebackup
if !&diff
    set undodir=~/.vim/undodir
    set undofile
endif

" Syntastic recommended settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" CtrlP and Buffergator settings from
" http://joshldavis.com/2014/04/05/vim-tab-madness-buffers-vs-tabs/

" CtrlP
" Setup some default ignores
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
\}

" Use the nearest .git directory as the cwd
" This makes a lot of sense if you are working on a project that is in version
" control. It also supports works with .svn, .hg, .bzr.
let g:ctrlp_working_path_mode = 'r'

" Use a leader instead of the actual named binding
nmap <leader>p :CtrlP<cr>

" Easy bindings for its various modes
nmap <leader>bb :CtrlPBuffer<cr>
nmap <leader>bm :CtrlPMixed<cr>
nmap <leader>bs :CtrlPMRU<cr>

" Buffergator
" Use the right side of the screen
let g:buffergator_viewport_split_policy = 'R'

" I want my own keymappings...
let g:buffergator_suppress_keymaps = 1

" Looper buffers
let g:buffergator_mru_cycle_loop = 1

" Go to the previous buffer open
nmap <leader>jj :BuffergatorMruCyclePrev<cr>

" Go to the next buffer open
nmap <leader>kk :BuffergatorMruCycleNext<cr>

" View the entire list of buffers open
nmap <leader>bl :BuffergatorOpen<cr>

" Shared bindings from Solution #1 from earlier
nmap <leader>T :enew<cr>
nmap <leader>bq :bp <BAR> bd #<cr>
" let g:hybrid_custom_term_colors = 1
colorscheme wal

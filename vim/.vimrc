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

" powerline
set rtp+=/usr/lib/python3.5/site-packages/powerline/bindings/vim
let g:Powerline_symbols = 'fancy'

" Always show statusline
set laststatus=2
" Keep swap files in separate folder
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//


" Syntastic recommended settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


" let g:hybrid_custom_term_colors = 1
colorscheme hybrid

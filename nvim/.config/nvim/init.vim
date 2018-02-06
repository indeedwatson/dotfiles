set background=dark
set foldenable
set foldlevelstart=0
set hidden
filetype plugin on


" Vundle stuff ----------------------------------------------------
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
 call vundle#begin()
" " alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'


" Plugins ---------------------------------------------------------
" wiki
Plugin 'vimwiki/vimwiki'
" Gist for vim
Bundle 'mattn/webapi-vim'
Bundle 'mattn/gist-vim'
" automatic closing of quotes, parenthesis, brackets, etc
Plugin 'https://github.com/raimondi/delimitMate'
" lint while you type
"Plugin 'w0rp/ale'
" colors from wal
" Plugin 'dylanaraps/wal.vim'
" monokai colorscheme
Plugin 'crusoexia/vim-monokai'
" tables
Plugin 'dhruvasagar/vim-table-mode'
" i3 syntax
Plugin 'https://github.com/PotatoesMaster/i3-vim-syntax'
" fzf
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
" Git wrapper
Plugin 'https://github.com/tpope/vim-fugitive'
" tabular
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
" taskwarrior plugin
Plugin 'tbabej/taskwiki'
" folding
Plugin 'nelstrom/vim-markdown-folding'
" sandwiched textobject
Plugin 'machakann/vim-sandwich'
" enhance in-buffer search
Plugin 'junegunn/vim-slash'
" status line
Plugin 'itchyny/lightline.vim'
" Show git diff in the gutter
Plugin 'airblade/vim-gitgutter'

" ------------------------------------------------------------------
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

" format ------------------------------------------------------------
set autoindent
set backup
set nu
set showmatch
set title
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set wildmenu
set wildmode=full
set termguicolors
set incsearch " highlight search term as you type
set ignorecase
set nonumber " don't display line numbers
" syntax
set t_Co=256
" enable is better than `on`, doesn't reset colors when sourcing config file
syntax enable
set modeline
set ls=2
set backspace=indent,eol,start
set complete-=i
set smarttab
" conceal symbols such as *italics* and **bold**
set conceallevel=2
" Always show statusline
set laststatus=2

" set transparent background and colorscheme
function! NoBackground() abort
    highlight Normal ctermbg=none guibg=none
    highlight NonText ctermbg=none guibg=none
    highlight LineNr ctermbg=none guibg=none
endfunction


augroup transparentBg
    autocmd!
    autocmd colorscheme * call NoBackground()
augroup END

colorscheme monokai

" binds --------------------------------------------------------------
" space as leader
let mapleader = "\<Space>"
" tab for folding
nnoremap <Leader><Tab> za
vnoremap <Leader><Tab> za
" make gist with leader-g
nnoremap <Leader>gi :Gist -a<CR>
nnoremap <Leader>G :Gist <CR>
" quit without saving with leader-q
nnoremap <Leader>q :q!<CR>
" Y copy to the end of line
nnoremap Y y$
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" move lines up and down with Ctrl + j/k in normal, insert and visual mode
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv=

" insert current date with F5 in normal and insert mode
nnoremap <F5> "=strftime("%Y.%m.%d %a")<CR>P 
inoremap <F5> <C-R>=strftime("%Y.%m.%d %a")<CR>

" remap tab for following links in vimwiki
nnoremap <Leader>n <Plug>VimwikiNextLink

" fugitive binds
nnoremap <space>gw :Gwrite<CR>
nnoremap <space>gs :Gstatus<CR>
nnoremap <space>gc :Gcommit<CR>
nnoremap <space>gp :Gpush<CR>

" Disable swap files
set noswapfile
set nobackup
set nowritebackup
if !&diff
    set undodir=~/.vim/undodir
    set undofile
endif

" text width 80 for specific file formats
augroup Formatting
    autocmd!
    autocmd BufNew,BufRead *.txt,*.py setlocal formatoptions=cqt textwidth=78 wrapmargin=0
augroup END

" set .md and .markdown to use markdown filetype
autocmd BufNewFile,BufReadPost *.md,*markdown set filetype=markdown formatoptions=cqt textwidth=137 wrapmargin=0
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']
" Markdown-compatible tables
let g:table_mode_corner='|'

" folding
let g:vimwiki_folding = 'expr' " folding based on expression
let g:markdown_folding_level = 0
let g:markdown_fold_style = 'nested'

" fzf settings -------------------------------------------------------
" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' }

" In Neovim, you can set up fzf window using a Vim command
" let g:fzf_layout = { 'window': 'enew' }
" let g:fzf_layout = { 'window': '-tabnew' }

" Customize fzf colors to match your color scheme
" let g:fzf_colors =
" \ { 'fg':      ['fg', 'Normal'],
"   \ 'bg':      ['bg', 'Normal'],
"   \ 'hl':      ['fg', 'Comment'],
"   \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
"   \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
"   \ 'hl+':     ['fg', 'Statement'],
"   \ 'info':    ['fg', 'PreProc'],
"   \ 'prompt':  ['fg', 'Conditional'],
"   \ 'pointer': ['fg', 'Exception'],
"   \ 'marker':  ['fg', 'Keyword'],
"   \ 'spinner': ['fg', 'Label'],
"   \ 'header':  ['fg', 'Comment'] }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" Open file with fzf
noremap <leader>f :Files<CR>
noremap <leader>/ :Find<CR>

" Mapping selecting mappings
" nmap <leader><tab> <plug>(fzf-maps-n)
" xmap <leader><tab> <plug>(fzf-maps-x)
" omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-rg)
imap <c-x><c-l> <plug>(fzf-complete-line)

" Advanced customization using autoload functions
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})

" Replace the default dictionary completion with fzf-based fuzzy completion
inoremap <expr> <c-x><c-k> fzf#complete('cat /usr/share/dict/words')


" Status line (neovim)

function! s:fzf_statusline()
  " Override statusline as you like
  highlight fzf1 ctermfg=161 ctermbg=251
  highlight fzf2 ctermfg=23 ctermbg=251
  highlight fzf3 ctermfg=237 ctermbg=251
  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction

autocmd! User FzfStatusLine call <SID>fzf_statusline()

" ripgrep for fzf
"
" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
" --color: Search color options

" Search for files containing a term
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --no-messages --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)

" use ripgrep for grepprg (vim search)
set grepprg=rg\ --vimgrep

" select buffer with fzf
function! s:buflist()
  redir => ls
  silent ls
  redir END
  return split(ls, '\n')
endfunction

function! s:bufopen(e)
  execute 'buffer' matchstr(a:e, '^[ 0-9]*')
endfunction

nnoremap <silent> <Leader>b :call fzf#run({
\   'source':  reverse(<sid>buflist()),
\   'sink':    function('<sid>bufopen'),
\   'options': '+m',
\   'down':    len(<sid>buflist()) + 2
\ })<CR>

" vimwiki settings ----------------------------------------------------------

let g:vimwiki_list = [{'path': '~/Dropbox/vimwiki/',
                     \ 'syntax': 'markdown', 'ext': '.md'}]
" code syntax highlight in code blocks
let wiki = {}
let wiki.automatic_nested_syntaxes = 1
" alternating header colors
let g:vimwiki_hl_headers = 1
let g:vimwiki_url_maxsave=1

let g:lightline = {
        \ 'colorscheme': 'molokai',
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ],
        \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
        \ },
        \ 'component_function': {
        \   'gitbranch': 'fugitive#head'
        \ },
        \ }


let g:gist_put_url_to_clipboard_after_post = 1

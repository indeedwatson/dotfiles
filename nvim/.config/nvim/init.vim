" Plugins ---------------------------------------------------------
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/bundle')
" wiki
Plug 'vimwiki/vimwiki'
" Gist for vim
Plug 'mattn/webapi-vim'
Plug 'mattn/gist-vim'
" automatic closing of quotes, parenthesis, brackets, etc
Plug 'jiangmiao/auto-pairs'
Plug 'dylanaraps/wal.vim'
" tables
" Plug 'dhruvasagar/vim-table-mode'
" i3 syntax
Plug 'https://github.com/PotatoesMaster/i3-vim-syntax'
" fzf
Plug 'junegunn/fzf' | Plug 'junegunn/fzf.vim'
" Git wrapper
Plug 'https://github.com/tpope/vim-fugitive'
" tabular
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'tbabej/taskwiki'
Plug 'nelstrom/vim-markdown-folding'
" sandwiched textobject
Plug 'machakann/vim-sandwich'
" enhance in-buffer search
Plug 'junegunn/vim-slash'
" status line
Plug 'itchyny/lightline.vim'
" Show git diff in the gutter
Plug 'airblade/vim-gitgutter'
" distraction-free mode
Plug 'junegunn/goyo.vim'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'thinca/vim-quickrun'

call plug#end()


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
set incsearch " highlight search term as you type
set ignorecase
set noshowmode
set number relativenumber
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
set colorcolumn=80

let s:error_sign = '✘'
" set background=dark
set foldenable
set foldmethod=indent
set foldlevelstart=0
set hidden
set wildignorecase

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

augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter    * set norelativenumber
augroup END

colorscheme wal

" maps --------------------------------------------------------------
" space as leader
let mapleader = "\<Space>"
" comma for folding
nnoremap , za
vnoremap , za
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
" open file under cursor with default app
nnoremap gO :!xdg-open <cfile><CR><CR>

" insert current date with F5 in normal and insert mode
nnoremap <F1> "=strftime("%Y.%m.%d %a")<CR>P 
inoremap <F1> <C-R>=strftime("%Y.%m.%d %a")<CR>
" display a column at 80 char
nnoremap <F2> :let &cc = &cc == '' ? '80' : ''<CR>
" source init.vim
nnoremap <F5> :so ~/.config/nvim/init.vim<CR>

" move lines up and down with Ctrl + j/k in normal, insert and visual mode
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv=

" mappings for terminal mode
if has('nvim')
    tnoremap <A-c> <C-\><C-n>
    tnoremap <A-h> <C-\><C-n><C-w>h
    tnoremap <A-j> <C-\><C-n><C-w>j
    tnoremap <A-k> <C-\><C-n><C-w>k
    tnoremap <A-l> <C-\><C-n><C-w>l
    nnoremap <A-h> <C-w>h
    nnoremap <A-j> <C-w>j
    nnoremap <A-k> <C-w>k
    nnoremap <A-l> <C-w>l
    nnoremap <A-c> :close<CR>
endif

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

" remember cursor position when opening a file
augroup resCur
    autocmd!
    autocmd BufReadPost * call setpos(".", getpos("'\'"))
augroup END

" text width 80 for specific file formats
augroup Formatting
    autocmd!
    autocmd BufNew,BufRead *.txt,*.py setlocal formatoptions=cqt textwidth=80
                \ colorcolumn=80 wrapmargin=0
augroup END

" set .md and .markdown to use markdown filetype
augroup markdown
    autocmd BufNewFile,BufReadPost *.md,*markdown set filetype=markdown
                \ formatoptions=cqt textwidth=137 wrapmargin=0
    let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']
augroup END

autocmd FileType python nnoremap <buffer> <F9> :exec '!python' 
                \shellescape(@%, 1)<cr>
command! -buffer RunPy3Script split | resize 15 | terminal python3 %
nnoremap <buffer> <F8> :RunPy3Script<CR>
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
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'
" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1
let g:fzf_commits_log_options = '--graph --colors=always
            \--format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" Open file with fzf
noremap <leader>f :FZF ~/<CR>
noremap <leader>wf :FZF ~/Dropbox/vimwiki<CR>
noremap <leader>/ :Rg<CR>
noremap <leader>b :Buffers<CR>

" Insert mode completion
imap <c-x><c-j> <plug>(fzf-complete-file-rg)
imap <c-f> <plug>(fzf-complete-path)
imap <c-l> <plug>(fzf-complete-line)
imap <c-d> <plug>(fzf-complete-word)

" Advanced customization using autoload functions
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})

" Replace the default dictionary completion with fzf-based fuzzy completion
inoremap <expr> <c-x><c-k> fzf#complete('cat /usr/share/dict/words')


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
" --glob: Additional conditions for search (in this case ignore everything in 
"  the .git/ folder)
" --color: Search color options

" Search for files containing a term
command! -bang -nargs=* Rg
    \ call fzf#vim#grep(
    \ 'rg --column --line-number --no-heading --no-ignore --smart-case --hidden
    \ --color=always '.shellescape(<q-args>), 1,
    \   <bang>0 ? fzf#vim#with_preview('up:60%')
    \           : fzf#vim#with_preview('right:50%:hidden', '?'),
    \   <bang>0)
" use ripgrep for grepprg (vim search)
set grepprg=rg\ --vimgrep

autocmd! FileType fzf
autocmd FileType fzf set laststatus=0 noshowmode noruler
    \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

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
        \ 'colorscheme': 'wal',
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ],
        \             [ 'gitbranch', 'readonly', 'absolutepath', 'modified' ] ],
        \   'right': [ [ 'lineinfo' ], [ 'percent', 'wordcount' ],
        \               [ 'filetype' ] ]
        \ },
        \ 'component_function': {
        \   'gitbranch': 'fugitive#head',
        \   'wordcount': 'WordCount',
        \ },
        \ }


let g:gist_put_url_to_clipboard_after_post = 1

" follow symlinks always
" https://www.reddit.com/r/vim/comments/1x5rhh/how_to_follow_symlinks/cfbck18/
function! MyFollowSymlink(...)
if exists('w:no_resolve_symlink') && w:no_resolve_symlink
return
endif
let fname = a:0 ? a:1 : expand('%')
if fname =~ '^\w\+:/'
    " do no mess with fugitive:// etc
    return
endif
let fname = simplify(fname)

let resolvedfile = resolve(fname)
if resolvedfile == fname
    return
endif
let resolvedfile = fnameescape(resolvedfile)
"echohl WarningMsg | echomsg 'Resolving syminlk' fname '=>' resolvedfile |
"\ echohl None
exec 'file ' . resolvedfile
endfunction

command! FollowSymlink call MyfollowSymlink()
command! ToggleFollowSymlink let w:no_resolve_symlink = !get(w:, 
            \ 'no_resolve_symlink', 0) | echo "w:no_resolve_symlink =>"
            \ w:no_resolve_symlink

augroup FollowSymlinks
    au BufReadPost * call MyFollowSymlink(expand('<afile>'))
augroup END

" tests -----------------------------------------------------------------------

" https://gist.github.com/cormacrelf/d0bee254f5630b0e93c3
function! WordCount()
    let currentmode = mode()
    if !exists("g:lastmode_wc")
        let g:lastmode_wc = currentmode
    endif
    " if we modify file, open a new buffer, be in visual ever, or switch modes
    " since last run, we recompute.
    if &modified || !exists("b:wordcount") || currentmode =~? '\c.*v' ||
    \ currentmode != g:lastmode_wc
        let g:lastmode_wc = currentmode
        let l:old_position = getpos('.')
        let l:old_status = v:statusmsg
        execute "silent normal g\<c-g>"
        if v:statusmsg == "--No lines in buffer--"
            let b:wordcount = 0
        else
            let s:split_wc = split(v:statusmsg)
            if index(s:split_wc, "Selected") < 0
                let b:wordcount = str2nr(s:split_wc[11])
            else
                let b:wordcount = str2nr(s:split_wc[5])
            endif
            let v:statusmsg = l:old_status
        endif
        call setpos('.', l:old_position)
        return b:wordcount
    else
        return b:wordcount
    endif
endfunction
highlight ColorColumn ctermbg=18

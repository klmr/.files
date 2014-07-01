" Basic settings {{{
set nocompatible
set nobackup
set ignorecase
set smartcase
set incsearch
set hlsearch

set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set ruler
set cursorline
set nowrap

set guioptions-=T

set autoindent
set smartindent

set nojoinspaces
" }}}

" Vundle {{{
source ~/.vim/vundle.vim
" }}}

" Resume basic settings {{{
filetype on
syntax on
filetype plugin on
filetype indent on
" }}}

" Syntax colouring {{{

set bg=dark
let g:solarized_visibility="low"
colorscheme solarized

" }}}

" Behaviour {{{
set foldmethod=marker
set foldcolumn=2

set undofile
set undodir=~/.vim/undo

set autoread
set autowrite

nnoremap <silent> <leader>v V`]
vnoremap < <gv
vnoremap > >gv
vnoremap = =gv

" Stay on word hit instead of jumping to next
nnoremap * *<C-O>

set list
set listchars=tab:▸-,trail:·,extends:»,precedes:«,nbsp:⍽

set switchbuf=usetab,newtab
" Speling {{{
set spell
set spelllang=en_gb
" }}}

let g:Powerline_symbols = 'fancy'
let g:ycm_confirm_extra_conf = 0
let g:ycm_error_symbol = '⚡︎ '
let g:ycm_warning_symbol = '⚠︎ '
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
" }}}

" Filetype settings {{{
let g:is_bash=1

autocmd FileType make setlocal noexpandtab

autocmd BufNewFile,BufRead *.md set filetype=markdown

autocmd FileType html set wrap linebreak
autocmd FileType text set wrap linebreak
autocmd BufRead README set wrap linebreak
autocmd FileType markdown set wrap linebreak
autocmd FileType markdown setlocal textwidth=80

autocmd FileType cpp nnoremap <silent> <leader>b :make %:t:r<CR>
autocmd FileType cpp inoremap {<CR>  {<CR>}<Esc>O

" Lots of editors like Eclipse or R-Studio do this. I find it annoying.
"autocmd FileType cpp inoremap () ()<Esc>i
"autocmd FileType cpp inoremap {} {}<Esc>i
"autocmd FileType cpp inoremap [] []<Esc>i
"autocmd FileType cpp inoremap <> <><Esc>i

let vimrplugin_insert_mode_cmds = 0
let vimrplugin_assign_map = "<C-j>"

let g:tex_flavor = "latex"

autocmd FileType tex set wrap linebreak

autocmd FileType python set omnifunc=pythoncomplete#Complete

autocmd FileType ruby setlocal tabstop=2 shiftwidth=2
" }}}

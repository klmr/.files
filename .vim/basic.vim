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

set t_Co=256
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

set title
"set mouse=a

set laststatus=2

nnoremap <silent> <leader>v V`]
vnoremap < <gv
vnoremap > >gv
vnoremap = =gv

" Stay on word hit instead of jumping to next
nnoremap * *<C-O>

set list
set listchars=tab:▸-,trail:·,extends:»,precedes:«,nbsp:⍽

set formatoptions=tcq

set colorcolumn=81

set switchbuf=usetab,newtab
" Speling {{{
set spell
set spelllang=en_gb
" }}}

let g:ycm_confirm_extra_conf = 0
let g:ycm_error_symbol = '⚡︎ '
let g:ycm_warning_symbol = '⚠︎ '
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts=1
" }}}

" Filetype settings {{{
let g:is_bash=1

autocmd FileType make setlocal noexpandtab

autocmd BufNewFile,BufRead *.md set filetype=markdown
autocmd BufNewFile,BufRead *.r.brew set filetype=r
autocmd BufNewFile,BufRead *.rmd.brew set filetype=rmd

autocmd FileType html set wrap linebreak
autocmd FileType text set wrap linebreak
autocmd BufRead README set wrap linebreak
autocmd FileType markdown set wrap linebreak
autocmd FileType markdown setlocal textwidth=80
autocmd FileType markdown setlocal formatoptions=tcq

autocmd FileType cpp nnoremap <silent> <leader>b :make %:t:r<CR>
autocmd FileType cpp inoremap {<CR>  {<CR>}<Esc>O

let R_path = "~/.R/"
let R_app = "launcher.sh"
let R_args = ['--quiet']
let R_silent_term = 1
let R_vsplit = 1
let R_in_buffer = 0
let R_applescript = 0
let R_tmux_split = 1
let R_nvim_wd = 1
let R_tmpdir = "~/.tmp/Nvim-R"

" The following doesn’t work
"set <M-->=-
"let R_assign_map = "<M-->"
let R_assign = 0
let R_rmd_environment = "new.env(parent = emptyenv())"

autocmd VimResized * let R_rconsole_width = winwidth(0) / 2

let g:tex_flavor = "latex"
let g:tex_no_error = 1

autocmd FileType tex set wrap linebreak textwidth=80

autocmd FileType python set omnifunc=pythoncomplete#Complete

autocmd FileType ruby setlocal tabstop=2 shiftwidth=2
" }}}

runtime legacy.vim
runtime plugins.vim

set modeline

set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab

set ruler
set cursorline
set nowrap

set ignorecase
set smartcase
set incsearch
set hlsearch

set nojoinspaces

set hidden

set background=dark
let g:solarized_visibility = 'low'
colorscheme solarized

set undofile
set autoread
set autowrite

set splitbelow
set splitright

" set list
" set listchars=tab:→ ,trail:·,extends:»,precedes,«,nbsp:⍽

set textwidth=80
set colorcolumn=+1,+41
highlight ColorColumn ctermbg=24

set spell
set spelllang=en_gb

" Force guicursor
set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor

set conceallevel=1

runtime shortcuts.vim
runtime ft.vim

if has('nvim')
    tnoremap <Esc> <C-\><C-n>
endif

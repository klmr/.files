runtime plugins.vim

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

set list
" FIXME: The following causes Vim to fail to display tabs properly
" set listchars="tab:→ ,trail:·,extends:»,precedes,«,nbsp:⍽"

set textwidth=80
set colorcolumn=+1,+41
highlight ColorColumn ctermbg=24

set spell
set spelllang=en_gb

runtime shortcuts.vim
runtime ft.vim

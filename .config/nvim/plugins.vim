call plug#begin()
Plug 'airblade/vim-gitgutter'
Plug 'altercation/vim-colors-solarized'
Plug 'jalvesaq/R-Vim-runtime'
Plug 'jalvesaq/Nvim-R'
Plug 'kien/ctrlp.vim'
Plug 'klmr/vim-snakemake'
Plug 'micha/vim-colors-solarized'
Plug 'moby/moby' , {'rtp': '/contrib/syntax/vim/'}
Plug 'plasticboy/vim-markdown'
Plug 'raghur/vim-ghost', {'do': ':GhostInstall'}
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'w0rp/ale'
call plug#end()

let g:ale_sign_error = '❌ '
let g:ale_sign_warning = '⚠️ '

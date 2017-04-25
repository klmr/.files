filetype off

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#rc()

Bundle 'altercation/vim-colors-solarized'
Bundle 'airblade/vim-gitgutter'
Bundle 'derekwyatt/vim-scala'
Bundle 'gmarik/Vundle.vim'
Bundle 'groenewege/vim-less'
Bundle 'jalvesaq/R-Vim-runtime'
Bundle 'jalvesaq/Nvim-R'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'kien/ctrlp.vim'
Bundle 'majutsushi/tagbar'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-markdown'
Bundle 'Valloric/YouCompleteMe'
Bundle 'Valloric/MatchTagAlways'
Bundle 'vim-airline/vim-airline'
Bundle 'vim-airline/vim-airline-themes'
Bundle 'https://bitbucket.org/johanneskoester/snakemake.git', {'rtp': 'misc/vim/'}

" Restore
filetype on

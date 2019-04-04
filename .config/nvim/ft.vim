" let g:LanguageClient_autoStart = 1
" let g:LanguageClient_serverCommands = {
"             \ 'cpp': ['/Users/konrad/source/jacobdufault/cquery/build/app', '--language-server', '--cacheDirectory', 'file:///Users/tmp', '--rootUri', 'file://' . expand('%')],
"             \ }

" nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
" nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
" nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>

" Bash {{{
let g:is_bash = 1
" }}}

" C++ {{{
autocmd FileType cpp setlocal commentstring=//\ %s
autocmd FileType cpp nnoremap <leader>b :make<CR>
" }}}

" LaTeX {{{
let g:tex_flavor = 'latex'
let g:tex_no_error = 1
" }}}

" R {{{
let R_path = '~/.config/R'
let R_cmd = 'R'
let R_app = 'launcher'
" let R_args = ['--quiet']
let R_args = []
let R_silent_term = 1
let R_in_buffer = 0
" let R_tmux_split = 1
let R_source = expand('<sfile>:h') . '/plugged/Nvim-R/R/tmux_split.vim'
let R_nvim_wd = 1
let R_tmpdir = $TMPDIR . 'Nvim-R'
let R_assign = 0
let R_rmd_environment = 'new.env(parent = emptyenv())'
let r_indent_align_args = 0

autocmd VimResized * let R_rconsole_width = winwidth(0) / 2
" }}}

" Bash {{{
let g:is_bash = 1
" }}}

" C++ {{{
" let g:clang_library_path='/usr/lib/llvm-3.6/lib/libclang.so.1'
" let g:clang_library_path='/usr/lib/x86_64-linux-gnu/libclang-3.6.so.1'
autocmd FileType cpp setlocal commentstring=//\ %s
autocmd FileType cpp nnoremap <leader>b :make<CR>
" }}}

" LaTeX {{{
let g:tex_flavor = 'latex'
let g:tex_no_error = 1
" }}}

" Markdown {{{
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_frontmatter = 1
" }}}

" R {{{
let R_path = '~/.config/R'
let R_app = 'launcher'
" let R_path = '/usr/bin'
" let R_app = 'R'
let R_cmd = 'R'
"let R_args = ['--quiet']
let R_args = []
let R_bracketed_paste = 1
let R_silent_term = 1
let R_in_buffer = 0
let R_tmux_split = 1
let R_nvim_wd = 1
if exists("$TMPDIR")
    let R_tmpdir = $TMPDIR . 'Nvim-R'
else
    let R_tmpdir = '/tmp/Nvim-r'
endif
let R_assign = 0
let R_rmd_environment = 'new.env(parent = emptyenv())'
let r_indent_align_args = 0

autocmd VimResized * let R_rconsole_width = winwidth(0) / 2
" }}}

" GDB {{{
autocmd BufRead,BufNewFile *.gdb set filetype=gdb
" }}}

" Called after everything just before setting a default colorscheme
" Configure you own bindings or other preferences. e.g.:

" set nonumber " No line numbers
" let g:gitgutter_signs = 0 " No git gutter signs
" let g:SignatureEnabledAtStartup = 0 " Do not show marks
" nmap s :MultipleCursorsFind
" colorscheme hybrid
" let g:lightline['colorscheme'] = 'wombat'
" ...

" Move around splits with <c-hjkl>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" sayonara on leader q
nnoremap <silent> <leader>q :Sayonara<cr>

" set colorscheme
colorscheme codedark

" end of line things
set noeol
set nofixendofline

" don't run jsx plugins on normal .js/.ts files
let g:jsx_ext_required = 1

" use fullstory/ as project root
let g:rooter_patterns = ['fullstory/']

" Prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" coc-k

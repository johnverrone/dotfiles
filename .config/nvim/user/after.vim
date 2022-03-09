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
nnoremap <silent> <leader>Q :Sayonara<cr>
nnoremap <silent> <leader>q :Sayonara!<cr>

" set colorscheme
colorscheme codedark
let g:airline_theme = 'codedark'

" shiftwidth
set expandtab
set shiftwidth=2

" end of line things
set noeol
set nofixendofline

" don't run jsx plugins on normal .js/.ts files
let g:jsx_ext_required = 1

" use fullstory/ as project root
let g:rooter_patterns = ['=fullstory']

" Prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Close all but current buffers
command! BufOnly silent! execute "%bd|e#|bd#"

" Customize FZFRg
command! -bang -nargs=* FZFRg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

" Auto toggle to relative line numbers on focused, normal mode files
set rnu

" Intellegintly toggle line number type
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set rnu
  autocmd BufLeave,FocusLost,InsertEnter * set nornu
augroup END

" Use html type for htmto files
au BufRead,BufNewFile *.htmto set filetype=html

" Shortcut to open etc/localdev/featureflags.yaml
command Flags edit $FS_HOME/etc/localdev/featureflags.yaml
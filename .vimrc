""""""""""""""""""""""""""""""""""
" John Verrone
""""""""""""""""""""""""""""""""""
let mapleader=","

call pathogen#infect()

""""""""""""""""""""""""""""""""""
" => Colors and Font
""""""""""""""""""""""""""""""""""
syntax on
set number
set relativenumber
set cursorline

set background=dark
colorscheme solarized   

""""""""""""""""""""""""""""""""""
" => Tabs and indent 
""""""""""""""""""""""""""""""""""
set tabstop=2
set shiftwidth=2
set softtabstop=2

set expandtab
set smarttab

filetype plugin on
filetype indent on
nnoremap <leader>f gg=G

""""""""""""""""""""""""""""""""""
" => Moving Around 
""""""""""""""""""""""""""""""""""

" Move around splits with <c-hjkl>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

""""""""""""""""""""""""""""""""""
" => Search 
""""""""""""""""""""""""""""""""""

set incsearch
set hlsearch

nnoremap <space> :nohlsearch<CR>
set wildignore=*.swp,*.bak,*.pyc,*.class

" Jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

""""""""""""""""""""""""""""""""""
" => Other 
""""""""""""""""""""""""""""""""""
set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%03V%)
set visualbell      " don't beep
set noerrorbells    " don't beep
set hidden          " allow switching files with unsaved changes
set autowrite       " auto save files on :make or :GoBuild

""""""""""""""""""""""""""""""""""
" => Plugins 
""""""""""""""""""""""""""""""""""

" ctrl-p (to search for files)
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/log/*,*/vendor/bundle,*/vendor/bower*,*/node_modules,*/coverage/*,*/build/*

" Open NERDTree with ctrl-n
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeWinSize=40

" Allow jsx syntax with .js extension
let g:jsx_pragma_required = 0

" vim-go import on save
let g:go_fmt_command = "goimports"


""""""""""""""""""""""""""""""""""
" => Functions 
""""""""""""""""""""""""""""""""""

function! ToggleNumber()
  if (&relativenumber == 1)
    set norelativenumber
    set number
  else
    set relativenumber
  endif
endfunc
map <leader>n :call ToggleNumber()<cr>

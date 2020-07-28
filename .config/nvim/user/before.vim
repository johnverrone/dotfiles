" Called before everything, even before loading plugins
" Do things that need to happen very early such as:
" let g:fzf_command_prefix = 'Fuzzy'
" ...

let g:coc_config_home="$HOME/.config/nvim/user/"

function! s:deregister(repo)
  let repo = substitute(a:repo, '[\/]\+$', '', '')
  let name = fnamemodify(repo, ':t:s?\.git$??')
  call remove(g:plugs, name)
  call remove(g:plugs_order, index(g:plugs_order, name))
endfunction

command! -nargs=1 -bar UnPlug call s:deregister(<args>)

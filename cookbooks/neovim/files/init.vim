if &compatible
  set nocompatible
endif

let $CONFIG = empty($XDG_CONFIG_HOME) ? expand('~/.config') : expand($XDG_CONFIG_HOME)
let $CACHE = empty($XDG_CACHE_HOME) ? expand('~/.cache') : expand($XDG_CACHE_HOME)

if !isdirectory($CACHE)
  call mkdir($CACHE)
endif

function! s:load_config(name)
  let l:path = resolve(expand('$CONFIG/nvim/' . a:name . '.vim'))
  execute 'source' fnameescape(l:path)
endfunction

call s:load_config('base')
call s:load_config('dein')
call s:load_config('options')
call s:load_config('keymap')
call s:load_config('denite')

syntax enable
filetype plugin indent on

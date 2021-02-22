" Configuration for dein
"
" https://github.com/Shougo/dein.vim
" https://github.com/Shougo/dein.vim/blob/master/doc/dein.txt

function! s:load(name)
  call dein#load_toml(expand('$CONFIG/nvim/dein/') . a:name . '.toml', {'lazy': 0})
endfunction

function! s:load_lazy(name)
  call dein#load_toml(expand('$CONFIG/nvim/dein/') . a:name . '.toml', {'lazy': 1})
endfunction

let s:base = expand('$CACHE/dein')

if &runtimepath !~# '/dein.vim'
  let s:repo_dir = s:base . '/repos/github.com/Shougo/dein.vim'

  if !isdirectory(s:repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:repo_dir
  endif

  execute 'set runtimepath^=' . s:repo_dir
endif

let g:dein#install_progress_type = 'title'
let g:dein#enable_notification = 1
let g:dein#install_log_filename = "~/dein.log"

call dein#begin(s:base)

call s:load('base')
call s:load('lang')
call s:load_lazy('lazy')

call dein#end()

call dein#save_state()

if has('vim_starting') && dein#check_install()
  call dein#install()
endif

" Denite.vim
call denite#custom#option('default', 'prompt', '>')

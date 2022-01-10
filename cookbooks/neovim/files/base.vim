if &encoding !=# 'utf-8'
  set encoding=utf-8
endif

scriptencoding utf-8

language message C

filetype off
filetype plugin indent off

let g:python3_host_prog = expand($HOME . '/.asdf/shims/python3')

let g:mapleader = "\<Space>"
let g:maplocalleader = ','

nnoremap "\<Space>" <Nop>
nnoremap ',' <Nop>

set background=dark
augroup MyColor
  autocmd!
  autocmd VimEnter * nested colorscheme default
augroup END

" augroup DeleteSpace
"   autocmd!
"   autocmd BufWritePre * :%s/\s\+$//ge
" augroup END

augroup HighlightTrailingSpaces
  autocmd!
  autocmd VimEnter,WinEnter,ColorScheme * highlight TrailingSpaces term=underline guibg=Red ctermbg=Red
  autocmd VimEnter,WinEnter * match TrailingSpaces /\s\+$/
augroup END

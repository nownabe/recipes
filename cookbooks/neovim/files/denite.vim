if executable('rg')
  call denite#custom#var('file/rec', 'command',
    \ ['rg', '--files', '--hidden', '--glob', '!.git'])
else
  call denite#custom#var('file/rec', 'command',
    \ ['ag', '--follow', '--nocolor', '--nogroup', '--hidden', '-g', '.', '--ignore', '.git'])
endif


autocmd FileType denite cal s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer> j <Nop>
  nnoremap <silent><buffer> k <Nop>

  nnoremap <silent><buffer> <C-j> j
  nnoremap <silent><buffer> <C-k> k

  nnoremap <silent><buffer><expr> i denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> a denite#do_map('open_filter_buffer')

  nnoremap <silent><buffer><expr> <CR> denite#do_map('do_action', 'open')
  nnoremap <silent><buffer><expr> <C-v> denite#do_map('do_action', 'vsplit')
  nnoremap <silent><buffer><expr> <C-h> denite#do_map('do_action', 'split')

  nnoremap <silent><buffer><expr> q denite#do_map('quit')
  nnoremap <silent><buffer><expr> jj denite#do_map('quit')
  nnoremap <silent><buffer><expr> <ESC> denite#do_map('quit')
  nnoremap <silent><buffer><expr> <C-c> denite#do_map('quit')
endfunction

autocmd FileType denite-filter call s:denite_filter_my_settings()
function! s:denite_filter_my_settings() abort
  imap <silent><buffer> <C-j> <CR>
  inoremap <silent><buffer><expr> <C-c> denite#do_map('quit')
  nnoremap <silent><buffer><expr> <C-c> denite#do_map('quit')
endfunction

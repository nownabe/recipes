" Altenative escape
:imap jj <Esc>

" Windows
nnoremap <silent> <Leader>wh <C-w>h
nnoremap <silent> <Leader>wj <C-w>j
nnoremap <silent> <Leader>wk <C-w>k
nnoremap <silent> <Leader>wl <C-w>l

" denite.vim
nnoremap <silent> <Leader>ff :Denite file/rec file:new<CR>
nnoremap <silent> <Leader>fb :Denite buffer<CR>
nnoremap <silent> <Leader>fn :Denite file file:new<CR>

" vim-lsp
nnoremap <silent> <Leader>lh :LspHover<CR>
nnoremap <silent> <Leader>ld :LspDefinition<CR>
nnoremap <silent> <Leader>li :LspImplementation<CR>
nnoremap <silent> <Leader>lr :LspReferences<CR>
nnoremap <silent> <Leader>ln :LspRename<CR>
nnoremap <silent> <Leader>lt :LspTypeDefinition<CR>

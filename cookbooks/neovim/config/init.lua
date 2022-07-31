require('impatient')

-- Global =====================================================

vim.g.mapleader = ' '
vim.g.maplocalleader = ','

vim.g.python3_host_prog = vim.fn.expand('$HOME/.asdf/shims/python3')

-- Options ====================================================

vim.opt.autoindent    = true
vim.opt.background    = 'dark'
vim.opt.backupdir     = vim.fn.expand('$HOME/.vimbackup')
vim.opt.backspace     = 'indent,eol,start'
vim.opt.concealcursor = 'nc'
vim.opt.conceallevel  = 2
vim.opt.cursorline    = true
vim.opt.directory     = vim.fn.expand('$HOME/.vimbackup')
vim.opt.display       = 'msgsep'
vim.opt.expandtab     = true
vim.opt.hidden        = true
vim.opt.ignorecase    = true
vim.opt.inccommand    = "nosplit"
vim.opt.incsearch     = true
vim.opt.laststatus    = 3
vim.opt.lazyredraw    = true
vim.opt.list          = true
vim.opt.mouse         = 'nvih'
vim.opt.number        = true
vim.opt.ruler         = true
vim.opt.scrolloff     = 5
vim.opt.shiftwidth    = 2
vim.opt.signcolumn    = 'yes:1'
vim.opt.showmatch     = true
vim.opt.smartcase     = true
vim.opt.smarttab      = true
vim.opt.smartindent   = true
vim.opt.softtabstop   = 2
vim.opt.synmaxcol     = 500
vim.opt.tabstop       = 2
vim.opt.termguicolors = true
vim.opt.textwidth     = 100
vim.opt.title         = true
vim.opt.ttimeout      = true
vim.opt.ttimeoutlen   = 50
vim.opt.undofile      = true
vim.opt.whichwrap     = 'b,s,h,l,<,>,~,[,]'
vim.opt.wrapscan      = true

vim.api.nvim_command('highlight CursorLine gui=underline guifg=NONE guibg=NONE')

-- Plugin Config ==============================================

require('config/telescope')
require('config/nightfox')


-- Keymaps ====================================================

vim.keymap.set({'i'}, 'jj', '<Esc>')

-- windows
vim.keymap.set({'n'}, '<Leader>wh', '<C-w>h')
vim.keymap.set({'n'}, '<Leader>wj', '<C-w>j')
vim.keymap.set({'n'}, '<Leader>wk', '<C-w>k')
vim.keymap.set({'n'}, '<Leader>wl', '<C-w>l')

-- Telescope
vim.keymap.set({'n'}, '<Leader>ff', '<cmd>Telescope find_files<cr>')
vim.keymap.set({'n'}, '<Leader>fb', '<cmd>Telescope buffers<cr>')
vim.keymap.set({'n'}, '<Leader>fg', '<cmd>Telescope live_grep<cr>')
vim.keymap.set({'n'}, '<Leader>fh', '<cmd>Telescope help_tags<cr>')
vim.keymap.set({'n'}, '<Leader>fc', '<cmd>Telescope commands<cr>')
vim.keymap.set({'n'}, '<Leader>fk', '<cmd>Telescope keymaps<cr>')
vim.keymap.set({'n'}, '<Leader>fn', '<cmd>Telescope file_browser<cr>')


-- Commands ===================================================

vim.cmd([[command! PackerInstall packadd packer.nvim | lua require('plugins').install()]])
vim.cmd([[command! PackerUpdate packadd packer.nvim | lua require('plugins').update()]])
vim.cmd([[command! PackerSync packadd packer.nvim | lua require('plugins').sync()]])
vim.cmd([[command! PackerClean packadd packer.nvim | lua require('plugins').clean()]])
vim.cmd([[command! PackerCompile packadd packer.nvim | lua require('plugins').compile()]])

vim.cmd('autocmd BufWritePost plugins.lua PackerCompile')

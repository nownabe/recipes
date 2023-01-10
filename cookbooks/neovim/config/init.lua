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

require('plugins')

require('config/mini')
require('config/nvim-cmp')
require('config/nvim-comment')
require('config/nvim-lspconfig')
require('config/telescope')


-- Keymaps ====================================================

vim.keymap.set({'i'}, 'jj', '<Esc>')
vim.keymap.set({'n'}, '<Leader>h', '^')
vim.keymap.set({'n'}, '<Leader>l', '$')
vim.keymap.set({'n'}, '<Leader>m', '%')

-- windows
vim.keymap.set({'n'}, '<Leader>wh', '<C-w>h')
vim.keymap.set({'n'}, '<Leader>wj', '<C-w>j')
vim.keymap.set({'n'}, '<Leader>wk', '<C-w>k')
vim.keymap.set({'n'}, '<Leader>wl', '<C-w>l')

-- NeoTree
vim.keymap.set({'n'}, '<Leader>nt', '<cmd>Neotree<cr>')

-- Neogit
vim.keymap.set({'n'}, '<Leader>ng', '<cmd>Neogit<cr>')

-- Telescope
vim.keymap.set({'n'}, '<Leader>ff', '<cmd>Telescope find_files<cr>')
vim.keymap.set({'n'}, '<Leader>fb', '<cmd>Telescope buffers<cr>')
vim.keymap.set({'n'}, '<Leader>fg', '<cmd>Telescope live_grep<cr>')
vim.keymap.set({'n'}, '<Leader>fh', '<cmd>Telescope help_tags<cr>')
vim.keymap.set({'n'}, '<Leader>fc', '<cmd>Telescope commands<cr>')
vim.keymap.set({'n'}, '<Leader>fk', '<cmd>Telescope keymaps<cr>')

-- Telescope LSP
vim.keymap.set({'n'}, '<Leader>;r', '<cmd>Telescope lsp_references<cr>')
vim.keymap.set({'n'}, '<Leader>;ci', '<cmd>Telescope lsp_incoming_calls<cr>')
vim.keymap.set({'n'}, '<Leader>;co', '<cmd>Telescope lsp_outgoing_calls<cr>')
vim.keymap.set({'n'}, '<Leader>;g', '<cmd>Telescope diagnostics<cr>')
vim.keymap.set({'n'}, '<Leader>;i', '<cmd>Telescope lsp_implementations<cr>')
vim.keymap.set({'n'}, '<Leader>;d', '<cmd>Telescope lsp_definitions<cr>')
vim.keymap.set({'n'}, '<Leader>;t', '<cmd>Telescope lsp_type_definitions<cr>')

-- LSP
vim.keymap.set({'n'}, '<Leader>;h', vim.lsp.buf.hover)
vim.keymap.set({'n'}, '<Leader>;f', vim.lsp.buf.formatting)
vim.keymap.set({'n'}, '<Leader>;rn', vim.lsp.buf.rename)
vim.keymap.set({'n'}, '<Leader>;ca', '<cmd>CodeActionMenu<cr>')


-- Commands ===================================================

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

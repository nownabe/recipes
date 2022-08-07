vim.cmd('packadd packer.nvim')

return require('packer').startup(function(use)
  use({'wbthomason/packer.nvim', opt = true})

  -- Common dependencies
  use('nvim-lua/plenary.nvim')
  use('kyazdani42/nvim-web-devicons')
  use('ray-x/guihua.lua')

  -- Speed up loading Lua modules
  use('lewis6991/impatient.nvim')

  -- Colorscheme
  use('EdenEast/nightfox.nvim')

  -- Fuzzy finder
  use('nvim-telescope/telescope.nvim')
  use('nvim-telescope/telescope-file-browser.nvim')

  -- Git
  use({
    'lewis6991/gitsigns.nvim',
    tag = 'release',
    config = function() require('gitsigns').setup() end,
  })

  -- Parser generator and incremental parsing
  use({
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
  })

  -- Language server
  use('neovim/nvim-lspconfig')
  use('williamboman/mason.nvim')
  use('williamboman/mason-lspconfig.nvim')

  -- Show function signature
  use('ray-x/lsp_signature.nvim')

  -- Show analyzer status
  use({
    'j-hui/fidget.nvim',
    config = function() require('fidget').setup() end,
  })

  -- Open code actions as popup window
  use({'weilbith/nvim-code-action-menu', cmd = 'CodeActionMenu'})

  -- Open diagnostics window at the bottom
  use({
    'folke/trouble.nvim',
    config = function() require('trouble').setup() end,
  })

  -- Completion
  use('hrsh7th/cmp-nvim-lsp')
  use('hrsh7th/cmp-buffer')
  use('hrsh7th/cmp-path')
  use('hrsh7th/cmp-cmdline')
  use('hrsh7th/nvim-cmp')
  use('dcampos/nvim-snippy')
  use('dcampos/cmp-snippy')
  use('onsails/lspkind.nvim')

  -- Lua module collection
  use('echasnovski/mini.nvim')

  -- Comment
  use('terrortylor/nvim-comment')

  -- Status line
  use('feline-nvim/feline.nvim')

  -- Language & Frameworks
  use({'akinsho/flutter-tools.nvim', ft = {'dart'}})
  use({'ray-x/go.nvim', ft = {'go'}})
  use({
    'jose-elias-alvarez/typescript.nvim',
    ft = {'typescript', 'typescriptreact'},
  })
  use({
    'iamcco/markdown-preview.nvim',
    run = function() vim.fn['mkdp#util#install']() end,
    ft = {'markdown'},
  })
  use({
    'dhruvasagar/vim-table-mode',
    config = function()
      vim.g.table_mode_corner = '|'
      vim.api.nvim_command('TableModeEnable')
    end,
    ft = {'markdown'},
  })
end)

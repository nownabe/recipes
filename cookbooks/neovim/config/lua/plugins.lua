vim.cmd('packadd packer.nvim')

-- UI plugins

local startup_ui = function(use)
  -- Colorscheme
  use({
    'EdenEast/nightfox.nvim',
    config = function() vim.cmd('colorscheme nightfox') end,
  })

  -- Status line
  use({
    'nvim-lualine/lualine.nvim',
    config = function() require('config/lualine') end,
  })

  -- Show LSP status
  use({
    'j-hui/fidget.nvim',
    config = function() require('fidget').setup() end,
  })

  -- Color highlighter
  use({
    'norcalli/nvim-colorizer.lua',
    config = function() require('colorizer').setup() end,
  })

  -- Better glance at searched information
  use('kevinhwang91/nvim-hlslens')

  -- Scrollbar
  use({
    'petertriho/nvim-scrollbar',
    config = function()
      require('scrollbar').setup()
      require('scrollbar.handlers.search').setup()
    end,
  })
end

-- Languages & frameworks

local startup_languages = function(use)
  -- Flutter
  use({'akinsho/flutter-tools.nvim', ft = {'dart'}})

  -- Go
  use({'ray-x/go.nvim', ft = {'go'}})

  -- Markdown
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

  -- TypeScript
  use({
    'jose-elias-alvarez/typescript.nvim',
    ft = {'typescript', 'typescriptreact'},
  })
end

return require('packer').startup(function(use)
  use({'wbthomason/packer.nvim', opt = true})

  -- Common dependencies
  use('nvim-lua/plenary.nvim')
  use('kyazdani42/nvim-web-devicons')
  use('ray-x/guihua.lua')
  use('MunifTanjim/nui.nvim')

  -- Speed up loading Lua modules
  use('lewis6991/impatient.nvim')

  -- Filer
  use({
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v2.x',
    cmd = "Neotree",
    config = function() require('config/neo-tree') end,
  })

  -- Fuzzy finder
  use('nvim-telescope/telescope.nvim')

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

  startup_ui(use)
  startup_languages(use)
end)

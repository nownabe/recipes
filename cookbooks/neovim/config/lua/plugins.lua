local packer = nil

local function init()
  if packer == nil then
    packer = require('packer')
    packer.init({ disable_commands = true })
  end
  packer.reset()

  -- Common dependencies
  packer.use('nvim-lua/plenary.nvim')
  packer.use('kyazdani42/nvim-web-devicons')

  -- Speed up loading Lua modules
  packer.use('lewis6991/impatient.nvim')

  -- Colorscheme
  packer.use({'EdenEast/nightfox.nvim', opt = true})

  -- Fuzzy finder
  packer.use('nvim-telescope/telescope.nvim')
  packer.use('nvim-telescope/telescope-file-browser.nvim')

  -- Git
  packer.use({
    'lewis6991/gitsigns.nvim',
    tag = 'release',
    config = function() require('gitsigns').setup() end,
  })


  -- Language server
  packer.use('neovim/nvim-lspconfig')
  packer.use('williamboman/mason.nvim')
  packer.use('williamboman/mason-lspconfig.nvim')

  packer.use({
    'j-hui/fidget.nvim',
    config = function() require('fidget').setup() end,
  })

  -- Open code actions as popup window
  packer.use({'weilbith/nvim-code-action-menu', cmd = 'CodeActionMenu'})

  -- Open diagnostics window at the bottom
  packer.use({
    'folke/trouble.nvim',
    config = function() require('trouble').setup() end,
  })

  -- Completion
  packer.use('hrsh7th/cmp-nvim-lsp')
  packer.use('hrsh7th/cmp-nvim-lsp-signature-help')
  packer.use('hrsh7th/cmp-buffer')
  packer.use('hrsh7th/cmp-path')
  packer.use('hrsh7th/cmp-cmdline')
  packer.use('hrsh7th/nvim-cmp')
  packer.use('dcampos/nvim-snippy')
  packer.use('dcampos/cmp-snippy')
  packer.use('onsails/lspkind.nvim')

  -- Lua module collection
  packer.use('echasnovski/mini.nvim')

  -- Comment
  packer.use('terrortylor/nvim-comment')

  -- Status line
  packer.use('feline-nvim/feline.nvim')

  -- Flutter
  packer.use('akinsho/flutter-tools.nvim')
end

return setmetatable({}, {
  __index = function(_, key)
    init()
    return packer[key]
  end,
})

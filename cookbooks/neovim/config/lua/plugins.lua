local packer = nil

local function init()
  if packer == nil then
    packer = require('packer')
    packer.init({ disable_commands = true })
  end
  packer.reset()

  -- Common dependencies
  packer.use('nvim-lua/plenary.nvim')

  -- Speed up loading Lua modules
  packer.use('lewis6991/impatient.nvim')

  -- Colorscheme
  packer.use({'EdenEast/nightfox.nvim', opt = true})

  -- Fuzzy finder
  packer.use('nvim-telescope/telescope.nvim')
  packer.use('nvim-telescope/telescope-file-browser.nvim')

  -- Language server
  packer.use('neovim/nvim-lspconfig')
  packer.use('williamboman/nvim-lsp-installer')

  packer.use({
    'folke/trouble.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('trouble').setup({})
    end,
  })

  -- Misc
  packer.use('terrortylor/nvim-comment')
end

return setmetatable({}, {
  __index = function(_, key)
    init()
    return packer[key]
  end,
})

local packer = nil

local function init()
  if packer == nil then
    packer = require('packer')
    packer.init({ disable_commands = true })
  end
  packer.reset()

  packer.use('lewis6991/impatient.nvim')

  packer.use('neovim/nvim-lspconfig')
  packer.use('williamboman/nvim-lsp-installer')

  packer.use({
    'folke/trouble.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('trouble').setup({})
    end,
  })

  packer.use({'echasnovski/mini.nvim', branch = 'stable'})

  packer.use({
    'nvim-telescope/telescope.nvim',
    tag = '0.1.0',
    requires = 'nvim-lua/plenary.nvim',
  })
  packer.use({'nvim-telescope/telescope-file-browser.nvim'})
end

return setmetatable({}, {
  __index = function(_, key)
    init()
    return packer[key]
  end,
})

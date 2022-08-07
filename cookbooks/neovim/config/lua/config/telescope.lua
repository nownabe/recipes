local telescope = require('telescope')
local actions = require('telescope.actions')

-- https://github.com/nvim-telescope/telescope.nvim/blob/master/lua/telescope/mappings.lua#L130

telescope.setup({
  defaults = {
    mappings = {
      i = {
        ['<C-j>'] = actions.move_selection_next,
        ['<C-k>'] = actions.move_selection_previous,
        ['<C-h>'] = actions.select_horizontal,
      }
    },
  },
})

local telescope = require('telescope')
local actions = require('telescope.actions')
local fb_actions = telescope.extensions.file_browser.actions

-- https://github.com/nvim-telescope/telescope.nvim/blob/master/lua/telescope/mappings.lua#L130

telescope.setup({
  defaults = {
    mappings = {
      i = {
        ['<C-j>'] = actions.move_selection_next,
        ['<C-k>'] = actions.move_selection_previous,
        ['<C-n>'] = fb_actions.create_from_prompt,
      }
    },
  },
})

telescope.load_extension('file_browser')

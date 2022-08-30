require('lualine').setup({
  options = {
    refresh = {
      statusline = 200,
    },
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff'},
    lualine_c = {'filename', 'diagnostics'},
    lualine_x = {'encoding', 'fileformat'},
    lualine_y = {'filetype'},
    lualine_z = {'location', 'progress'},
  },
})

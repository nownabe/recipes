-- https://github.com/akinsho/flutter-tools.nvim#full-configuration

require('flutter-tools').setup({
  ui = {
    border = 'rounded',
  },
  widget_guides = {
    enabled = false,
  },
  closing_tags = {
    prefix = '# ',
    enabled = true,
  },
  lsp = {
    color = {
      enabled = true,
      virtual_text = true,
      virtual_text_str = '■',
    },
  },
})

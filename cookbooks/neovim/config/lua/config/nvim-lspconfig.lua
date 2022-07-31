local on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', '<Leader>lh', vim.lsp.buf.hover, bufopts)
end

require('mason').setup()
require('mason-lspconfig').setup()
require('mason-lspconfig').setup_handlers({
  function (server_name)
    require('lspconfig')[server_name].setup({
      on_attach = on_attach
    })
  end,
})

local on_attach = function(client, bufnr)
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', '<Leader>lh', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', '<Leader>lf', vim.lsp.buf.formatting, bufopts)
  vim.keymap.set('n', '<Leader>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<Leader>ca', vim.lsp.buf.code_action, bufopts)
end

local capabilities = require('cmp_nvim_lsp')
  .update_capabilities(vim.lsp.protocol.make_client_capabilities())

local default_opts = {
  on_attach = on_attach,
  capabilities = capabilities,
}

local lspconfig = require('lspconfig')

require('mason').setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
})

require('mason-lspconfig').setup({
  ensure_installed = {
    "black",
    "prettier",
    "solargraph",
  },
  automatic_installation = true,
})

require('mason-lspconfig').setup_handlers({
  function (server_name)
    lspconfig[server_name].setup(default_opts)
  end,
})

lspconfig.dartls.setup(default_opts)

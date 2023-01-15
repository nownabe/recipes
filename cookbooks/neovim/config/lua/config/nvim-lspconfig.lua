local on_attach = function(client, bufnr)
  -- local bufopts = { noremap = true, silent = true, buffer = bufnr }
end

local capabilities = require('cmp_nvim_lsp')
  .default_capabilities(vim.lsp.protocol.make_client_capabilities())

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
    --"black",
    --"prettier",
    "solargraph",
  },
  automatic_installation = true,
})

require('mason-lspconfig').setup_handlers({
  function (server_name)
    lspconfig[server_name].setup(default_opts)
  end,
})

require('lsp_signature').setup()

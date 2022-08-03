local cmp = require('cmp')

cmp.setup({
  completion = { completeopt = 'menu,menuone,noinsert' },
  snippet = {
    expand = function(args)
      require('snippy').expand_snippet(args.body)
    end,
  },
  mapping = {
    ['<C-k>']  = cmp.mapping.select_prev_item(),
    ['<C-j>']  = cmp.mapping.select_next_item(),
    ['<Up>']   = cmp.mapping.select_prev_item(),
    ['<Down>'] = cmp.mapping.select_next_item(),
    ['<C-d>']  = cmp.mapping.scroll_docs(-4),
    ['<C-u>']  = cmp.mapping.scroll_docs(4),
    ['<C-l>']  = cmp.mapping.complete(),
    ['<C-e>']  = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ['<CR>']   = cmp.mapping.confirm({ select = true }),
  },
  sources = cmp.config.sources(
    {
      { name = 'nvim_lsp' },
      { name = 'nvim_lsp_signature_help' },
      { name = 'snippy' },
    },
    {
      { name = 'buffer' },
    }
  ),
})

cmp.setup.cmdline('/', {
  mapping = {
    ['<C-k>']  = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
    ['<C-j>']  = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
    ['<Up>']   = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
    ['<Down>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
    ['<CR>']   = cmp.mapping.confirm({ select = true }),
  },
  sources = { { name = 'buffer' } },
})

cmp.setup.cmdline(':', {
  mapping = {
    ['<C-k>']  = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
    ['<C-j>']  = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
    ['<Up>']   = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
    ['<Down>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
    ['<CR>']   = cmp.mapping.confirm({ select = true }),
  },
  sources = {
    { name = 'path' },
    { name = 'cmdline' },
  },
})

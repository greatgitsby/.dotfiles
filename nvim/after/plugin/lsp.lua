local cmp = require("cmp")
local lspkind = require("lspkind")
local Remap = require("greatgitsby.keymap")
local nnoremap = Remap.nnoremap
local inoremap = Remap.inoremap

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol',
      maxWidth = 50,
    })
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' }, -- For luasnip users.
  }, {
      { name = 'buffer' },
    })
})

local function config(_config)
  return vim.tbl_deep_extend("force", {
    capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
    on_attach = function()
      nnoremap("gd", function() vim.lsp.buf.definition() end)
      nnoremap("K", function() vim.lsp.buf.hover() end)
      nnoremap("<leader>vws", function() vim.lsp.buf.workspace_symbol() end)
      nnoremap("<leader>vd", function() vim.diagnostic.open_float() end)
      nnoremap("[d", function() vim.diagnostic.goto_next() end)
      nnoremap("]d", function() vim.diagnostic.goto_prev() end)
      nnoremap("<leader>vca", function() vim.lsp.buf.code_action() end)
      nnoremap("<leader>vco", function() vim.lsp.buf.code_action({
        filter = function(code_action)
          if not code_action or not code_action.data then
            return false
          end

          local data = code_action.data.id
          return string.sub(data, #data - 1, #data) == ":0"
        end,
        apply = true
      }) end)
      nnoremap("<leader>vrr", function() vim.lsp.buf.references() end)
      nnoremap("<leader>vrn", function() vim.lsp.buf.rename() end)
      inoremap("<C-h>", function() vim.lsp.buf.signature_help() end)
    end,
    }, _config or {})
end

require("lspconfig").tsserver.setup(config())

require("lspconfig").gopls.setup(config())

require("lspconfig").rust_analyzer.setup(config({
  cmd = { "rustup", "run", "nightly", "rust-analyzer" },
}))

require('nvim-treesitter.configs').setup {
  ensure_installed = "all",
  sync_install = false,
  auto_install = true,

  ignore_install = { "phpdoc", "tree-sitter-phpdoc" },

  context_commentstring = {
    enable = true
  },
  highlight = {
    enable = true,
    disable = { "lua", "phpdoc", "tree-sitter-phpdoc" },
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true
  }
}

-- BUG: still tries to install ignored modules
-- vim.cmd(":TSInstall all")

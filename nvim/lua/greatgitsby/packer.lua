local execute = vim.api.nvim_command
local fn = vim.fn
local packer_bootstrap = false

-- ensure that packer is installed
local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
end

vim.cmd('packadd packer.nvim')

local config = {
  compile_path = require("packer.util").join_paths(vim.fn.stdpath "config", "packer", "packer_compiled.lua"),
  profile = {
    enable = true,
    threshold = 0, -- the amount in ms that a plugins load time must be over for it to be included in the profile
  },
  display = {
    open_fn = function()
      return require("packer.util").float { border = "single" }
    end,
  },
}

--- startup and add configure plugins
local function plugins(use)
  use { 'wbthomason/packer.nvim', opt = true }
  use 'nvim-treesitter/nvim-treesitter'
  use 'folke/tokyonight.nvim'

  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'onsails/lspkind.nvim'

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  } 

  use 'JoosepAlviste/nvim-ts-context-commentstring' 
  use 'tpope/vim-commentary'

  if packer_bootstrap then
    require('packer').sync()
  end
end

local packer = require("packer")

packer.init(config)
packer.startup(plugins)

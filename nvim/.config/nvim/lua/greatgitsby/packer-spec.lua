local use_amazon_plugins = require("greatgitsby.amazon").use_plugins;

local M = {}

M.packer_spec = function(use, packer_bootstrap)
    use("wbthomason/packer.nvim")

    use({
        "nvim-telescope/telescope.nvim", tag = "0.1.1",
        requires = { {"nvim-lua/plenary.nvim"} }
    })

    use({
        "rose-pine/neovim",
        as = "rose-pine",
        config = function()
            require("rose-pine").setup()
        end
    })

    use({
        "folke/tokyonight.nvim",
        as = "tokyonight",
        config = function()
            require("tokyonight").setup({
                style = "storm",
                transparent = true,
                terminal_colors = true,
            })
        end
    })

    use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })
    use("theprimeagen/harpoon")
    use("tpope/vim-fugitive")
    use("tpope/vim-sleuth")

    use({
        "nvim-lualine/lualine.nvim",
        requires = { "kyazdani42/nvim-web-devicons", opt = true },
        config = function ()
            require("lualine").setup()
        end
    })

    use({
        "VonHeikemen/lsp-zero.nvim",
        branch = "v1.x",
        requires = {
            -- LSP Support
            {"neovim/nvim-lspconfig"},             -- Required
            {"williamboman/mason.nvim"},           -- Optional
            {"williamboman/mason-lspconfig.nvim"}, -- Optional

            -- Autocompletion
            {"hrsh7th/nvim-cmp"},         -- Required
            {"hrsh7th/cmp-nvim-lsp"},     -- Required
            {"hrsh7th/cmp-buffer"},       -- Optional
            {"hrsh7th/cmp-path"},         -- Optional
            {"saadparwaiz1/cmp_luasnip"}, -- Optional
            {"hrsh7th/cmp-nvim-lua"},     -- Optional

            -- Snippets
            {"L3MON4D3/LuaSnip"},             -- Required
            {"rafamadriz/friendly-snippets"}, -- Optional
        }
    })


    -- Status updates for LSP
    use({
        "j-hui/fidget.nvim",
        config = function()
            require("fidget").setup({})
        end
    })

    -- Add indentation guides even on blank lines
    use({
        'lukas-reineke/indent-blankline.nvim',
        -- Enable `lukas-reineke/indent-blankline.nvim`
        -- See `:help indent_blankline.txt`
        config = function()
            require("indent_blankline").setup({
                char = '┊',
                show_trailing_blankline_indent = false,
            })
        end
    })

    use_amazon_plugins(use)

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require("packer").sync()
    end
end

return M

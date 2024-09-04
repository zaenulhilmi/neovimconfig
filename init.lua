local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
        install_path })
end

require('packer').startup(function(use)
    use 'tpope/vim-fugitive'
    use 'zaenulhilmi/terminside.vim'
    use 'gruvbox-community/gruvbox'
    use { "catppuccin/nvim", as = "catppuccin" }

    use 'vim-airline/vim-airline'
    use 'sharkdp/fd'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'
    use 'neovim/nvim-lspconfig'
    use 'ThePrimeagen/harpoon'
    use 'APZelos/blamer.nvim'
    use 'preservim/nerdtree'
    use 'nvim-tree/nvim-web-devicons'
    use { 'sindrets/diffview.nvim',
        requires = { 'nvim-lua/plenary.nvim' }
    }

    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }
    use 'nvim-treesitter/nvim-treesitter'
    use 'github/copilot.vim'
    use "zbirenbaum/copilot.lua"


    use "williamboman/mason.nvim"


    use "dharanasoft/rtf-highlight"

    use({
        "L3MON4D3/LuaSnip",
        -- follow latest release.
        tag = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        -- install jsregexp (optional!:).
        run = "make install_jsregexp",
        dependencies = { "rafamadriz/friendly-snippets" },

    })
    use 'dense-analysis/ale'

    use { "CopilotC-Nvim/CopilotChat.nvim", branch = "canary" }
    use { "ibhagwan/fzf-lua",
        -- optional for icon support
        requires = { "nvim-tree/nvim-web-devicons" }
    }

    use {
        'akinsho/flutter-tools.nvim',
        requires = {
            'nvim-lua/plenary.nvim',
            'stevearc/dressing.nvim', -- optional for vim.ui.select
        },
    }

    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
end)

require('global')
require('option')
require('lsp')
require('alt_number_shortcut')
require('general_shortcut')
require("mason").setup()
require("luasnip.loaders.from_snipmate").lazy_load()
require("snippets")
require("copilot")
require("flutter-tools").setup {} -- use defaults

require 'nvim-web-devicons'.setup {
    -- your personnal icons can go here (to override)
    -- you can specify color or cterm_color instead of specifying both of them
    -- DevIcon will be appended to `name`
    override = {
        zsh = {
            icon = "",
            color = "#428850",
            cterm_color = "65",
            name = "Zsh"
        }
    },
    -- globally enable different highlight colors per icon (default to true)
    -- if set to false all icons will have the default icon's color
    color_icons = true,
    -- globally enable default icons (default to false)
    -- will get overriden by `get_icons` option
    default = true,
    -- globally enable "strict" selection of icons - icon will be looked up in
    -- different tables, first by filename, and if not found by extension; this
    -- prevents cases when file doesn't have any extension but still gets some icon
    -- because its name happened to match some extension (default to false)
    strict = true,
    -- same as `override` but specifically for overrides by filename
    -- takes effect when `strict` is true
    override_by_filename = {
        [".gitignore"] = {
            icon = "",
            color = "#f1502f",
            name = "Gitignore"
        }
    },
    -- same as `override` but specifically for overrides by extension
    -- takes effect when `strict` is true
    override_by_extension = {
        ["log"] = {
            icon = "",
            color = "#81e043",
            name = "Log"
        }
    },
}
require 'nvim-web-devicons'.get_icons()

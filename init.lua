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
    use 'vim-airline/vim-airline'
    use 'sharkdp/fd'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'
    use 'neovim/nvim-lspconfig'
    use 'ThePrimeagen/harpoon'
    use 'APZelos/blamer.nvim'
    use 'preservim/nerdtree'
    use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }
    use 'nvim-treesitter/nvim-treesitter'
    use 'github/copilot.vim'


    use "williamboman/mason.nvim"

    use {
        'wthollingsworth/pomodoro.nvim',
        requires = 'MunifTanjim/nui.nvim',
        config = function()
            require('pomodoro').setup({
                time_work = 25,
                time_break_short = 5,
                time_break_long = 20,
                timers_to_long_break = 4
            })
        end
    }

    use "dharanasoft/rtf-highlight"
    use{ 'anuvyklack/pretty-fold.nvim',
       config = function()
          require('pretty-fold').setup()
       end
    }


end)



require('global')
require('option')
require('lsp')
require('alt_number_shortcut')
require('general_shortcut')
require("mason").setup()

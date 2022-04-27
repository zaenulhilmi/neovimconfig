local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
end

require('packer').startup(function(use)
    use 'zaenulhilmi/terminside.vim'
    use 'gruvbox-community/gruvbox'
    use 'NLKNguyen/papercolor-theme'
    use 'vim-airline/vim-airline'
    use {
        'neoclide/coc.nvim', branch = 'release'
    }
    use 'github/copilot.vim'
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
end)

require('global')
require('option')
require('lsp')
require('alt_number_shortcut')
require('general_shortcut')

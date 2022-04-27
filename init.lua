local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim' 
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path}) 
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
    use 'git@github.com:zaenulhilmi/popup.nvim'
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
local capabilities  = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.codeAction = {
  dynamicRegistration = true;
      codeActionLiteralSupport = {
          codeActionKind = {
              valueSet = {
                 "",
                 "quickfix",
                 "refactor",
                 "refactor.extract",
                 "refactor.inline",
                 "refactor.rewrite",
                 "source",
                 "source.organizeImports",
              };
          };
      };
}

capabilities.workspace.workspaceEdit = {
  documentChanges = true;
  resourceOperations = {
    ["create"] = true;
    ["rename"] = true;
    ["delete"] = true;
  };
}
require'lspconfig'.gopls.setup{
    on_attach = on_attach;
    capabilities = capabilities
}



local nvim_lsp = require('lspconfig')


-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua require("telescope.builtin").lsp_implementations()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>r', '<cmd>lua vim.lsp.stop_client(vim.lsp.get_active_clients())<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', '<space>caa', '<cmd>lua require("telescope.builtin").lsp_code_actions()<CR>', opts)

  buf_set_keymap('n', '<space>ds', '<cmd>lua vim.lsp.buf.document_symbol()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua require("telescope.builtin").lsp_references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)


end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
-- local servers = { 'gopls', 'tsserver' }
local servers = { 'gopls', 'eslint', 'tsserver', 'sumneko_lua' }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    },
    settings = {
        Lua = {
            diagnostics = {
                disable = { "unused_local", "lowercase-global", "undefined_global" },
                globals = { 'vim', 'require', 'ipairs', 'print', 'os', "error", "type", "tonumber", "math", "string" }
            }
        }
    }
  }
end


vim.api.nvim_set_keymap(
	"v",
	"<leader>rr",
	"<Esc><cmd>lua require('telescope').extensions.refactoring.refactors()<CR>",
	{ noremap = true }
)

-- Remaps for each of the four debug operations currently offered by the plugin
vim.api.nvim_set_keymap("v", "<Leader>re", [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>]], {noremap = true, silent = true, expr = false})
vim.api.nvim_set_keymap("v", "<Leader>rf", [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>]], {noremap = true, silent = true, expr = false})
vim.api.nvim_set_keymap("v", "<Leader>rv", [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>]], {noremap = true, silent = true, expr = false})
vim.api.nvim_set_keymap("v", "<Leader>ri", [[ <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]], {noremap = true, silent = true, expr = false})



vim.cmd("colorscheme PaperColor")


vim.g.mapleader = " "
vim.go.guicursor = ''
vim.go.hidden = true
vim.go.incsearch = true
vim.go.hlsearch = false
vim.go.clipboard="unnamedplus"
vim.bo.swapfile = false
vim.wo.number = true
vim.wo.wrap = false
vim.wo.scrolloff = 8
vim.wo.signcolumn = "yes"
vim.wo.colorcolumn = "80"


local keymap = vim.api.nvim_set_keymap

keymap('i', 'jk', '<esc>', {})
keymap('n', '<leader>l', ':echo "hello"', {})


keymap('n', '<leader>ff', ':Telescope find_files<cr>', {})
keymap('n', '<leader>fg', ':Telescope live_grep<cr>', {})
keymap('n', '<leader>b', ':BlamerToggle<cr>', {})
keymap('n', '<C-e>', ':lua require("harpoon.ui").toggle_quick_menu()<cr>', {})
keymap('n', '<C-l>', ':lua require("harpoon.mark").add_file()<cr>', {})
keymap('n', '<M-1>', ':NERDTreeToggle<CR>', {})
 -- nnoremap <C-t> :NERDTreeToggle<CR>
--keymap('n', '<M-2>', ':lua require("harpoon.ui").nav_file(2)<cr>', {})
--keymap('n', '<M-3>', ':lua require("harpoon.ui").nav_file(3)<cr>', {})
--keymap('n', '<M-4>', ':lua require("harpoon.ui").nav_file(4)<cr>', {})
keymap('n', '<M-f>', ':Format<cr>', {})

keymap('n', '<leader>ts', ':TSPlaygroundToggle<cr>', {})



keymap('n', 'vx', ':lua require("treesitter-unit").select()<cr>', {})

-- Remaps for each of the four debug operations currently offered by the plugin
vim.api.nvim_set_keymap("v", "<Leader>rr", [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>]], {noremap = true, silent = true, expr = false})
vim.api.nvim_set_keymap("v", "<Leader>rf", [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>]], {noremap = true, silent = true, expr = false})
vim.api.nvim_set_keymap("v", "<Leader>rv", [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>]], {noremap = true, silent = true, expr = false})
vim.api.nvim_set_keymap("v", "<Leader>ri", [[ <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]], {noremap = true, silent = true, expr = false})
vim.api.nvim_set_keymap('n', '<Leader>cs', '<cmd>lua require("telescope.builtin").colorscheme()<CR>',{noremap = true, silent = true, expr = false})


vim.api.nvim_set_keymap('n', '<M-9>', '<cmd>!go test ./...<CR>',{noremap = true, silent = true, expr = false})
--vim.api.nvim_set_keymap('n', '<M-8>', '<cmd>!go run ./...<CR>',{noremap = true, silent = true, expr = false})

vim.api.nvim_create_autocmd("FileType", {
    pattern = {"lua", "go"},
    callback = function()
        local file_name = vim.fn.expand("<afile>")
        local match = vim.fn.expand("<amatch>")
        if match == "go" then
            vim.api.nvim_set_keymap('n', '<M-8>', '<cmd>!go run ./... <CR>',{noremap = true, silent = true, expr = false})
        elseif match == "lua" then
            vim.api.nvim_set_keymap('n', '<M-8>', '<cmd>!lua '.. file_name ..' <CR>',{noremap = true, silent = true, expr = false})
        end
    end
})



vim.api.nvim_create_autocmd({"BufWritePre"}, 
    {
        pattern = {"*.go"},
        callback = function()
            vim.lsp.buf.formatting_sync(nil,1000)
        end,
    }
)

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    -- Disable signs
    signs = true,
  }
)

-- vim autocmd file type go 




require('global')

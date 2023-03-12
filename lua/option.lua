vim.cmd("colorscheme gruvbox")
vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
vim.g.mapleader = " "
vim.go.guicursor = ''
vim.go.hidden = true
vim.go.incsearch = true
vim.go.hlsearch = false
vim.go.clipboard = "unnamedplus"
vim.wo.number = true
vim.wo.wrap = false
vim.wo.scrolloff = 8
vim.wo.signcolumn = "yes"
vim.wo.colorcolumn = "80"
-- vim.bo.swapfile = false
vim.cmd[[set noswapfile]]
vim.cmd[[cabbrev h vert bo h]]
vim.cmd([[set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smartindent smarttab]])

vim.cmd([[let g:ale_linters = {'javascript': ['eslint'], 'python': ['pylint']}]])

vim.api.nvim_set_keymap('n', '<leader>cc', ":let @+=expand('%:p')<CR>", {})



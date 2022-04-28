vim.cmd("colorscheme PaperColor")
vim.g.mapleader = " "
vim.go.guicursor = ''
vim.go.hidden = true
vim.go.incsearch = true
vim.go.hlsearch = false
vim.go.clipboard = "unnamedplus"
vim.bo.swapfile = false
vim.wo.number = true
vim.wo.wrap = false
vim.wo.scrolloff = 8
vim.wo.signcolumn = "yes"
vim.wo.colorcolumn = "80"
vim.cmd[[cabbrev h vert bo h]]
vim.cmd([[let g:mapleader = " "]])
vim.cmd([[set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smartindent smarttab]])

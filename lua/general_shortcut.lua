vim.api.nvim_set_keymap('i', 'jk', '<esc>', {})
vim.api.nvim_set_keymap('n', '<leader>l', ':echo "hello"', {})
vim.api.nvim_set_keymap('n', '<leader>ff', ':Telescope find_files<cr>', {})
vim.api.nvim_set_keymap('n', '<leader>fg', ':Telescope live_grep<cr>', {})
vim.api.nvim_set_keymap('n', '<leader>b', ':BlamerToggle<cr>', {})
vim.api.nvim_set_keymap('n', '<C-e>', ':lua require("harpoon.ui").toggle_quick_menu()<cr>', {})
vim.api.nvim_set_keymap('n', '<C-l>', ':lua require("harpoon.mark").add_file()<cr>', {})
vim.api.nvim_set_keymap('n', '<Leader>cs', '<cmd>lua require("telescope.builtin").colorscheme()<CR>', { noremap = true, silent = true, expr = false })


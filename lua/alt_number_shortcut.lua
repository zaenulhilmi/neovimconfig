vim.api.nvim_set_keymap('n', '<M-1>', ':NERDTreeToggle<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>1', ':NERDTreeToggle<CR>', {})
    
vim.api.nvim_create_augroup("AltNumberShortcuts", { clear = false })
vim.api.nvim_create_autocmd("FileType", {
	-- group = "AltNumberShortcuts", 
	pattern = { "lua", "go", "rust", "typescript" },
	callback = function()
		local file_name = vim.fn.expand("<afile>")
		local match = vim.fn.expand("<amatch>")
		if match == "go" then
			vim.api.nvim_set_keymap('n', '<M-8>', '<cmd>!go run ./... <CR>', { noremap = true, silent = true, expr = false })
			vim.api.nvim_set_keymap('n', '<leader>8', '<cmd>!go run ./... <CR>', { noremap = true, silent = true, expr = false })
		elseif match == "rust" then
			vim.api.nvim_set_keymap('n', '<M-8>', '<cmd>!cargo run <CR>', { noremap = true, silent = true, expr = false })
			vim.api.nvim_set_keymap('n', '<leader>8', '<cmd>!cargo run <CR>', { noremap = true, silent = true, expr = false })
		elseif match == "lua" then
			vim.api.nvim_set_keymap('n', '<M-8>', '<cmd>!lua ' .. file_name .. ' <CR>', { noremap = true, silent = true, expr = false })
			vim.api.nvim_set_keymap('n', '<leader>8', '<cmd>!lua ' .. file_name .. ' <CR>', { noremap = true, silent = true, expr = false })
        elseif match == "typescript" then
            local file_name_no_ext = string.sub(file_name, 1, -4)
            P("Load filetype ")
			vim.api.nvim_set_keymap('n', '<M-8>', '<cmd>!tsc ' .. file_name .. ' && node ' .. file_name_no_ext .. '.js <CR>', { noremap = true, silent = true, expr = false })
			vim.api.nvim_set_keymap('n', '<leader>8', '<cmd>!tsc ' .. file_name .. ' && node ' .. file_name_no_ext .. '.js <CR>', { noremap = true, silent = true, expr = false })
		end
	end
})

vim.api.nvim_set_keymap('n', '<M-9>', '<cmd>!go test ./...<CR>', { noremap = true, silent = true, expr = false })
vim.api.nvim_set_keymap('n', '<leader>9', '<cmd>!go test ./...<CR>', { noremap = true, silent = true, expr = false })

vim.api.nvim_set_keymap('n', '<M-0>', '<Plug>TerminsideOpen;', { noremap = true, silent = true, expr = false })
vim.api.nvim_set_keymap('n', '<leader>0', '<Plug>TerminsideOpen;', { noremap = true, silent = true, expr = false })


vim.api.nvim_set_keymap('n', '<M-0>', '<Plug>TerminsideOpen;', { noremap = true, silent = true, expr = false })
vim.api.nvim_set_keymap('n', '<leader>0', '<Plug>TerminsideOpen;', { noremap = true, silent = true, expr = false })


vim.api.nvim_set_keymap('t', '<M-0>', '<Plug>TerminsideClose;', { noremap = true, silent = true, expr = false })
vim.api.nvim_set_keymap('t', '<leader>0', '<Plug>TerminsideClose;', { noremap = true, silent = true, expr = false })
-- map <C-l> <Plug>TerminsideOpen;
-- tmap <C-l> <Plug>TerminsideClose;

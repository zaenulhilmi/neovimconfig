vim.api.nvim_set_keymap('n', '<M-1>', ':NERDTreeToggle<CR>', {})

vim.api.nvim_create_augroup("AltNumberShortcuts", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
	group = "AltNumberShortcuts",
	pattern = { "lua", "go" },
	callback = function()
		local file_name = vim.fn.expand("<afile>")
		local match = vim.fn.expand("<amatch>")
		if match == "go" then
			vim.api.nvim_set_keymap('n', '<M-8>', '<cmd>!go run ./... <CR>', { noremap = true, silent = true, expr = false })
		elseif match == "lua" then
			vim.api.nvim_set_keymap('n', '<M-8>', '<cmd>!lua ' .. file_name .. ' <CR>', { noremap = true, silent = true, expr = false })
		end
	end
})

vim.api.nvim_set_keymap('n', '<M-9>', '<cmd>!go test ./...<CR>', { noremap = true, silent = true, expr = false })

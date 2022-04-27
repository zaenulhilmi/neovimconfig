"" Find files using Telescope command-line sugar.
"nnoremap <leader>ff <cmd>Telescope find_files hidden=true<cr>
"nnoremap <leader>fg <cmd>Telescope live_grep<cr>
"nnoremap <leader>fb <cmd>Telescope buffers<cr>
"nnoremap <leader>fh <cmd>Telescope help_tags<cr>
"nnoremap <c-p> <cmd>Telescope find_files<CR>
"nnoremap <c-f> <cmd>Telescope live_grep<CR>
"lua  << EOF
"    require('telescope').setup{ 
"        defaults = { 
"            file_ignore_patterns = 
"                { "node_modules/*",  ".git/*"} 
"            } 
"        }
"EOF
"

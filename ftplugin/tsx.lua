
local function setup_typescript()
    vim.cmd([[set tabstop=2 softtabstop=2 shiftwidth=2 expandtab smartindent smarttab]])
end

vim.api.nvim_create_autocmd({ "BufWritePre" },
    {
        pattern = { "*.tsx", "*.ts" },
        callback = function()
            setup_typescript()
        end,
    }
)

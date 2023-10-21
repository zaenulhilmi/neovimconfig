function hotReload_TriggerHotReload()
    if vim.env.SHELL:find("fish") then
        vim.fn.system("kill -SIGUSR1 (pgrep -f '[f]lutter_tool.*run')")
    else
        vim.fn.system("kill -SIGUSR1 $(pgrep -f '[f]lutter_tool.*run')")
    end
end


vim.api.nvim_create_autocmd({ "BufWritePre" },
    {
        pattern = { "*.dart" },
        callback = function()
            hotReload_TriggerHotReload()
        end,
    }
)

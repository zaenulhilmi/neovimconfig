local fn = function()
    local Cooks = 5
    print(Cooks)
    print(Cooks)
    print(Cooks)
end



function GetDocument()
    local params = {query = " "}
    vim.lsp.buf_request(0, "workspace/symbol", params, function(err, result, ctx, ... )
         print(vim.inspect(err))
         print(vim.inspect(result))
         print(vim.inspect(ctx))
        -- for _, v in ipairs(result) do
        --     P(v.name)
        --      if v.kind == 11 then
        --          P(v)
        --      end
        -- end


    end)
end


function GlobalFunction()
    local position_params = vim.lsp.util.make_position_params()
    print(vim.inspect(position_params))
    -- local new_name = "new_name"
    -- position_params.newName = new_name

    -- vim.lsp.buf_request(0, "textDocument/rename", position_params, function(err, result, ctx, ... )
    --     print(vim.inspect(result))

    --     -- print("calling rename...")
    --     -- vim.lsp.handlers["textDocument/rename"](err, method, result)
    --     -- print("... done rename")

    -- end)
end



-- use :luafile %

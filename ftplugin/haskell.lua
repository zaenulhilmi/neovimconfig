vim.api.nvim_exec([[
    let b:ale_linters = {'haskell': ['hlint', 'cabal_ghc']}
]], false)

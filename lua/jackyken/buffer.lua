vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.md",
    callback = function()
        vim.cmd([[%s/\([.!?]\)\s/\1\r/ge]])
    end,
})


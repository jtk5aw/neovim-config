vim.g.neoformat_try_node_exe = true

vim.api.nvim_create_autocmd({"BufWritePre"}, {
    pattern = {"*.js", "*.ts", "*.tsx", "*.jsx"},
    command = "Neoformat prettier",
})

vim.g.neoformat_try_node_exe = true

-- Note to self: For this to work prettier has to be globally installed
vim.api.nvim_create_autocmd({"BufWritePre"}, {
    pattern = {"*.js", "*.ts", "*.tsx", "*.jsx"},
    command = "Neoformat prettier",
})

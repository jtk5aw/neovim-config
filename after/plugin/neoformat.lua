vim.g.neoformat_try_node_exe = true

-- Add a function to clean buffer before formatting
local function clean_claude_artifacts()
    -- Get current buffer content
    local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
    local modified = false

    -- Filter out problematic characters and patterns that Claude might add
    for i, line in ipairs(lines) do
        -- Remove zero-width spaces and other invisible characters
        local cleaned = line:gsub('%z', ''):gsub('\194\173', '')
        -- Remove other potential problematic unicode that Claude might add
        cleaned = cleaned:gsub('\226\128\139', '')

        if cleaned ~= line then
            lines[i] = cleaned
            modified = true
        end
    end

    -- Only update buffer if changes were made
    if modified then
        vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
    end
end

-- Note to self: For this to work prettier has to be globally installed
vim.api.nvim_create_autocmd({"BufWritePre"}, {
    pattern = {"*.js", "*.ts", "*.tsx", "*.jsx"},
    callback = function()
        -- First clean any problematic characters
        clean_claude_artifacts()
        -- Then format with prettier
        vim.cmd("Neoformat prettier")
    end,
})

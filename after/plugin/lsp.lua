local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
  vim.g.inlay_hints_visible = true
  vim.lsp.inlay_hint.enable(true)
end)

-- here you can setup the language servers

require('mason').setup()
require('mason-lspconfig').setup({
    ensure_installed = {'tsserver', 'eslint', 'rust_analyzer'},
    handlers = {
        function(server_name)
            require('lspconfig')[server_name].setup({})
        end,
    },
})



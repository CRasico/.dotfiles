return {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "jay-babu/mason-null-ls.nvim",
    },
    config = function()
        local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
        local null_ls = require("null-ls")
        local mason_null_ls = require("mason-null-ls")

        mason_null_ls.setup({
            ensure_installed = { "stylua", "csharpier", "gofumpt", "goimports_reviser" },
            handlers = {},
        })

        -- will need to add any additional formatters here if they're builtins supported by null_ls
        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.formatting.csharpier,
                null_ls.builtins.formatting.gofmt,
                null_ls.builtins.formatting.goimports_reviser,
            },
            -- Add command to run auto formatting for any supported buffers
            on_attach = function(client, bufnr)
                if client.supports_method("textDocument/formatting") then
                    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        group = augroup,
                        buffer = bufnr,
                        callback = function()
                            vim.lsp.buf.format()
                        end,
                    })
                end
            end,
        })
    end,
}

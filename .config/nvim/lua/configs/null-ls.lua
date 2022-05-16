local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions
local completion = null_ls.builtins.completion

local augroup = vim.api.nvim_create_augroup("auto_format", {})

null_ls.setup({
    sources = {
        formatting.black.with({ to_temp_file = false }),
        formatting.isort.with({ to_temp_file = false }),
        formatting.stylua.with({ extra_args = { "--indent-width", "4", "--indent-type", "spaces" } }),
        formatting.trim_whitespace,
        completion.spell,
        diagnostics.shellcheck,
        diagnostics.codespell,
        code_actions.gitsigns,
    },
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
                    vim.lsp.buf.formatting_sync()
                end,
            })
        end
    end,
})

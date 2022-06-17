require("nvim-lsp-installer").setup()

local lsp = require("lspconfig")

local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

local on_attach = function(client)
    if client.name == "sumneko_lua" then
        client.resolved_capabilities.document_formatting = false
        client.resolved_capabilities.document_range_formatting = false
    end

    require("illuminate").on_attach(client)
end

local function client_is_configured(server_name, ft)
    ft = ft or vim.bo.filetype
    local active_autocmds = vim.split(vim.fn.execute("autocmd FileType " .. ft), "\n")

    for _, result in ipairs(active_autocmds) do
        if result:match(server_name) then
            return true
        end
    end

    return false
end

local function setup_server(name)
    if client_is_configured(name, nil) then
        print(name .. " already configured")
        return
    end

    local is_avail, server = require("nvim-lsp-installer.servers").get_server(name)

    if is_avail then
        if not server:is_installed() then
            server:install()
        end

        local settings = {}

        if name == "sumneko_lua" then
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim" },
                    },
                },
            }
        end

        lsp[name].setup({
            cmd = server:get_default_options().cmd,
            settings = settings,
            capabilities = capabilities,
            on_attach = on_attach,
            flags = { debounce_text_changes = 150 },
        })
    end
end

local servers = {
    "pyright",
    "gopls",
    "dockerls",
    "bashls",
    "ansiblels",
    "jsonls",
    "yamlls",
    "vimls",
    "sumneko_lua",
    "rust_analyzer",
}

for _, server in ipairs(servers) do
    setup_server(server)
end

local v = require("vimp")

v.nnoremap({ "silent" }, "]d", ":lua vim.diagnostic.goto_next()<CR>")
v.nnoremap({ "silent" }, "[d", ":lua vim.diagnostic.goto_prev()<CR>")
-- v.nnoremap({"silent"}, "H", ":lua vim.diagnostic.open_float()<CR>")

v.nnoremap({ "silent" }, "<leader>ca", ":lua vim.lsp.buf.code_action()<CR>")
v.xnoremap({ "silent" }, "<leader>ca", ":lua vim.lsp.buf.code_action()<CR>")
v.nnoremap({ "silent" }, "<leader>rn", ":lua vim.lsp.buf.rename()<CR>")

vim.diagnostic.config({
    signs = true,
    update_in_insert = false,
    virtual_text = false,
    float = {
        header = false,
        border = "rounded",
        severity_sort = true,
        source = "always",
        focusable = false,
    },
})

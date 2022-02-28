vim.diagnostic.config(
  {
    virtual_text = false,
    float = {
      border = "rounded",
      severity_sort = true,
      source = "if_many",
      focusable = false
    }
  }
)

local lsp = require("lspconfig")

local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

local handlers = {}

local on_attach = function(client, bufnr)
  require("illuminate").on_attach(client)
end

local function setup_server(name)
  local is_avail, server = require("nvim-lsp-installer.servers").get_server(name)

  if is_avail then
    if not server:is_installed() then
      server:install()
    end

    server:on_ready(
      function()
        server:setup({})
      end
    )

    local settings = {}

    if name == "sumneko_lua" then
      settings = {
        Lua = {
          diagnostics = {
            globals = {"vim"}
          }
        }
      }
    end

    lsp[name].setup(
      {
        cmd = server:get_default_options().cmd,
        settings = settings,
        capabilities = capabilities,
        on_attach = on_attach,
        handlers = handlers,
        flags = {
          debounce_text_changes = 300
        }
      }
    )
  end
end

local servers = {"pyright", "gopls", "dockerls", "bashls", "ansiblels", "jsonls", "yamlls", "vimls", "sumneko_lua"}

for _, server in ipairs(servers) do
  setup_server(server)
end

local v = require("vimp")

v.nnoremap({"silent"}, "]d", ":lua vim.diagnostic.goto_next()<CR>")
v.nnoremap({"silent"}, "[d", ":lua vim.diagnostic.goto_prev()<CR>")
-- v.nnoremap({"silent"}, "H", ":lua vim.diagnostic.open_float()<CR>")

v.nnoremap({"silent"}, "<leader>ca", ":lua vim.lsp.buf.code_action()<CR>")
v.xnoremap({"silent"}, "<leader>ca", ":lua vim.lsp.buf.code_action()<CR>")
v.nnoremap({"silent"}, "<leader>rn", ":lua vim.lsp.buf.rename()<CR>")

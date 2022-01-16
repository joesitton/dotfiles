local lsp = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

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

    lsp[name].setup(
      {
        cmd = server:get_default_options().cmd,
        capabilities = capabilities,
        flags = {
          debounce_text_changes = 150
        }
      }
    )
  end
end

local servers = {"pyright", "gopls", "dockerls", "bashls", "ansiblels", "jsonls", "yamlls", "vimls"}

for _, server in ipairs(servers) do
  setup_server(server)
end

lsp.sumneko_lua.setup(
  {
    settings = {
      Lua = {
        diagnostics = {
          globals = {"vim"}
        }
      }
    },
    capabilities = capabilities,
    flags = {
      debounce_text_changes = 150
    }
  }
)

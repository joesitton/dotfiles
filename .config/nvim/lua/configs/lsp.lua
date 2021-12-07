vim.diagnostic.config {
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = true,
  severity_sort = false
}

local lsp = require("lspconfig")
local servers = require("nvim-lsp-installer.servers")

local function setup_server(name)
  local is_avail, server = servers.get_server(name)

  if not is_avail then
    server:install()
  end

  local default_opts = server:get_default_options()

  lsp[name].setup({cmd = default_opts.cmd})
  lsp[name].setup(
    {
      cmd = default_opts.cmd,
      capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
      flags = {
        debounce_text_changes = 150
      }
    }
  )
end

local installed_servers = {
  "pyright",
  "jedi_language_server",
  "sumneko_lua",
  "vimls",
  "jsonls",
  "dockerls",
  "bashls",
  "yamlls",
  "gopls"
}

for _, server in ipairs(installed_servers) do
  setup_server(server)
end

local v = require("vimp")

v.nnoremap("<space>rn", ":lua vim.lsp.buf.rename()<CR>")

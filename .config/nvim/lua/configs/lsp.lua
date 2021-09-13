require("lsp_signature").setup(
  {
    bind = true,
    fix_pos = true,
    floating_window = true,
    floating_window_above_cur_line = true,
    hint_enable = false,
    hint_prefix = "",
    hi_parameter = "SignatureCurrent",
    padding = "",
    handler_opts = {
      border = "single"
    },
    extra_trigger_chars = {"("}
  }
)

local lsp = require("lspconfig")
local coq = require("coq")

local function setup_servers()
  require("lspinstall").setup()

  local servers = require "lspinstall".installed_servers()

  for _, server in pairs(servers) do
    lsp[server].setup({})
    lsp[server].setup(coq.lsp_ensure_capabilities())
  end
end

setup_servers()

require("lspinstall").post_install_hook = function()
  setup_servers()

  vim.cmd("bufdo e")
end

-- require("lsp_signature").setup(
--   {
--     bind = true,
--     fix_pos = true,
--     floating_window = true,
--     floating_window_above_cur_line = true,
--     hint_enable = false,
--     hint_prefix = "",
--     hi_parameter = "SignatureCurrent",
--     padding = "",
--     handler_opts = {
--       border = "single"
--     },
--     extra_trigger_chars = {"("}
--   }
-- )

local lsp = require("lspconfig")

local function setup_servers()
  require("lspinstall").setup()

  local servers = require("lspinstall").installed_servers()

  for _, server in pairs(servers) do
    lsp[server].setup({})

    lsp[server].setup(
      {capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())}
    )
  end

  lsp.lua.setup(
    {
      settings = {
        Lua = {
          diagnostics = {
            globals = {"vim"}
          }
        }
      }
    }
  )
end

setup_servers()

require("lspinstall").post_install_hook = function()
  setup_servers()

  vim.cmd("bufdo e")
end

local v = require("vimp")

v.nnoremap("<space>rn", ":lua vim.lsp.buf.rename()<CR>")
-- v.nnoremap("[g", ":lua vim.lsp.diagnostic.goto_prev()<CR>")
-- v.nnoremap("]g", ":lua vim.lsp.diagnostic.goto_next()<CR>")

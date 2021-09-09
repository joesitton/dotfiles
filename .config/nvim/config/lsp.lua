require("lspsaga").init_lsp_saga(
  {
    use_saga_diagnostic_sign = true,
    error_sign = "•",
    warn_sign = "•",
    hint_sign = "•",
    infor_sign = "•",
    definition_preview_icon = "   ",
    dianostic_header_icon = "   ",
    finder_definition_icon = "❯ ",
    finder_reference_icon = "❯ ",
    rename_prompt_prefix = "❯",
    code_action_icon = " ",
    code_action_prompt = {
      enable = true,
      sign = true,
      sign_priority = 20,
      virtual_text = false
    },
    max_preview_lines = 20, -- preview lines of lsp_finder and definition preview
    finder_action_keys = {
      open = {"o", "<CR>"},
      vsplit = "s",
      split = "i",
      quit = "<ESC>",
      scroll_down = "<C-k>",
      scroll_up = "<C-j>" -- quit can be a table
    },
    code_action_keys = {
      quit = "<ESC>",
      exec = "<CR>"
    },
    rename_action_keys = {
      quit = "<ESC>",
      exec = "<CR>" -- quit can be a table
    },
    border_style = "round"
  }
)

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

require("lspkind").init({})

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

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require("lspinstall").post_install_hook = function()
  setup_servers() -- reload installed servers
  vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end

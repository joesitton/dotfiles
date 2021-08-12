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
    -- "single" "double" "round" "plus"
    border_style = "round"
  }
)

require("lsp_signature").setup(
  {
    bind = false,
    floating_window = true, -- show hint in a floating window, set to false for virtual text only mode
    fix_pos = true, -- set to true, the floating window will not auto-close until finish all parameters
    hint_enable = true, -- virtual hint enable
    hint_prefix = "🐼 ", -- Panda for parameter
    hint_scheme = "String",
    use_lspsaga = true, -- set to true if you want to use lspsaga popup
    hi_parameter = "Search", -- how your parameter will be highlight
    max_height = 20,
    max_width = 200,
    -- handler_opts = {
    --   border = "double" -- double, single, shadow, none
    -- },
    extra_trigger_chars = {"("} -- Array of extra characters that will trigger signature completion, e.g., {"(", ","}
  }
)

require("lspkind").init({})

local function setup_servers()
  require("lspinstall").setup()
  local servers = require "lspinstall".installed_servers()
  for _, server in pairs(servers) do
    require("lspconfig")[server].setup({})
  end
end

setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require("lspinstall").post_install_hook = function()
  setup_servers() -- reload installed servers
  vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end

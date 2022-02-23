require("auto-session").setup(
  {
    auto_session_enabled = true,
    auto_save_enabled = false,
    auto_restore_enabled = true,
    pre_save_cmds = {"NvimTreeClose"}
  }
)

local v = require("vimp")

v.nnoremap("<leader>ss", ":SaveSession<CR>")
v.nnoremap("<leader>ds", ":DeleteSession<CR><CR>")

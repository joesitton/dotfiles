require("toggleterm").setup(
  {
    hide_numbers = true,
    shade_filetypes = {},
    shade_terminals = false,
    start_in_insert = true,
    insert_mappings = true,
    terminal_mappings = true,
    persist_size = true,
    direction = "float",
    close_on_exit = true,
    shell = vim.o.shell,
    float_opts = {
      border = "none",
      width = 999,
      height = 999,
      highlights = {
        border = "NormalFloat",
        background = "NormalFloat"
      }
    }
  }
)

local v = require("vimp")

v.nnoremap({"silent"}, "<F1>", "<CMD>execute v:count1 . 'ToggleTerm'<CR>")
v.tnoremap({"silent"}, "<F1>", "<CMD>execute v:count1 . 'ToggleTerm'<CR>")

require("toggleterm").setup(
  {
    hide_numbers = true, -- hide the number column in toggleterm buffers
    shade_filetypes = {},
    shade_terminals = false,
    -- shading_factor = 0.2, -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
    start_in_insert = true,
    insert_mappings = true, -- whether or not the open mapping applies in insert mode
    terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
    persist_size = true,
    direction = "float",
    close_on_exit = true, -- close the terminal window when the process exits
    shell = vim.o.shell, -- change the default shell
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

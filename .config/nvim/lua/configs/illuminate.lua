local g = vim.g

g.Illuminate_delay = 500
g.Illuminate_highlightUnderCursor = 0
g.Illuminate_ftblacklist = {
  "NvimTree",
  "Trouble",
  "Telescope",
  "DiffviewFiles",
  "DiffviewFileHistory",
  "neo-tree",
  "packer"
}

local v = require("vimp")

v.nnoremap({"silent"}, "<C-n>", ":lua require('illuminate').next_reference {wrap = true}<CR>")
v.nnoremap({"silent"}, "<C-p>", ":lua require('illuminate').next_reference {reverse = true, wrap = true}<CR>")

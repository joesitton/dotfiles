local g = vim.g

g.floaterm_width = 0.99
g.floaterm_height = 0.6
g.floaterm_autoclose = 2
g.floaterm_opener = "edit"
g.floaterm_title = ""
g.floaterm_position = "bottom"

local v = require("vimp")

v.nnoremap("<F1>", ":FloatermToggle<CR>")
v.tnoremap("<F1>", "<C-\\><C-n>:FloatermToggle<CR>")

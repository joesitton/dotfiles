local g = vim.g

g.floaterm_width = 0.8
g.floaterm_height = 0.8
g.floaterm_autoclose = 2
g.floaterm_opener = 'edit'

local v = require("vimp")

v.nnoremap("<F1>", ":FloatermToggle<CR>")
v.tnoremap("<F1>", "<C-\\><C-n>:FloatermToggle<CR>")

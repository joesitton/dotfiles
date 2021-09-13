local v = require("vimp")

v.nnoremap("[b", ":BufferPrevious<CR>")
v.nnoremap("]b", ":BufferNext<CR>")
v.nnoremap("<leader>bd", ":BufferClose<CR>")
v.nnoremap("<leader>bp", ":BufferPick<CR>")
v.nnoremap("<leader>bP", ":BufferPin<CR>")
v.nnoremap("<C-Left>", ":BufferMovePrevious<CR>")
v.nnoremap("<C-Right>", ":BufferMoveNext<CR>")

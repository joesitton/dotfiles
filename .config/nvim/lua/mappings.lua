local v = require("vimp")

v.nnoremap("J", "}")
v.nnoremap("K", "{")
v.nnoremap("H", "^")
v.nnoremap("L", "$")
v.nnoremap("j", "gj")
v.nnoremap("k", "gk")
v.nnoremap("Y", "y$")
v.nnoremap("Q", "@q")

v.nnoremap("<leader>w", ":w<CR>")
v.nnoremap("<leader>q", ":q!<CR>")
v.nnoremap("<leader>z", ":wqa!<CR>")

v.nnoremap("<C-J>", "<C-W><C-J>")
v.nnoremap("<C-K>", "<C-W><C-K>")
v.nnoremap("<C-L>", "<C-W><C-L>")
v.nnoremap("<C-H>", "<C-W><C-H>")

v.nnoremap("[w", "<C-W><C-H>")
v.nnoremap("]w", "<C-W><C-L>")

v.vnoremap("<", "<gv")
v.vnoremap(">", ">gv")

v.xnoremap("[e", ":m '<-2<CR>gv=gv")
v.xnoremap("]e", ":m '>+1<CR>gv=gv")

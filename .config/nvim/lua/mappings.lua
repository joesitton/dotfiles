local ok, _ = pcall(require, "vimp")

if not ok then
  return
end

local v = require("vimp")

v.nnoremap(";", ":")

v.nnoremap("j", "gj")
v.nnoremap("k", "gk")
v.nnoremap("Q", "@q")
v.nnoremap("'", "`")

for _, key in ipairs({"x", "X", "c", "C"}) do
  v.nnoremap(key, '"_' .. key)
end

v.nnoremap("<leader>w", ":w<CR>")
v.nnoremap("<leader>q", ":q!<CR>")
v.nnoremap("<leader>z", ":wqa!<CR>")

v.nnoremap("<C-J>", "<C-W><C-J>")
v.nnoremap("<C-K>", "<C-W><C-K>")
v.nnoremap({"override"}, "<C-L>", "<C-W><C-L>")
v.nnoremap("<C-H>", "<C-W><C-H>")

v.vnoremap("<", "<gv")
v.vnoremap(">", ">gv")

v.xnoremap("[e", ":m '<-2<CR>gv=gv")
v.xnoremap("]e", ":m '>+1<CR>gv=gv")

vim.cmd [[
command! W w !sudo tee % > /dev/null
]]

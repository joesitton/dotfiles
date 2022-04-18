require("indent_blankline").setup(
  {
    show_current_context = false,
    show_trailing_blankline_indent = false,
    show_first_indent_level = false,
    buftype_exclude = {"help", "terminal", "nofile"}
  }
)

local v = require("vimp")

v.nnoremap({"silent"}, "za", "za | :IndentBlanklineRefresh<CR>")
v.nnoremap({"silent"}, "zA", "zA | :IndentBlanklineRefresh<CR>")

v.nnoremap({"silent"}, "zo", "zo | :IndentBlanklineRefresh<CR>")
v.nnoremap({"silent"}, "zO", "zO | :IndentBlanklineRefresh<CR>")

v.nnoremap({"silent"}, "zc", "zc | :IndentBlanklineRefresh<CR>")
v.nnoremap({"silent"}, "zC", "zC | :IndentBlanklineRefresh<CR>")

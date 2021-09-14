local g = vim.g

g.nvim_tree_ignore = {".git", ".cache", "node_modules", "__pycache__"}
g.nvim_tree_gitignore = 1
g.nvim_tree_indent_markers = 1
g.nvim_tree_git_hl = 1
g.nvim_tree_add_trailing = 1
g.nvim_tree_width = 25

local v = require("vimp")

v.nnoremap("<leader>.", ":NvimTreeToggle<CR>")

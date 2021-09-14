local g = vim.g

g.minimap_git_colors = 1
g.minimap_highlight_search = 1
g.minimap_block_filetypes = {"NvimTree"}

local v = require("vimp")

v.nnoremap("<leader>mm", ":MinimapToggle<CR>")

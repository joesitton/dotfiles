vim.g.bufferline = {
    animation = true,
    auto_hide = false,
    tabpages = true,
    closable = true,
    clickable = true,
    exclude_ft = {},
    exclude_name = {},
    icons = true,
    icon_custom_colors = false,
    icon_separator_active = "▎",
    icon_separator_inactive = "▎",
    icon_close_tab = "",
    icon_close_tab_modified = "",
    icon_pinned = "車",
    insert_at_end = false,
    insert_at_start = false,
    maximum_padding = 2,
    maximum_length = 30,
}

local v = require("vimp")

v.nnoremap("[b", ":BufferPrevious<CR>")
v.nnoremap("]b", ":BufferNext<CR>")
v.nnoremap("<leader>bd", ":BufferClose<CR>")
v.nnoremap("<leader>bD", ":BufferWipeout!<CR>")
v.nnoremap("<leader>bp", ":BufferPin<CR>")

v.nnoremap("<C-Left>", ":BufferMovePrevious<CR>")
v.nnoremap("<C-Right>", ":BufferMoveNext<CR>")

v.nnoremap("<leader>pb", ":BufferPick<CR>")

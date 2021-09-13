require("indent_blankline").setup({
    show_trailing_blankline_indent = false,
    buftype_exclude = {"help", "terminal", "nofile"},
})

-- Prevent ghosting cursorlines
vim.o.colorcolumn = "99999"

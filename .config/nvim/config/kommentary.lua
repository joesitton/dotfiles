require('kommentary.config').configure_language("default", {
    prefer_single_line_comments = true,
    use_consistent_indentation = true,
    ignore_whitespace = true,
})

vim.api.nvim_set_keymap("n", "<C-_>", "<Plug>kommentary_line_default", {})
vim.api.nvim_set_keymap("v", "<C-_>", "<Plug>kommentary_visual_default", {})

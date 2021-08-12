require("nvim-autopairs").setup({
    check_ts = true,
    enable_check_bracket_line = false
})

require("nvim-autopairs.completion.compe").setup({
    map_cr = true,
    map_complete = true,
    auto_select = false,
})

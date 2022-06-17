require("toggleterm").setup({
    hide_numbers = true,
    shade_filetypes = {},
    shade_terminals = false,
    start_in_insert = true,
    insert_mappings = true,
    terminal_mappings = true,
    persist_size = true,
    direction = "float",
    close_on_exit = true,
    shell = vim.o.shell,
    size = function(term)
        if term.direction == "horizontal" then
            return 10
        elseif term.direction == "vertical" then
            return vim.o.columns * 0.5
        end
    end,
    highlights = { FloatBorder = { link = "FloatBorder" } },
    float_opts = { border = "rounded" },
})

local v = require("vimp")

v.nnoremap({ "silent" }, "<F1>", "<CMD>execute v:count1 . 'ToggleTerm'<CR>")
v.tnoremap({ "silent" }, "<F1>", "<CMD>execute v:count1 . 'ToggleTerm'<CR>")

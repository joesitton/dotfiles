require("zen-mode").setup({
    window = {
        backdrop = 1, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
        width = 0.66, -- width of the Zen window
        height = 0.9, -- height of the Zen window
        options = {},
    },
    plugins = {
        options = { enabled = true, ruler = false, showcmd = false, laststatus = 0 },
        twilight = { enabled = true }, -- enable to start Twilight when zen mode opens
        gitsigns = { enabled = false }, -- disables git signs
    },
    -- on_open = function(win)
    -- end,
    -- on_close = function()
    -- end
})

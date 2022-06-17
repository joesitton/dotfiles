require("dressing").setup({
    input = {
        enabled = true,
        default_prompt = "❯ ",
        insert_only = true,
        anchor = "SW",
        relative = "cursor",
        -- row = 0,
        -- col = 0,
        border = "rounded",
        prefer_width = 40,
        max_width = nil,
        min_width = 20,
        winblend = 00,
        winhighlight = "",
        get_config = nil,
    },
    select = {
        enabled = true,
        backend = { "telescope" },
        format_item_override = {},
        get_config = nil,
    },
})

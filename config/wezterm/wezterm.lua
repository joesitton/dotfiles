local wez = require("wezterm")
local action = wez.action

return {
    default_prog = { "/bin/zsh" },
    font = wez.font_with_fallback({
        { family = "Iosevka Custom", weight = "Regular" }, -- g@ => <= >= <==== <->
        { family = "Iosevka Custom", weight = "DemiBold" }, -- g@ => <= >= <==== <->
        "Symbols Nerd Font", --  
        "JoyPixels",
    }),
    font_size = 16.5,
    -- enable_csi_u_key_encoding = true,
    window_background_opacity = 0.98,
    hide_tab_bar_if_only_one_tab = true,
    use_fancy_tab_bar = false,
    scrollback_lines = 65536,
    window_padding = {
        left = "0.5cell",
        top = "0.25cell",
        right = "0.5cell",
        bottom = 0,
    },
    -- cell_width = 0.9,
    animation_fps = 1,
    cursor_blink_ease_in = "Constant",
    cursor_blink_ease_out = "Constant",
    cursor_blink_rate = 0,
    window_close_confirmation = "NeverPrompt",
    keys = {
        { key = "RightArrow", mods = "CTRL|SHIFT", action = action.ActivateTabRelative(1) },
        { key = "LeftArrow", mods = "CTRL|SHIFT", action = action.ActivateTabRelative(-1) },
        { key = "+", mods = "CTRL|SHIFT", action = "DisableDefaultAssignment" },
        { key = "_", mods = "CTRL|SHIFT", action = "DisableDefaultAssignment" },
    },
    colors = {
        foreground = "#f8f8f8",
        background = "#101010",
        cursor_bg = "#ffffff",
        ansi = { "#181818", "#ab4642", "#a1b56c", "#f7ca88", "#7cafc2", "#ba8baf", "#86c1b9", "#f8f8f8" },
        brights = { "#585858", "#ab4642", "#a1b56c", "#f7ca88", "#7cafc2", "#ba8baf", "#86c1b9", "#f8f8f8" },
        indexed = {
            [16] = "#dc9656",
            [17] = "#a16946",
            [18] = "#282828",
            [19] = "#383838",
            [20] = "#b8b8b8",
            [21] = "#e8e8e8",
        },
    },
}

require("kommentary.config").configure_language("default", {
    prefer_single_line_comments = true,
    use_consistent_indentation = true,
    ignore_whitespace = true,
    single_line_comment_string = "auto",
    multi_line_comment_strings = "auto",
    hook_function = function()
        require("ts_context_commentstring.internal").update_commentstring()
    end,
})

local v = require("vimp")

v.nmap("<C-_>", "<Plug>kommentary_line_default")
v.vmap("<C-_>", "<Plug>kommentary_visual_default")

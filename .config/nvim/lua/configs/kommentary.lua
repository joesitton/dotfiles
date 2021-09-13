require("kommentary.config").configure_language(
  "default",
  {
    prefer_single_line_comments = true,
    use_consistent_indentation = true,
    ignore_whitespace = true
  }
)

local v = require("vimp")

v.nmap("<C-_>", "<Plug>kommentary_line_default")
v.vmap("<C-_>", "<Plug>kommentary_visual_default")

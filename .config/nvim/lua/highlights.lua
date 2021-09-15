local colors = require("colors.base16")

local cmd = vim.cmd

local function fg(group, color)
  cmd("hi " .. group .. " guifg=" .. color)
end

local function bg(group, color)
  cmd("hi " .. group .. " guibg=" .. color)
end

local function fg_bg(group, fg_color, bg_color)
  cmd("hi " .. group .. " guifg=" .. fg_color .. " guibg=" .. bg_color)
end

cmd("hi Comment gui=italic")
cmd("hi MatchParen gui=underline guibg=" .. colors.gray3)

bg("Normal", "none")
bg("NormalNC", "none")

fg("EndOfBuffer", colors.bg)

fg_bg("WildMenu", colors.black, colors.blue)

bg("NormalFloat", colors.bg)
bg("Floaterm", colors.bg)
bg("TelescopeNormal", colors.bg)
bg("TelescopePreviewNormal", colors.bg)

fg_bg("TelescopeBorder", colors.blue, "none")
fg_bg("FloatBorder", colors.blue, "none")
fg_bg("FloatermBorder", colors.blue, "none")

fg_bg("VertSplit", colors.black, colors.black)
fg_bg("SignColumn", colors.gray5, colors.black)

bg("CursorLine", "none")
fg_bg("LineNr", colors.gray5, colors.black)

bg("Pmenu", colors.gray5)
fg_bg("PmenuSel", colors.black, colors.blue)
bg("PmenuSbar", colors.gray3)
bg("PmenuThumb", colors.fg)

bg("NvimTreeNormal", colors.bg)
fg_bg("NvimTreeVertSplit", colors.bg, colors.bg)
fg_bg("NvimTreeStatusLine", colors.bg, colors.bg)
fg_bg("NvimTreeStatusLineNC", colors.bg, colors.bg)
fg("NvimTreeIndentMarker", colors.gray3)

bg("TreesitterContext", colors.gray3)

fg("IndentBlanklineChar", colors.gray3)

local gg = "GitGutter"

bg(gg .. "Add", colors.black)
bg(gg .. "Change", colors.black)
bg(gg .. "ChangeDelete", colors.black)
bg(gg .. "Delete", colors.black)

local lds = "LspDiagnosticsSign"

fg_bg(lds .. "Warning", colors.yellow, colors.black)
fg_bg(lds .. "Error", colors.red, colors.black)
fg_bg(lds .. "Information", colors.blue, colors.black)
fg_bg(lds .. "Hint", colors.green, colors.black)

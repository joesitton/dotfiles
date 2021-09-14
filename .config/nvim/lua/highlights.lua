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

bg("Normal", "none")
bg("NormalNC", "none")
fg_bg("StatusLine", colors.fg, colors.bg)
fg_bg("StatusLineNC", colors.bg, colors.bg)

fg("EndOfBuffer", colors.bg)

bg("NormalFloat", colors.bg)
bg("Floaterm", colors.bg)
bg("TelescopeNormal", colors.bg)
bg("TelescopePreviewNormal", colors.bg)

fg_bg("TelescopeBorder", colors.blue, "none")
fg_bg("FloatBorder", colors.blue, "none")
fg_bg("FloatermBorder", colors.blue, "none")

fg_bg("VertSplit", colors.bg, colors.bg)
fg_bg("SignColumn", colors.gray, colors.black)

bg("CursorLine", "none")
fg_bg("LineNr", colors.gray, colors.black)
cmd("hi MatchParen gui=underline guibg=" .. colors.darker_gray)

bg("Pmenu", colors.gray)
fg_bg("PmenuSel", colors.black, colors.blue)
bg("PmenuSbar", colors.black)

fg_bg("WildMenu", colors.black, colors.blue)

bg("NvimTreeNormal", colors.bg)
fg("NvimTreeIndentMarker", colors.darker_gray)

fg("IndentBlanklineChar", colors.darker_gray)

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

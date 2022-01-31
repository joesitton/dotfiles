local colors = require("colors.base16")
local primary = colors.blue

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

bg("Normal", "none")
bg("NormalNC", "none")

cmd("hi Comment gui=italic")
cmd("hi MatchParen gui=underline guibg=" .. "#303030")

fg("EndOfBuffer", colors.bg)

fg_bg("WildMenu", colors.black, primary)

bg("NormalFloat", colors.bg)

fg_bg("VertSplit", colors.black, colors.black)
fg_bg("SignColumn", colors.gray5, colors.black)
fg_bg("FoldColumn", primary, colors.black)

cmd("hi CursorLine guibg=none cterm=none")
fg_bg("LineNr", colors.gray5, colors.black)

bg("Pmenu", colors.gray4)
fg_bg("PmenuSel", colors.black, primary)
bg("PmenuSbar", colors.gray3)
bg("PmenuThumb", colors.fg)

bg("Floaterm", colors.bg)
-- bg("TelescopeNormal", colors.bg)
-- bg("TelescopePreviewNormal", colors.bg)

-- fg_bg("TelescopeBorder", primary, "none")
fg_bg("FloatBorder", primary, "none")
fg_bg("FloatermBorder", primary, "none")

bg("NvimTreeNormal", colors.bg)
fg_bg("NvimTreeVertSplit", colors.bg, colors.bg)
fg_bg("NvimTreeStatusLine", colors.bg, colors.bg)
fg_bg("NvimTreeStatusLineNC", colors.bg, colors.bg)
fg("NvimTreeIndentMarker", colors.gray3)
fg("NvimTreeFolderIcon", colors.orange)

fg("IndentBlanklineChar", colors.gray3)

cmd("hi WindowPicker guifg=" .. colors.black .. " guibg=" .. colors.yellow .. " gui=bold,italic")

bg("OffscreenPopup", "#303030")

fg("DevIconDockerfile", colors.blue)

bg("TroubleFoldIcon", colors.bg)
fg_bg("TroubleNormal", colors.fg, colors.bg)
fg_bg("TroubleIndent", colors.gray3, colors.bg)

fg_bg("BufferLineTab", colors.gray5, colors.black)
fg_bg("BufferLineTabSelected", primary, colors.bg)

fg("DiffviewFolderSign", colors.orange)
fg("DiffviewFilePanelPath", colors.bg)

cmd("hi MarkSignHL guifg=" .. colors.red .. " guibg=" .. colors.black .. " gui=bold,italic")

bg("GitGutterAdd", colors.black)
bg("GitGutterChange", colors.black)
bg("GitGutterChangeDelete", colors.black)
bg("GitGutterDelete", colors.black)

fg("DiagnosticWarn", colors.yellow)
fg_bg("DiagnosticSignWarn", colors.yellow, colors.black)
fg("DiagnosticError", colors.red)
fg_bg("DiagnosticSignError", colors.red, colors.black)
fg("DiagnosticInfo", colors.blue)
fg_bg("DiagnosticSignInfo", colors.blue, colors.black)
fg("DiagnosticHint", colors.green)
fg_bg("DiagnosticSignHint", colors.green, colors.black)

fg_bg("TroubleSignWarning", colors.yellow, colors.bg)
fg_bg("TroubleSignError", colors.red, colors.bg)
fg_bg("TroubleSignInformation", colors.blue, colors.bg)
fg_bg("TroubleSignHint", colors.green, colors.bg)

vim.fn.sign_define("DiagnosticSignError", {text = "", texthl = "DiagnosticSignError"})
vim.fn.sign_define("DiagnosticSignWarn", {text = "", texthl = "DiagnosticSignWarn"})
vim.fn.sign_define("DiagnosticSignInfo", {text = "", texthl = "DiagnosticSignInfo"})
vim.fn.sign_define("DiagnosticSignHint", {text = "", texthl = "DiagnosticSignHint"})

cmd("hi CmpItemAbbrDeprecated guifg=" .. colors.gray3 .. " guibg=NONE gui=strikethrough")
fg("CmpItemAbbrMatch", primary)
fg("CmpItemAbbrMatchFuzzy", primary)
fg("CmpItemKindVariable", colors.cyan)
fg("CmpItemKindInterface", colors.cyan)
fg("CmpItemKindText", colors.cyan)
fg("CmpItemKindFunction", colors.purple)
fg("CmpItemKindMethod", colors.purple)
fg("CmpItemKindKeyword", colors.gray7)
fg("CmpItemKindProperty", colors.gray7)
fg("CmpItemKindUnit", colors.gray7)

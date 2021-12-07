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

cmd("hi Comment gui=italic")
cmd("hi MatchParen gui=underline guibg=" .. colors.gray3)

bg("Normal", "none")
bg("NormalNC", "none")

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
bg("TelescopeNormal", colors.bg)
bg("TelescopePreviewNormal", colors.bg)

fg_bg("TelescopeBorder", primary, "none")
fg_bg("FloatBorder", primary, "none")
fg_bg("FloatermBorder", primary, "none")

bg("NvimTreeNormal", colors.bg)
fg_bg("NvimTreeVertSplit", colors.bg, colors.bg)
fg_bg("NvimTreeStatusLine", colors.bg, colors.bg)
fg_bg("NvimTreeStatusLineNC", colors.bg, colors.bg)
fg("NvimTreeIndentMarker", colors.gray3)
fg("NvimTreeFolderIcon", colors.orange)

bg("TreesitterContext", colors.gray3)

fg("IndentBlanklineChar", colors.gray3)

cmd("hi WindowPicker guifg=" .. colors.black .. " guibg=" .. colors.yellow .. " gui=bold,italic")

bg("OffscreenPopup", colors.gray3)

bg("TroubleFoldIcon", colors.bg)
fg_bg("TroubleNormal", colors.fg, colors.bg)
fg_bg("TroubleIndent", colors.gray3, colors.bg)

fg_bg("BufferLineTab", colors.gray5, colors.black)
fg_bg("BufferLineTabSelected", primary, colors.bg)

fg("DiffviewFolderSign", colors.orange)
fg("DiffviewFilePanelPath", colors.bg)

cmd("hi MarkSignHL guifg=" .. colors.red .. " guibg=" .. colors.black .. " gui=bold,italic")

for _, sign in ipairs({"Hint", "Error", "Information", "Other", "Warning"}) do
  local fg = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("TroubleSign" .. sign)), "fg#")

  fg_bg("TroubleSign" .. sign, fg, colors.bg)
end

bg("GitGutterAdd", colors.black)
bg("GitGutterChange", colors.black)
bg("GitGutterChangeDelete", colors.black)
bg("GitGutterDelete", colors.black)

fg_bg("DiagnosticSignWarn", colors.yellow, colors.black)
fg_bg("DiagnosticSignError", colors.red, colors.black)
fg_bg("DiagnosticSignInfo", colors.blue, colors.black)
fg_bg("DiagnosticSignHint", colors.green, colors.black)

vim.fn.sign_define("DiagnosticSignError", {text = "", numhl = "DiagnosticSignError"})
vim.fn.sign_define("DiagnosticSignWarn", {text = "", numhl = "DiagnosticSignWarn"})
vim.fn.sign_define("DiagnosticSignInfo", {text = "", numhl = "DiagnosticSignInfo"})
vim.fn.sign_define("DiagnosticSignHint", {text = "", numhl = "DiagnosticSignHint"})

cmd("hi CmpItemAbbrDeprecated guifg=" .. colors.gray3 .. " guibg=NONE gui=strikethrough")
fg("CmpItemAbbrMatch", primary)
fg("CmpItemAbbrMatchFuzzy", primary)
fg("CmpItemKindVariable", colors.cyan)
fg("CmpItemKindInterface", colors.cyan)
fg("CmpItemKindText", colors.cyan)
fg("CmpItemKindFunction", colors.purple)
fg("CmpItemKindMethod", colors.purple)
fg("CmpItemKindKeyword", colors.gray5)
fg("CmpItemKindProperty", colors.gray5)
fg("CmpItemKindUnit", colors.gray5)

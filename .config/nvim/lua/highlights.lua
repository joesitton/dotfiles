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

-- Normal

bg("Normal", "none")
bg("NormalNC", "none")
bg("NormalFloat", colors.bg)

fg("EndOfBuffer", colors.bg)

fg_bg("FloatBorder", primary, "none")

cmd("hi Comment gui=italic")

cmd("hi MatchParen gui=underline guibg=#303030")

bg("StatusLineNC", colors.gray3)

-- Popup menus

bg("Pmenu", colors.gray4)
fg_bg("PmenuSel", colors.black, primary)
bg("PmenuSbar", colors.black)
bg("PmenuThumb", colors.gray3)

fg_bg("WildMenu", colors.black, primary)

-- Splits and Columns

fg_bg("VertSplit", colors.gray3, colors.gray3)

fg_bg("SignColumn", colors.gray5, colors.black)
fg_bg("FoldColumn", primary, colors.black)

bg("CursorLine", "#303030")
fg_bg("LineNr", colors.gray5, colors.black)

-- Floaterm

bg("Floaterm", colors.bg)
fg_bg("FloatermBorder", primary, "none")

-- Nvim Tree

bg("NvimTreeNormal", colors.bg)
fg_bg("NvimTreeVertSplit", colors.bg, colors.bg)
fg_bg("NvimTreeStatusLine", colors.bg, colors.bg)
fg_bg("NvimTreeStatusLineNC", colors.bg, colors.bg)
fg("NvimTreeIndentMarker", colors.gray3)
fg("NvimTreeFolderIcon", colors.orange)

-- IndentLine

fg("IndentBlanklineChar", colors.gray3)

-- Treesitter

bg("OffscreenPopup", "#303030")

-- Dev Icons

fg("DevIconDockerfile", colors.blue)

-- Scrollbar

bg("ScrollbarHandle", colors.gray4)
fg_bg("ScrollbarSearchHandle", colors.orange, colors.gray4)
fg("ScrollbarSearch", colors.orange)
fg_bg("ScrollbarErrorHandle", colors.red, colors.gray4)
fg("ScrollbarError", colors.red)
fg_bg("ScrollbarWarnHandle", colors.yellow, colors.gray4)
fg("ScrollbarWarn", colors.yellow)
fg_bg("ScrollbarInfoHandle", colors.blue, colors.gray4)
fg("ScrollbarInfo", colors.blue)
fg_bg("ScrollbarHintHandle", colors.green, colors.gray4)
fg("ScrollbarHint", colors.green)
fg_bg("ScrollbarMiscHandle", colors.purple, colors.gray4)
fg("ScrollbarMisc", colors.purple)

-- Bufferline

fg_bg("BufferLineTab", colors.gray5, colors.black)
fg_bg("BufferLineTabSelected", primary, colors.bg)

-- Marks

cmd("hi MarkSignHL guifg=" .. colors.red .. " guibg=" .. colors.black .. " gui=bold,italic")

-- Git Gutter

bg("GitGutterAdd", colors.black)
bg("GitGutterChange", colors.black)
bg("GitGutterChangeDelete", colors.black)
bg("GitGutterDelete", colors.black)

-- Fidget

fg_bg("FidgetTitle", colors.fg, "none")
fg_bg("FidgetTask", primary, "none")

-- Diagnostics

fg("DiagnosticWarn", colors.yellow)
fg_bg("DiagnosticSignWarn", colors.yellow, colors.black)
fg("DiagnosticError", colors.red)
fg_bg("DiagnosticSignError", colors.red, colors.black)
fg("DiagnosticInfo", colors.blue)
fg_bg("DiagnosticSignInfo", colors.blue, colors.black)
fg("DiagnosticHint", colors.green)
fg_bg("DiagnosticSignHint", colors.green, colors.black)

vim.fn.sign_define("DiagnosticSignError", {text = "", texthl = "DiagnosticSignError"})
vim.fn.sign_define("DiagnosticSignWarn", {text = "", texthl = "DiagnosticSignWarn"})
vim.fn.sign_define("DiagnosticSignInfo", {text = "", texthl = "DiagnosticSignInfo"})
vim.fn.sign_define("DiagnosticSignHint", {text = "", texthl = "DiagnosticSignHint"})

-- Cmp (autocomplete)

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

-- Illuminate

cmd("hi! link LspReferenceText illuminatedCurWord")
cmd("hi! link LspReferenceWrite illuminatedCurWord")
cmd("hi! link LspReferenceRead illuminatedWord")

local cmd = vim.cmd

local function fg(group, color)
  cmd("hi! " .. group .. " guifg=" .. color)
end

local function bg(group, color)
  cmd("hi! " .. group .. " guibg=" .. color)
end

local function fg_bg(group, fg_color, bg_color)
  cmd("hi! " .. group .. " guifg=" .. fg_color .. " guibg=" .. bg_color)
end

local colors = require("colors.base16")
local primary = colors.blue

-- Misc

fg("EndOfBuffer", colors.bg)

cmd("hi Comment gui=italic")

-- Normal

bg("Normal", "none")
bg("NormalNC", "none")
bg("NormalFloat", colors.bg)

fg_bg("FloatBorder", primary, "none")

-- Splits, Columns, StatusLine, LineNr

local column_bg = colors.black
local vert_split = colors.dark_gray3
local linenr = colors.dark_gray5

fg_bg("VertSplit", vert_split, vert_split)

bg("StatusLine", vert_split)
bg("StatusLineNC", vert_split)

fg_bg("SignColumn", colors.gray5, column_bg)
fg_bg("FoldColumn", primary, column_bg)

fg_bg("LineNr", linenr, column_bg)

-- CursorLine

local cursorline_bg = colors.black

bg("CursorLine", cursorline_bg)
fg_bg("CursorLineNR", colors.fg, column_bg)

-- Treesitter

local match_bg = cursorline_bg

bg("OffscreenPopup", match_bg)
cmd("hi MatchParen gui=none guibg=" .. match_bg)

-- Popup menus

local pmenu_bg = colors.dark_gray4
local pmenu_sel_bg = colors.dark_gray7
local pmenu_sel_fg = colors.fg
local pmenu_scroll_bg = colors.gray5
local pmenu_doc = colors.dark_gray3

bg("Pmenu", pmenu_bg)
fg_bg("PmenuSel", pmenu_sel_fg, pmenu_sel_bg)
bg("PmenuSbar", pmenu_bg)
bg("PmenuThumb", pmenu_scroll_bg)
bg("DocMenu", pmenu_doc)

-- Telescope

local telescope_bg = colors.bg

fg_bg("TelescopeNormal", colors.dark_gray7, telescope_bg)
fg_bg("TelescopeTitle", telescope_bg, telescope_bg)
fg_bg("TelescopeBorder", telescope_bg, telescope_bg)

bg("TelescopePreviewNormal", telescope_bg)
fg_bg("TelescopePreviewBorder", telescope_bg, telescope_bg)
fg_bg("TelescopePreviewTitle", telescope_bg, telescope_bg)

fg_bg("TelescopeResultsTitle", telescope_bg, telescope_bg)
fg_bg("TelescopeResultsBorder", telescope_bg, telescope_bg)

bg("TelescopePromptNormal", telescope_bg)
fg_bg("TelescopePromptTitle", telescope_bg, telescope_bg)
cmd("hi TelescopePromptPrefix gui=bold guifg=" .. colors.green .. " guibg=" .. telescope_bg)
fg_bg("TelescopePromptBorder", telescope_bg, telescope_bg)

fg_bg("TelescopeResultsLineNr", linenr, "none")

cmd("hi! TelescopeSelection gui=none guifg=" .. pmenu_sel_fg .. " guibg=" .. cursorline_bg)
cmd("hi! TelescopeSelectionCaret gui=bold guifg=" .. colors.yellow .. " guibg=" .. cursorline_bg)

cmd("hi! link TelescopeMatching CmpItemAbbrMatch")
cmd("hi! link TelescopePreviewLine Search")

cmd("hi! link TelescopeResultsFunction CmpItemKindFunction")
cmd("hi! link TelescopeResultsClass CmpItemKindFunction")
cmd("hi! link TelescopeResultsVariable CmpItemKindVariable")
cmd("hi! link TelescopeResultsConstant CmpItemKindConstant")
cmd("hi! link TelescopeResultsProperty CmpItemKindProperty")

-- Nvim Tree

local nvim_tree_bg = colors.dark_black
local indent_marker_fg = colors.dark_gray3

bg("NvimTreeNormal", nvim_tree_bg)
fg_bg("NvimTreeVertSplit", nvim_tree_bg, nvim_tree_bg)
fg_bg("NvimTreeStatusLine", nvim_tree_bg, nvim_tree_bg)
fg_bg("NvimTreeStatusLineNC", nvim_tree_bg, nvim_tree_bg)
fg("NvimTreeIndentMarker", indent_marker_fg)
fg("NvimTreeFolderIcon", colors.orange)
bg("NvimTreeCursorLine", "none")
fg_bg("NvimTreeEndOfBuffer", nvim_tree_bg, nvim_tree_bg)

-- IndentLine

fg("IndentBlanklineChar", indent_marker_fg)

-- Dev Icons

fg("DevIconDockerfile", colors.blue)

-- Bufferline

fg_bg("BufferLineTab", colors.gray5, colors.dark_black)
fg_bg("BufferLineTabSelected", primary, colors.bg)

-- Marks

cmd("hi MarkSignHL guifg=" .. colors.red .. " guibg=" .. column_bg .. " gui=bold,italic")

-- Git Gutter

bg("GitGutterAdd", column_bg)
bg("GitGutterChange", column_bg)
bg("GitGutterChangeDelete", column_bg)
bg("GitGutterDelete", column_bg)

-- Fidget

fg_bg("FidgetTitle", colors.fg, "none")
fg_bg("FidgetTask", primary, "none")

-- Diagnostics

fg("DiagnosticWarn", colors.yellow)
fg_bg("DiagnosticSignWarn", colors.yellow, column_bg)
fg("DiagnosticError", colors.red)
fg_bg("DiagnosticSignError", colors.red, column_bg)
fg("DiagnosticInfo", colors.blue)
fg_bg("DiagnosticSignInfo", colors.blue, column_bg)
fg("DiagnosticHint", colors.green)
fg_bg("DiagnosticSignHint", colors.green, column_bg)

vim.fn.sign_define("DiagnosticSignError", {text = "", texthl = "DiagnosticSignError"})
vim.fn.sign_define("DiagnosticSignWarn", {text = "", texthl = "DiagnosticSignWarn"})
vim.fn.sign_define("DiagnosticSignInfo", {text = "", texthl = "DiagnosticSignInfo"})
vim.fn.sign_define("DiagnosticSignHint", {text = "", texthl = "DiagnosticSignHint"})

-- Cmp (autocomplete)

cmd("hi CmpItemAbbrMatch gui=bold,underline guifg=" .. colors.fg .. " guibg=none")
cmd("hi! link CmpItemAbbrMatchFuzzy CmpItemAbbrMatch")

fg("CmpItemAbbrDefault", colors.gray)
fg("CmpItemKindVariable", colors.blue)
fg("CmpItemKindInterface", colors.blue)
fg("CmpItemKindFunction", colors.purple)
fg("CmpItemKindMethod", colors.purple)
fg("CmpItemKindSnippet", colors.green)
fg("CmpItemKindText", colors.gray7)
fg("CmpItemKindKeyword", colors.gray7)
fg("CmpItemKindProperty", colors.gray7)
fg("CmpItemKindUnit", colors.gray7)
cmd("hi CmpItemAbbrDeprecated guifg=" .. colors.dark_black .. " guibg=NONE gui=strikethrough")

-- Illuminate

cmd("hi! link LspReferenceText illuminatedCurWord")
cmd("hi! link LspReferenceWrite illuminatedCurWord")
cmd("hi! link LspReferenceRead illuminatedWord")

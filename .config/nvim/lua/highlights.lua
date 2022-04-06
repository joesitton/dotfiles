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

local function fg_bg_nogui(group, fg_color, bg_color)
  cmd("hi! " .. group .. " guifg=" .. fg_color .. " guibg=" .. bg_color .. " gui=none")
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

fg_bg_nogui("CursorLine", "none", cursorline_bg)
cmd [[hi! CursorLine cterm=none]]
fg_bg("CursorLineNR", colors.fg, column_bg)
bg("Visual", colors.dark_gray3)

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

-- Git

fg_bg_nogui("DiffAdd", "none", colors.dark_green)
fg_bg_nogui("DiffChange", "none", colors.dark_blue)
fg_bg_nogui("DiffDelete", "none", colors.dark_red)
fg_bg_nogui("DiffRemove", colors.gray5, "none")
fg_bg_nogui("DiffText", "none", "#2c5361")

-- DiffView

fg_bg_nogui("DiffviewFilePanelRootPath", colors.purple, "none")
fg_bg_nogui("DiffviewFilePanelTitle", colors.blue, "none")
fg_bg("DiffviewFilePanelCounter", colors.orange, "none")
fg_bg("DiffviewFilePanelInsertions", colors.green, "none")
fg_bg("DiffviewFilePanelDeletions", colors.red, "none")
fg_bg("DiffviewFolderSign", colors.orange, "none")

-- Neogit

fg("NeogitFilePath", colors.purple)
fg_bg("NeogitHunkHeader", colors.fg, colors.dark_gray3)
fg_bg("NeogitCommitViewHeader", colors.orange, "none")
fg_bg("NeogitFold", colors.fg, vert_split)

-- Barbar

fg("BufferTabpages", primary)

local active_buffer_bg = colors.dark_black

bg("BufferCurrent", active_buffer_bg)
-- cmd [[hi! BufferCurrent gui=italic]]
bg("BufferCurrentIcon", active_buffer_bg)
fg_bg("BufferCurrentMod", colors.red, active_buffer_bg)
-- cmd [[hi! BufferCurrentMod gui=italic]]
fg_bg("BufferCurrentSign", primary, active_buffer_bg)

local visible_buffer_fg = colors.gray
local visible_buffer_bg = colors.black

bg("BufferVisible", visible_buffer_bg)
bg("BufferVisibleIcon", visible_buffer_bg)
fg_bg("BufferVisible", visible_buffer_fg, visible_buffer_bg)
fg_bg("BufferVisibleSign", colors.green, visible_buffer_bg)

local inactive_buffer_fg = colors.dark_gray5
local inactive_buffer_bg = colors.black

fg_bg("BufferInactive", inactive_buffer_fg, inactive_buffer_bg)
fg_bg("BufferInactiveMod", colors.red, inactive_buffer_bg)
bg("BufferInactiveIcon", inactive_buffer_bg)
fg_bg("BufferInactiveSign", inactive_buffer_fg, inactive_buffer_bg)

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
cmd("hi TelescopePromptPrefix gui=bold guifg=" .. colors.yellow .. " guibg=" .. telescope_bg)
fg_bg("TelescopePromptBorder", telescope_bg, telescope_bg)

fg_bg("TelescopeResultsLineNr", linenr, "none")

cmd("hi! TelescopeSelection gui=none guifg=" .. pmenu_sel_fg .. " guibg=" .. cursorline_bg)
cmd("hi! TelescopeSelectionCaret gui=none guifg=" .. colors.yellow .. " guibg=" .. cursorline_bg)

cmd("hi! link TelescopeMatching CmpItemAbbrMatch")
cmd("hi! link TelescopePreviewLine Search")

cmd("hi! link TelescopeResultsFunction CmpItemKindFunction")
cmd("hi! link TelescopeResultsClass CmpItemKindFunction")
cmd("hi! link TelescopeResultsVariable CmpItemKindVariable")
cmd("hi! link TelescopeResultsConstant CmpItemKindConstant")
cmd("hi! link TelescopeResultsProperty CmpItemKindProperty")

-- Tree

local tree_bg = colors.bg
local indent_marker_fg = colors.dark_gray3

bg("NeoTreeNormal", tree_bg)
bg("NeoTreeNormalNC", tree_bg)
fg("TreeIndentMarker", indent_marker_fg)
fg("TreeExpander", colors.orange)
fg("TreeModified", colors.red)
fg("NeoTreeDirectoryIcon", colors.orange)
fg("NeoTreeRootName", colors.purple)
-- cmd [[hi! NeoTreeRootName gui=none]]
cmd [[hi! link NeoTreeFileIcon DevIconDefault]]

fg_bg("NeoTreeGitUntracked", colors.red, "none")
fg_bg("NeoTreeGitConflict", colors.red, "none")
fg_bg("NeoTreeGitModified", colors.green, "none")
fg_bg("NeoTreeGitRenamed", colors.purple, "none")
fg_bg("NeoTreeGitDeleted", colors.red, "none")
fg_bg("NeoTreeGitAdded", colors.green, "none")

-- IndentLine

fg("IndentBlanklineChar", indent_marker_fg)

-- Dev Icons

fg("DevIconDockerfile", colors.blue)

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

-- Illuminate

cmd("hi! link LspReferenceText illuminatedCurWord")
cmd("hi! link LspReferenceWrite illuminatedCurWord")
cmd("hi! link LspReferenceRead illuminatedWord")

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

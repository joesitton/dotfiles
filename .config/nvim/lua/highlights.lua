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

bg("Pmenu", colors.gray5)
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

-- fg_bg("DiffAdd", "none", "#40482b")
-- fg_bg("DiffChange", "none", colors.blue)
-- fg_bg("DiffRemove", "none", colors.red)
-- fg_bg("DiffDelete", "none", colors.red)

for _, sign in ipairs({"Hint", "Error", "Information", "Other", "Warning"}) do
  local fg = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("TroubleSign" .. sign)), "fg#")

  fg_bg("TroubleSign" .. sign, fg, colors.bg)
end

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

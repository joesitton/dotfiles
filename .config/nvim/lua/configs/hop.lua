require("hop").setup()

local v = require("vimp")

v.bind("no", "f", ":HopChar1CurrentLineAC<CR>")
v.bind("no", "F", ":HopChar1CurrentLineBC<CR>")

v.nnoremap("s", ":HopChar2AC<CR>")
v.nnoremap("S", ":HopChar2BC<CR>")

v.nnoremap(
  {"silent"},
  "t",
  ":lua require('hop').hint_char1({direction = require('hop.hint').HintDirection.AFTER_CURSOR, inclusive_jump = true})<CR>"
)
v.nnoremap(
  {"silent"},
  "T",
  ":lua require('hop').hint_char1({direction = require('hop.hint').HintDirection.BEFORE_CURSOR, inclusive_jump = true})<CR>"
)
v.onoremap(
  {"silent"},
  "t",
  ":lua require('hop').hint_char1({direction = require('hop.hint').HintDirection.AFTER_CURSOR, inclusive_jump = true})<CR>"
)
v.onoremap(
  {"silent"},
  "T",
  ":lua require('hop').hint_char1({direction = require('hop.hint').HintDirection.BEFORE_CURSOR, inclusive_jump = true})<CR>"
)

v.bind("no", "J", ":HopLineAC<CR>")
v.bind("no", "K", ":HopLineBC<CR>")

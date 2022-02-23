require("hop").setup(
  {
    teasing = false
  }
)

local v = require("vimp")

v.bind({"silent"}, "no", "f", ":HopChar1CurrentLineAC<CR>")
v.bind({"silent"}, "no", "F", ":HopChar1CurrentLineBC<CR>")

v.nnoremap({"silent"}, "s", ":HopChar2AC<CR>")
v.nnoremap({"silent"}, "S", ":HopChar2BC<CR>")

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

v.bind({"silent"}, "no", "J", ":HopLineAC<CR>")
v.bind({"silent"}, "no", "K", ":HopLineBC<CR>")

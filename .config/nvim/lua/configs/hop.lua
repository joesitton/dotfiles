require("hop").setup(
  {
    teasing = false
  }
)

local v = require("vimp")

v.bind("no", "J", ":HopLineAC<CR>")
v.bind("no", "K", ":HopLineBC<CR>")

v.nnoremap({"silent", "override"}, "s", ":HopChar2AC<CR>")
v.nnoremap({"silent", "override"}, "S", ":HopChar2BC<CR>")

v.nnoremap({"silent"}, "f", ":HopChar1CurrentLineAC<CR>")
v.nnoremap({"silent"}, "F", ":HopChar1CurrentLineBC<CR>")
v.onoremap({"silent"}, "f", ":HopChar1CurrentLineAC<CR>")
v.onoremap({"silent"}, "F", ":HopChar1CurrentLineBC<CR>")
v.xnoremap(
  {"silent"},
  "f",
  function()
    return require("hop").hint_char1({direction = require("hop.hint").HintDirection.AFTER_CURSOR})
  end
)
v.xnoremap(
  {"silent"},
  "F",
  function()
    return require("hop").hint_char1({direction = require("hop.hint").HintDirection.BEFORE_CURSOR})
  end
)

local function HopChar1Inc(direction)
  return require("hop").hint_char1(
    {
      direction = require("hop.hint").HintDirection[direction],
      inclusive_jump = true,
      current_line_only = true
    }
  )
end

v.nnoremap(
  {"silent"},
  "t",
  function()
    return HopChar1Inc("AFTER_CURSOR")
  end
)
v.nnoremap(
  {"silent"},
  "T",
  function()
    return HopChar1Inc("BEFORE_CURSOR")
  end
)
v.onoremap(
  {"silent"},
  "t",
  function()
    return HopChar1Inc("AFTER_CURSOR")
  end
)
v.onoremap(
  {"silent"},
  "T",
  function()
    return HopChar1Inc("BEFORE_CURSOR")
  end
)

require("FTerm").setup(
  {
    border = "none",
    hl = "NormalFloat",
    dimensions = {
      height = 0.6,
      width = 1,
      y = 1
    }
  }
)

local v = require("vimp")

v.nnoremap("<F1>", "<CMD>lua require('FTerm').toggle()<CR>")
v.tnoremap("<F1>", "<C-\\><C-n><CMD>lua require('FTerm').toggle()<CR>")

require("marks").setup(
  {
    refresh_interval = 250,
    sign_priority = {
      lower = 10,
      upper = 15,
      builtin = 8,
      bookmark = 20
    }
  }
)

local v = require("vimp")

v.nnoremap("]m", "<Plug>(Marks-next)")
v.nnoremap("[m", "<Plug>(Marks-prev)")

require("hlslens").setup(
  {
    calm_down = true
  }
)

local v = require("vimp")

v.nnoremap({"silent"}, "n", "<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>")
v.nnoremap({"silent"}, "N", "<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>")
v.nnoremap({"silent"}, "*", "*<Cmd>lua require('hlslens').start()<CR>")
v.nnoremap({"silent"}, "#", "#<Cmd>lua require('hlslens').start()<CR>")
v.nnoremap({"silent"}, "g*", "g*<Cmd>lua require('hlslens').start()<CR>")
v.nnoremap({"silent"}, "g#", "g#<Cmd>lua require('hlslens').start()<CR>")

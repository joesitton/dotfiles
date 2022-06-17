local g = vim.g

g.ultest_pass_sign = ""
g.ultest_fail_sign = ""
g.ultest_running_sign = ""
g.ultest_not_run_sign = ""
g.ultest_summary_width = 30
g.ultest_output_max_height = 10
g.ultest_use_pty = true
-- g.ultest_output_on_line = false

local v = require("vimp")

v.nnoremap("[t", "<Plug>(ultest-prev-fail)")
v.nnoremap("]t", "<Plug>(ultest-next-fail)")

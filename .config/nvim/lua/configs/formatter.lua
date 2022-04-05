local g = vim.g

g.neoformat_basic_format_align = 0
g.neoformat_basic_format_retab = 0
g.neoformat_basic_format_trim = 1
g.neoformat_run_all_formatters = 1
g.neoformat_only_msg_on_error = 1

g.neoformat_lua_luafmt = {
  exe = "luafmt",
  args = {"-i 2"}
}

g.neoformat_python_enabled = {"black", "isort"}

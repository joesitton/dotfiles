local cmd = vim.cmd

cmd [[ 
augroup cursor_pos
  autocmd!
  autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END
]]

cmd [[ 
augroup no_repeat_comment
  autocmd!
  autocmd BufNewFile,BufRead * setlocal formatoptions-=cro
augroup END
]]

cmd [[
augroup tree_pane
  autocmd!
  autocmd BufEnter NvimTree setlocal sidescrolloff=0
augroup END
]]

cmd [[
augroup trouble
  autocmd!
  autocmd BufEnter Trouble setlocal scrolloff=1
augroup END
]]

cmd [[
augroup auto_format
  autocmd!
  autocmd BufWritePost * silent! FormatWrite
augroup END
]]

cmd [[
augroup highlight_yank
  autocmd!
  autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="Search", timeout=500}
augroup END
]]

cmd(
  [[
augroup config_update
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  autocmd BufWritePost highlights.lua source <afile>
  autocmd ColorScheme * source ]] ..
    vim.fn.stdpath("config") .. [[/lua/highlights.lua
augroup END
]]
)

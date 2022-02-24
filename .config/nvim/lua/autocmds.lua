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
  autocmd BufNewFile,BufReadPost * setlocal formatoptions-=cro
augroup END
]]

cmd [[
augroup fix_tree_pos
  autocmd!
  autocmd BufEnter NvimTree execute "normal! 0"
augroup END
]]

cmd [[
augroup auto_format
  autocmd!
  autocmd BufWritePost * silent! FormatWrite
augroup END
]]

cmd [[
augroup colorizer
  autocmd!
  autocmd BufReadPost * ColorizerAttachToBuffer
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

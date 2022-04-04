local cmd = vim.cmd

cmd [[
augroup no_repeat_comment
  autocmd!
  autocmd FileType * set formatoptions-=cro
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
  autocmd BufWritePre * silent! undojoin | Neoformat
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

cmd [[
augroup illuminate
  autocmd!
  autocmd VimEnter * hi! link illuminatedWord CursorLine | hi! clear illuminatedCurWord
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

local cmd = vim.cmd

cmd([[
augroup no_repeat_comment
  autocmd!
  autocmd BufWinEnter * set formatoptions-=cro
augroup END
]])

cmd([[
augroup vimrc_help_vertical_split
  autocmd!
  autocmd BufEnter *.txt if &buftype == 'help' | wincmd L | endif
augroup END
]])

cmd([[
augroup attach_colorizer
  autocmd!
  autocmd BufReadPost * ColorizerAttachToBuffer
augroup END
]])

cmd([[
augroup highlight_yank
  autocmd!
  autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="Search", timeout=500}
augroup END
]])

cmd([[
augroup illuminate
  autocmd!
  autocmd VimEnter * hi! link illuminatedWord CursorLine | hi! clear illuminatedCurWord
augroup END
]])

cmd([[
augroup ultest_runner
    au!
    au BufWritePost test* UltestNearest
augroup END
]])

cmd([[
augroup config_update
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  autocmd BufWritePost highlights.lua source <afile>
  autocmd ColorScheme * source ]] .. vim.fn.stdpath("config") .. [[/lua/highlights.lua
augroup END
]])

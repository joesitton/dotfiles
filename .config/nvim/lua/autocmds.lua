local cmd = vim.cmd

cmd [[ autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif ]]

cmd 'autocmd FocusGained,BufEnter * :checktime'

cmd('autocmd ColorScheme * source ' .. vim.fn.stdpath("config") .. '/lua/highlights.lua')

cmd [[
augroup packer_user_config
      autocmd!
      autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup end
]]

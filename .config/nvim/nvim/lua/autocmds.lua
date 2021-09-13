vim.cmd [[ autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif ]]

vim.cmd [[ autocmd FocusGained,BufEnter * :checktime ]]

vim.cmd [[
augroup packer_user_config
      autocmd!
      autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup end
]]

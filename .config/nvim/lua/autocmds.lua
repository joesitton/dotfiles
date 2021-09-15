local cmd = vim.cmd

cmd [[ autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif ]]

cmd("autocmd ColorScheme * source " .. vim.fn.stdpath("config") .. "/lua/highlights.lua")

cmd "autocmd FocusGained,BufEnter * :checktime"

cmd "autocmd BufWritePost highlights.lua source <afile>"

cmd "autocmd BufEnter NvimTree setlocal sidescrolloff=0"

-- cmd "autocmd BufWritePre * silent! FormatWrite"

cmd "autocmd BufWritePost plugins.lua source <afile> | PackerCompile"

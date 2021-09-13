local v = require("vimp")

v.nmap("/", "<Plug>(incsearch-forward)")
v.nmap("?", "<Plug>(incsearch-backward)")
v.nmap("n", "<Plug>(incsearch-nohl-n)")
v.nmap("N", "<Plug>(incsearch-nohl-N)")

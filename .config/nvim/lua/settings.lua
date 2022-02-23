vim.cmd "colo base16-default-dark"

local options = {
  -- Max column for syntax
  synmaxcol = 500,
  colorcolumn = "99999",
  -- Clipboard
  -- clipboard = "unnamedplus",
  -- Persistent undo
  undofile = true,
  undodir = vim.fn.stdpath("data") .. "/undodir",
  -- Tabs
  autoindent = true,
  smartindent = true,
  breakindent = true,
  expandtab = true,
  smarttab = true,
  tabstop = 4,
  softtabstop = 4,
  shiftwidth = 2,
  -- Number lines
  number = true,
  numberwidth = 4,
  relativenumber = false,
  signcolumn = "auto",
  cursorline = true,
  -- Scrolloffs
  scrolloff = 5,
  sidescrolloff = 10,
  -- Searching
  smartcase = true,
  ignorecase = true,
  hlsearch = true,
  incsearch = true,
  -- Timeouts
  updatetime = 100,
  timeout = true,
  timeoutlen = 1000,
  ttimeout = true,
  ttimeoutlen = 0,
  -- Tabs
  showtabline = 2,
  -- Splits
  splitright = true,
  splitbelow = true,
  -- Wild menu
  wildignorecase = true,
  wildmode = "list:longest,full",
  -- Folds
  foldmethod = "indent",
  foldlevelstart = 999,
  -- Other
  title = true,
  hidden = true,
  mouse = "a",
  shortmess = "sIcAWFa",
  whichwrap = "b,s,<>[]hl",
  -- virtualedit = "onemore",
  autoread = true,
  linebreak = true,
  lazyredraw = true,
  cmdheight = 2,
  pumheight = 20,
  wrap = false,
  showmode = false,
  backup = false,
  writebackup = false,
  sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal",
  completeopt = "menu,menuone,noselect",
  guicursor = "n-v-o:block,c-i-ci-ve-sm:ver25,r-cr:hor25"
}

for k, v in pairs(options) do
  vim.o[k] = v
end

vim.g.python3_host_prog = "/home/joe/.config/nvim/.env/bin/python"

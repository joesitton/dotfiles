-- Leader key
vim.g.mapleader = " "

local options = {
  -- Max column for syntax
  synmaxcol = 500,
  -- Clipboard
  clipboard = "unnamedplus",
  -- Persistent undo
  undofile = true,
  undodir = vim.fn.stdpath("data") .. "/undodir",
  -- Tabs
  autoindent = true,
  smartindent = true,
  expandtab = true,
  smarttab = true,
  tabstop = 4,
  softtabstop = 4,
  shiftwidth = 4,
  -- Number lines
  number = true,
  numberwidth = 2,
  relativenumber = false,
  signcolumn = "auto",
  cursorline = true,
  -- Scrolloffs
  scrolloff = 5,
  sidescrolloff = 10,
  -- Searching
  smartcase = true,
  ignorecase = true,
  hlsearch = false,
  incsearch = true,
  -- Timeouts
  updatetime = 300,
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
  -- Other
  title = true,
  hidden = true,
  mouse = "a",
  autoread = true,
  linebreak = true,
  lazyredraw = true,
  cmdheight = 2,
  shortmess = "Ic",
  pumheight = 20,
  wrap = false,
  showmode = false,
  backup = false,
  writebackup = false
}

for k, v in pairs(options) do
  vim.o[k] = v
end

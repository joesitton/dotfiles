require("trouble").setup(
  {
    mode = "document_diagnostics",
    height = 8,
    auto_fold = true,
    auto_preview = false,
    use_diagnostic_signs = true
  }
)

local v = require("vimp")

v.nnoremap(
  "<F5>",
  function()
    if require("nvim-tree.view").win_open() then
      vim.cmd("NvimTreeClose")
      vim.cmd("TroubleToggle")
      vim.cmd("NvimTreeOpen")
      vim.cmd("wincmd p")
    else
      vim.cmd("TroubleToggle")
    end
  end
)

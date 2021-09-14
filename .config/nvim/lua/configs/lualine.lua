require("lualine").setup(
  {
    options = {
      section_separators = "",
      component_separators = "│",
      disabled_filetypes = {"NvimTree", "minimap"},
    },
    sections = {
      lualine_a = {"mode"},
      lualine_b = {{"filename", path = 1}, "branch", "diff"},
      lualine_c = {},
      -- lualine_x = {
      --   {
      --     "diagnostics",
      --     sources = {"nvim_lsp"},
      --     color_error = colors.red,
      --     color_warn = colors.yellow,
      --     color_info = colors.blue,
      --     color_hint = colors.white,
      --     symbols = {error = "•", warn = "•", info = "•", hint = "•"}
      --   }
      -- },
      lualine_x = {},
      lualine_y = {"encoding", "filetype"},
      lualine_z = {"progress"}
    },
    extensions = {"nvim-tree", "quickfix"}
  }
)

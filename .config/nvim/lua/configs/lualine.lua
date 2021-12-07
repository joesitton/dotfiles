require("lualine").setup(
  {
    options = {
      theme = "auto",
      icons_enabled = true,
      always_divide_middle = true,
      component_separators = {left = "", right = ""},
      section_separators = {left = "", right = ""},
      disabled_filetypes = {"NvimTree", "minimap"}
    },
    sections = {
      lualine_a = {"mode"},
      lualine_b = {{"filename", path = 0, shorting_target = 40}, "branch", "diff"},
      lualine_c = {},
      lualine_x = {"filetype"},
      lualine_y = {
        {
          "diagnostics",
          sources = {"nvim_lsp"},
          diagnostics_color = {
            error = "DiagnosticSignError",
            warn = "DiagnosticSignWarn",
            info = "DiagnosticSignInfo",
            hint = "DiagnosticSignHint"
          },
          symbols = {error = "  ", warn = "  ", info = "  ", hint = " "},
          colored = true
        }
      },
      lualine_z = {}
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {{"filename", path = 0, shorting_target = 40}},
      lualine_c = {},
      lualine_x = {"filetype"},
      lualine_y = {},
      lualine_z = {}
    },
    extensions = {"nvim-tree", "quickfix"}
  }
)

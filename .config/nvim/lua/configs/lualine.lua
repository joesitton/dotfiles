require("lualine").setup(
  {
    options = {
      theme = "auto",
      icons_enabled = true,
      always_divide_middle = true,
      component_separators = {left = "", right = ""},
      section_separators = {left = "", right = ""},
      disabled_filetypes = {"NvimTree"}
    },
    sections = {
      lualine_a = {"mode"},
      lualine_b = {
        "branch",
        "diff",
        {
          "filename",
          path = 1,
          shorting_target = 40,
          symbols = {
            modified = " ",
            readonly = " "
          }
        },
        {
          "diagnostics",
          sources = {"nvim_diagnostic"},
          diagnostics_color = {
            error = "DiagnosticSignError",
            warn = "DiagnosticSignWarn",
            info = "DiagnosticSignInfo",
            hint = "DiagnosticSignHint"
          },
          symbols = {error = " ", warn = " ", info = " ", hint = " "},
          colored = true
        }
      },
      lualine_c = {},
      lualine_x = {"filetype"},
      lualine_y = {},
      lualine_z = {"progress"}
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {{"filename", path = 1, shorting_target = 40}},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {}
    },
    extensions = {"nvim-tree", "quickfix"}
  }
)

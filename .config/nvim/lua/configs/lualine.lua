local colors = require("colors.base16")

local base16_theme = {
  normal = {
    a = {bg = colors.blue, fg = colors.bg, gui = "bold"},
    b = {bg = colors.gray4, fg = colors.fg},
    c = {bg = colors.gray3, fg = colors.fg}
  },
  insert = {
    a = {bg = colors.green, fg = colors.bg, gui = "bold"},
    b = {bg = colors.gray4, fg = colors.fg},
    c = {bg = colors.gray3, fg = colors.fg}
  },
  visual = {
    a = {bg = colors.orange, fg = colors.bg, gui = "bold"},
    b = {bg = colors.gray4, fg = colors.fg},
    c = {bg = colors.gray3, fg = colors.fg}
  },
  replace = {
    a = {bg = colors.red, fg = colors.bg, gui = "bold"},
    b = {bg = colors.gray4, fg = colors.fg},
    c = {bg = colors.gray3, fg = colors.fg}
  },
  command = {
    a = {bg = colors.purple, fg = colors.bg, gui = "bold"},
    b = {bg = colors.gray4, fg = colors.fg},
    c = {bg = colors.gray3, fg = colors.fg}
  },
  inactive = {
    a = {bg = colors.black, fg = colors.gray7, gui = "bold"},
    b = {bg = colors.black, fg = colors.gray7},
    c = {bg = colors.black, fg = colors.gray7}
  }
}

require("lualine").setup(
  {
    options = {
      theme = base16_theme,
      icons_enabled = true,
      always_divide_middle = true,
      component_separators = {left = "", right = ""},
      section_separators = {left = "", right = ""},
      disabled_filetypes = {"NvimTree", "Trouble", "Floaterm", "minimap"}
    },
    sections = {
      lualine_a = {"mode"},
      lualine_b = {
        {
          "filename",
          path = 1,
          shorting_target = 40,
          symbols = {
            modified = " ",
            readonly = " "
          }
        },
        "branch",
        "diff"
      },
      lualine_c = {},
      lualine_x = {
        {
          "diagnostics",
          sources = {"nvim_diagnostic"},
          symbols = {error = " ", warn = " ", info = " ", hint = " "},
          colored = true
        },
        "filetype"
      },
      lualine_y = {},
      lualine_z = {"progress"}
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {
        {
          "filename",
          path = 1,
          shorting_target = 40,
          symbols = {
            modified = " ",
            readonly = " "
          }
        }
      },
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {}
    },
    extensions = {"nvim-tree", "quickfix"}
  }
)

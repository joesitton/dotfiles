local colors = {
  black = "#282828",
  gray = "#484848",
  white = "#d8d8d8",
  red = "#ab4642",
  green = "#a1b56c",
  blue = "#7cafc2",
  yellow = "#f7ca88",
  orange = "#dc9656"
}

require("lualine").setup(
  {
    options = {
      section_separators = "",
      component_separators = "│",
      theme = {
        normal = {
          a = {bg = colors.blue, fg = colors.black, gui = "bold"},
          b = {bg = colors.gray, fg = colors.white},
          c = {bg = colors.black, fg = colors.gray}
        },
        insert = {
          a = {bg = colors.green, fg = colors.black, gui = "bold"}
        },
        visual = {
          a = {bg = colors.yellow, fg = colors.black, gui = "bold"}
        },
        replace = {
          a = {bg = colors.red, fg = colors.black, gui = "bold"}
        },
        command = {
          a = {bg = colors.blue, fg = colors.black, gui = "bold"}
        },
        inactive = {
          a = {bg = colors.black, fg = colors.gray, gui = "bold"},
          b = {bg = colors.black, fg = colors.gray},
          c = {bg = colors.black, fg = colors.gray}
        }
      }
    },
    sections = {
      lualine_a = {"mode"},
      lualine_b = {"branch"},
      lualine_c = {"diff"},
      lualine_x = {
        {
          "diagnostics",
          sources = {"nvim_lsp"},
          color_error = colors.red,
          color_warn = colors.yellow,
          color_info = colors.blue,
          color_hint = colors.white,
          symbols = {error = "•", warn = "•", info = "•", hint = "•"}
        }
      },
      lualine_y = {"filetype"},
      lualine_z = {"progress"}
    },
    extensions = {"nvim-tree", "quickfix"}
  }
)

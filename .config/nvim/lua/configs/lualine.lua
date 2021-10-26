local colors = require("colors.base16")

local gps = require("nvim-gps")

gps.setup(
  {
    separator = " › ",
    icons = {
      ["container-name"] = " "
    }
  }
)

require("lualine").setup(
  {
    options = {
      section_separators = "",
      component_separators = "│",
      disabled_filetypes = {"NvimTree", "minimap"}
    },
    sections = {
      lualine_a = {"mode"},
      lualine_b = {{"filename", path = 1}, "branch", "diff"},
      lualine_c = {
        function()
          if gps.is_available() then
            return gps.get_location()
          else
            return ""
          end
        end
      },
      lualine_x = {
        {
          "diagnostics",
          sources = {"nvim_lsp"},
          color_error = colors.red,
          color_warn = colors.yellow,
          color_info = colors.blue,
          color_hint = colors.white
          -- symbols = {error = "•", warn = "•", info = "•", hint = "•"}
        }
      },
      lualine_y = {"filetype"},
      lualine_z = {}
    },
    extensions = {"nvim-tree", "quickfix"}
  }
)

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

local gps = require("nvim-gps")

require("lualine").setup(
  {
    options = {
      section_separators = "",
      component_separators = "│",
    },
    sections = {
      lualine_a = {"mode"},
      lualine_b = {{"filename", path = 1}, "branch", "diff"},
      lualine_c = {gps.get_location, condition = gps.is_available},
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

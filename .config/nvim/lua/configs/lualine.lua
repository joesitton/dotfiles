local colors = require("colors.base16")

local base16_theme = {
  normal = {
    a = {bg = colors.blue, fg = colors.bg, gui = "bold"},
    b = {bg = colors.gray4, fg = colors.fg},
    c = {bg = colors.dark_black, fg = colors.fg},
    x = {bg = colors.dark_black, fg = colors.gray6}
  },
  insert = {
    a = {bg = colors.green, fg = colors.bg, gui = "bold"},
    b = {bg = colors.gray4, fg = colors.fg},
    c = {bg = colors.dark_black, fg = colors.fg},
    x = {bg = colors.dark_black, fg = colors.gray6}
  },
  visual = {
    a = {bg = colors.orange, fg = colors.bg, gui = "bold"},
    b = {bg = colors.gray4, fg = colors.fg},
    c = {bg = colors.dark_black, fg = colors.fg},
    x = {bg = colors.dark_black, fg = colors.gray6}
  },
  replace = {
    a = {bg = colors.red, fg = colors.bg, gui = "bold"},
    b = {bg = colors.gray4, fg = colors.fg},
    c = {bg = colors.dark_black, fg = colors.fg},
    x = {bg = colors.dark_black, fg = colors.gray6}
  },
  command = {
    a = {bg = colors.purple, fg = colors.bg, gui = "bold"},
    b = {bg = colors.gray4, fg = colors.fg},
    c = {bg = colors.dark_black, fg = colors.fg},
    x = {bg = colors.dark_black, fg = colors.gray6}
  },
  inactive = {
    a = {bg = colors.dark_black, fg = colors.gray7, gui = "bold"},
    b = {bg = colors.dark_black, fg = colors.gray7},
    c = {bg = colors.dark_black, fg = colors.gray7},
    x = {bg = colors.dark_black, fg = colors.gray6}
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
      disabled_filetypes = {"NvimTree", "Trouble", "ToggleTerm"}
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
        {
          function()
            local msg = ""
            local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
            local clients = vim.lsp.get_active_clients()

            if next(clients) == nil then
              return msg
            end

            for _, client in ipairs(clients) do
              local filetypes = client.config.filetypes

              if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                return "  " .. client.name
              end
            end
          end
        }
      },
      lualine_y = {"filetype"},
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

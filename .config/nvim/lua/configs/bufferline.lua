local colors = require("colors.base16")
local v = require("vimp")

v.nnoremap("[b", ":BufferLineCyclePrev<CR>")
v.nnoremap("]b", ":BufferLineCycleNext<CR>")
v.nnoremap("<leader>bd", ":Bdelete<CR>")
v.nnoremap("<leader>bD", ":Bdelete!<CR>")
v.nnoremap("<leader>bp", ":BufferLinePick<CR>")
v.nnoremap("<C-Left>", ":BufferLineMovePrev<CR>")
v.nnoremap("<C-Right>", ":BufferLineMoveNext<CR>")

require("bufferline").setup(
  {
    options = {
      offsets = {{filetype = "NvimTree", text = "", padding = 1}},
      buffer_close_icon = "",
      modified_icon = "",
      left_trunc_marker = "",
      right_trunc_marker = "",
      indicator_icon = "▎",
      close_command = ":Bdelete",
      show_close_icon = false,
      max_name_length = 14,
      max_prefix_length = 13,
      tab_size = 20,
      show_tab_indicators = true,
      enforce_regular_tabs = false,
      view = "multiwindow",
      show_buffer_close_icons = true,
      separator_style = {"", ""},
      always_show_bufferline = true,
      diagnostics = false,
      custom_filter = function(buf_number)
        -- Func to filter out our managed/persistent split terms
        local present_type, type =
          pcall(
          function()
            return vim.api.nvim_buf_get_var(buf_number, "term_type")
          end
        )

        if present_type then
          if type == "vert" then
            return false
          elseif type == "hori" then
            return false
          else
            return true
          end
        else
          return true
        end
      end
    },
    highlights = {
      -- background
      background = {
        guifg = colors.gray7,
        guibg = colors.black,
      },
      -- fill
      fill = {
        guifg = colors.black,
        guibg = colors.black
      },
      -- indicator
      indicator_selected = {
        guifg = colors.blue,
        guibg = colors.bg
      },
      -- buffers
      buffer_selected = {
        guifg = colors.fg,
        guibg = colors.bg,
        gui = "none"
      },
      buffer_visible = {
        guifg = colors.gray7,
        guibg = colors.gray3
      },
      -- modified
      modified = {
        guifg = colors.red,
        guibg = colors.black
      },
      modified_visible = {
        guifg = colors.red,
        guibg = colors.black
      },
      modified_selected = {
        guifg = colors.red,
        guibg = colors.bg
      },
      -- duplicate
      duplicate = {
        guifg = colors.gray7,
        guibg = colors.black,
      },
      duplicate_visible = {
        guifg = colors.gray7,
        guibg = colors.gray3,
      },
      duplicate_selected = {
        guifg = colors.fg,
        guibg = colors.bg,
      },
      -- close buttons
      close_button = {
        guifg = colors.gray7,
        guibg = colors.black,
      },
      close_button_visible = {
        guifg = colors.gray7,
        guibg = colors.gray3
      },
      close_button_selected = {
        guifg = colors.fg,
        guibg = colors.bg
      },
      -- separators
      separator = {
        guifg = colors.black,
        guibg = colors.black,
      },
      separator_visible = {
        guifg = colors.black,
        guibg = colors.black,
      },
      separator_selected = {
        guifg = colors.black,
        guibg = colors.black,
      }
    }
  }
)

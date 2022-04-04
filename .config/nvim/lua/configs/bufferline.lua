local colors = require("colors.base16")
local v = require("vimp")

v.nnoremap("[b", ":BufferLineCyclePrev<CR>")
v.nnoremap("]b", ":BufferLineCycleNext<CR>")
v.nnoremap("<leader>bd", ":Bdelete<CR>")
v.nnoremap("<leader>bD", ":Bdelete!<CR>")
v.nnoremap("<leader>bs", ":BufferLineSortByDirectory<CR>")
v.nnoremap("<C-Left>", ":BufferLineMovePrev<CR>")
v.nnoremap("<C-Right>", ":BufferLineMoveNext<CR>")

v.nnoremap("<leader>pb", ":BufferLinePick<CR>")

require("bufferline").setup(
  {
    options = {
      offsets = {
        {filetype = "NvimTree", text = "", padding = 1},
        {filetype = "CHADTree", text = "", padding = 0}
      },
      buffer_close_icon = "",
      modified_icon = "",
      left_trunc_marker = "",
      right_trunc_marker = "",
      indicator_icon = "▎",
      close_command = ":Bdelete! %d",
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
      sort_by = "none"
    },
    highlights = {
      -- background
      background = {
        guifg = colors.gray7,
        guibg = colors.black
      },
      -- fill
      fill = {
        guifg = colors.black,
        guibg = colors.dark_black
      },
      -- indicator
      indicator_selected = {
        guifg = colors.blue,
        guibg = colors.gray4
      },
      -- buffers
      buffer_selected = {
        guifg = colors.fg,
        guibg = colors.gray4,
        gui = "none"
      },
      buffer_visible = {
        guifg = colors.gray7,
        guibg = colors.gray3
      },
      -- modified
      modified = {
        guifg = colors.gray7,
        guibg = colors.black
      },
      modified_visible = {
        guifg = colors.gray7,
        guibg = colors.gray3
      },
      modified_selected = {
        guifg = colors.fg,
        guibg = colors.gray4
      },
      -- pick
      pick = {
        guifg = colors.yellow,
        guibg = colors.black
      },
      pick_visible = {
        guifg = colors.yellow,
        guibg = colors.gray3
      },
      pick_selected = {
        guifg = colors.yellow,
        guibg = colors.gray4
      },
      -- duplicate
      duplicate = {
        guifg = colors.gray7,
        guibg = colors.black
      },
      duplicate_visible = {
        guifg = colors.gray7,
        guibg = colors.gray3
      },
      duplicate_selected = {
        guifg = colors.fg,
        guibg = colors.gray4
      },
      -- close buttons
      close_button = {
        guifg = colors.gray7,
        guibg = colors.black
      },
      close_button_visible = {
        guifg = colors.gray7,
        guibg = colors.gray3
      },
      close_button_selected = {
        guifg = colors.fg,
        guibg = colors.gray4
      },
      -- separators
      separator = {
        guifg = colors.dark_black,
        guibg = colors.black
      },
      separator_visible = {
        guifg = colors.black,
        guibg = colors.black
      },
      separator_selected = {
        guifg = colors.black,
        guibg = colors.black
      },
      -- tab
      tab = {
        guifg = colors.gray5,
        guibg = colors.dark_black
      },
      tab_selected = {
        guifg = colors.blue,
        guibg = colors.dark_black
      }
    }
  }
)

require("scrollbar").setup(
  {
    set_highlights = false,
    excluded_buftypes = {
      "terminal"
    },
    excluded_filetypes = {
      "prompt",
      "TelescopePrompt",
      "NvimTree",
      "Floaterm"
    }
  }
)

require("scrollbar.handlers.search").setup()

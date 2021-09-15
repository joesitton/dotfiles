local status_ok, actions = pcall(require, "telescope.actions")

if not status_ok then
  return
end

require("telescope").setup(
  {
    defaults = {
      prompt_prefix = "❯ ",
      selection_caret = "❯ ",
      scroll_strategy = "cycle",
      mappings = {
        i = {
          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
          ["<CR>"] = actions.select_default + actions.center,
          ["<esc>"] = actions.close
        },
        n = {
          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous
        }
      }
    }
  }
)

local v = require("vimp")

v.nnoremap("<leader>ff", ":Telescope fd<CR>")
v.nnoremap("<leader>ft", ":Telescope live_grep<CR>")
v.nnoremap("<leader>or", ":Telescope oldfiles<CR>")
v.nnoremap("<leader>ca", ":Telescope lsp_code_actions<CR>")

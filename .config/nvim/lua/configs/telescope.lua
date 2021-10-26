local status_ok, actions = pcall(require, "telescope.actions")

if not status_ok then
  return
end

local telescope = require("telescope")

telescope.setup(
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

require("neoclip").setup(
  {
    keys = {
      i = {
        paste = "<CR>",
        paste_behind = "<C-P>"
      }
    }
  }
)

telescope.load_extension("neoclip")

local v = require("vimp")

v.nnoremap("<leader>ff", ":Telescope fd<CR>")
v.nnoremap("<leader>ft", ":Telescope live_grep<CR>")
v.nnoremap("<leader>fr", ":Telescope oldfiles<CR>")
v.nnoremap("<leader>fy", ":Telescope neoclip<CR>")
v.nnoremap("<leader>fm", ":Telescope marks<CR>")

v.nnoremap("<leader>ca", ":Telescope lsp_code_actions<CR>")
v.xnoremap("<leader>ca", ":Telescope lsp_range_code_actions<CR>")

v.nnoremap("<leader>gd", ":Telescope lsp_definitions<CR>")
v.nnoremap("<leader>gr", ":Telescope lsp_references<CR>")

v.nnoremap("<leader>lbd", ":Telescope lsp_document_diagnostics<CR>")
v.nnoremap("<leader>lwd", ":Telescope lsp_workspace_diagnostics<CR>")

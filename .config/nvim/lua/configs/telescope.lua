local status_ok, actions = pcall(require, "telescope.actions")

if not status_ok then
  return
end

local telescope = require("telescope")

telescope.setup(
  {
    defaults = {
      prompt_prefix = "❯ ",
      selection_caret = "  ",
      scroll_strategy = "limit",
      sort_strategy = "descending",
      layout_strategy = "bottom_pane",
      layout_config = {
        bottom_pane = {
          anchor = "SW",
          height = 0.52,
          width = 1,
          prompt_position = "bottom"
        }
      },
      border = true,
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
    },
    extensions = {
      frecency = {
        default_workspace = ":CWD:"
      },
      fzy_native = {
        override_generic_sorter = true,
        override_file_sorter = true
      }
    }
  }
)

local v = require("vimp")

v.nnoremap("<leader>ff", ":Telescope fd<CR>")
v.nnoremap("<leader>ft", ":Telescope live_grep<CR>")
v.nnoremap("<leader>fr", ":Telescope frecency<CR>")
v.nnoremap("<leader>fm", ":Telescope harpoon marks<CR>")
v.nnoremap("<leader>fg", ":Telescope git_status<CR>")
v.nnoremap("<leader>fd", ":Telescope diagnostics<CR>")
v.nnoremap("<leader>fs", ":Telescope lsp_document_symbols<CR>")

v.nnoremap({"silent"}, "gd", ":Telescope lsp_definitions<CR>")
v.nnoremap({"silent"}, "gr", ":Telescope lsp_references<CR>")

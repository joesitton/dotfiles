local g = vim.g

g.nvim_tree_indent_markers = 1
g.nvim_tree_add_trailing = 1
g.nvim_tree_highlight_opened_files = 0
g.nvim_tree_git_hl = 0
g.nvim_tree_icons = {
  default = "",
  symlink = "",
  git = {
    unstaged = "!",
    staged = "+",
    unmerged = "",
    renamed = "»",
    untracked = "?",
    deleted = "-",
    ignored = "◌"
  },
  folder = {
    arrow_open = "",
    arrow_closed = "",
    default = "",
    open = "",
    empty = "",
    empty_open = "",
    symlink = "",
    symlink_open = ""
  }
}

require("nvim-tree").setup(
  {
    auto_reload_on_write = true,
    hijack_cursor = false,
    update_cwd = true,
    diagnostics = {
      enable = true,
      show_on_dirs = true,
      icons = {
        hint = " ",
        info = " ",
        warning = " ",
        error = " "
      }
    },
    update_focused_file = {
      enable = true,
      update_cwd = true,
      ignore_list = {"help", "nofile"}
    },
    view = {
      width = 30,
      auto_resize = true,
      mappings = {
        list = {
          {key = "v", action = "vsplit"},
          {key = "s", action = "split"},
          {key = "r", action = "full_rename"}
        }
      }
    },
    git = {
      enable = true,
      ignore = true
    },
    filters = {
      dotfiles = false,
      custom = {"node_modules", "__pycache__", ".git", ".cache", ".env", ".venv", "env", "venv"}
    }
  }
)

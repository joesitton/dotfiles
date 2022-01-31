local g = vim.g

g.nvim_tree_indent_markers = 1
g.nvim_tree_add_trailing = 1
g.nvim_tree_git_hl = 1

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
    hijack_cursor = true,
    update_cwd = true,
    diagnostics = {
      enable = true
    },
    view = {
      width = 30,
      auto_resize = true
    },
    git = {
      enable = true,
      ignore = true
    },
    filters = {
      dotfiles = false,
      custom = {".git", ".cache", "node_modules", "__pycache__", ".env", "venv"}
    }
  }
)

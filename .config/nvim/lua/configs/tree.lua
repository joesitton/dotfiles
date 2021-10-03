local g = vim.g

g.nvim_tree_ignore = {".git", ".cache", "node_modules", "__pycache__"}
g.nvim_tree_gitignore = 1
g.nvim_tree_indent_markers = 1
g.nvim_tree_git_hl = 1
g.nvim_tree_add_trailing = 1
g.nvim_tree_width = 25

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
    empty = "",
    empty_open = "",
    symlink = "",
    symlink_open = ""
  }
  -- lsp= {
  --   hint= "•",
  --   info= "•",
  --   warning= "•",
  --   error= "•",
  -- }
}

require("nvim-tree").setup(
  {
    hijack_cursor = true,
    update_cwd = true,
    view = {
      width = 25,
      auto_resize = true
    }
  }
)

require("neogit").setup(
  {
    -- disable_hint = true,
    disable_context_highlighting = true,
    -- disable_builtin_notifications = true,
    signs = {
      section = {"", ""},
      item = {"", ""},
      hunk = {"", ""}
    },
    integrations = {
      diffview = true
    },
    sections = {
      untracked = {
        folded = true
      },
      unstaged = {
        folded = true
      },
      staged = {
        folded = true
      },
      stashes = {
        folded = true
      },
      unpulled = {
        folded = true
      },
      unmerged = {
        folded = true
      },
      recent = {
        folded = true
      }
    }
  }
)

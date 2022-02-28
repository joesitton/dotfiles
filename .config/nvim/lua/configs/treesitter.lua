vim.g.matchup_matchparen_offscreen = {
  ["method"] = "popup",
  ["highlight"] = "OffscreenPopup",
  ["fullwidth"] = 1
}

require("nvim-treesitter.configs").setup(
  {
    ensure_installed = "maintained",
    ignore_install = {"yaml", "latex"},
    highlight = {
      enable = true
    },
    -- indent = {
    --   enable = true
    -- },
    matchup = {
      enable = true
    },
    autopairs = {
      enable = true
    },
    rainbow = {
      enable = true
    }
  }
)

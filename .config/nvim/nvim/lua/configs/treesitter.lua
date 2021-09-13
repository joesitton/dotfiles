require("nvim-treesitter.configs").setup(
  {
    ensure_installed = "maintained",
    ignore_install = {"yaml"},
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

vim.g.matchup_matchparen_offscreen = {
  ["method"] = "popup",
  ["highlight"] = "OffscreenPopup",
  ["fullwidth"] = 1
}

require("nvim-treesitter.configs").setup(
  {
    ensure_installed = {
      "bash",
      "c",
      "cmake",
      "comment",
      "cpp",
      "css",
      "dockerfile",
      "devicetree",
      "go",
      "godot_resource",
      "gomod",
      "gowork",
      "help",
      "html",
      "http",
      "javascript",
      "json",
      "json5",
      "jsonc",
      "latex",
      "lua",
      "make",
      "markdown",
      "ninja",
      "perl",
      "python",
      "query",
      "regex",
      "scss",
      "todotxt",
      "toml",
      "typescript",
      "vim",
      "yaml"
    },
    ignore_install = {"yaml", "latex", "toml"},
    highlight = {
      enable = true
    },
    context_commentstring = {
      enable = true,
      enable_autocmd = false
    },
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

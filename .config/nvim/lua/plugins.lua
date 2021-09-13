local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path})
end

local disabled_built_ins = {
  "2html_plugin",
  "getscript",
  "getscriptPlugin",
  "gzip",
  "logipat",
  "netrw",
  "netrwPlugin",
  "netrwSettings",
  "netrwFileHandlers",
  "matchit",
  "tar",
  "tarPlugin",
  "rrhelper",
  "spellfile_plugin",
  "vimball",
  "vimballPlugin",
  "zip",
  "zipPlugin"
}

for _, plugin in pairs(disabled_built_ins) do
  vim.g["loaded_" .. plugin] = 1
end

vim.cmd "packadd packer.nvim"

require("packer").startup(
  {
    function(use)
      use {
        "wbthomason/packer.nvim"
      }

      use {
        "nvim-lua/plenary.nvim"
      }

      use {
        "nvim-lua/popup.nvim"
      }

      use {
        "svermeulen/vimpeccable"
      }

      use {
        "euclidianAce/BetterLua.vim"
      }

      use {
        "RRethy/nvim-base16"
      }

      use {
        "tpope/vim-surround"
      }

      use {
        "ggandor/lightspeed.nvim"
      }

      use {
        "sheerun/vim-polyglot"
      }

      use {
        "jghauser/mkdir.nvim"
      }

      use {
        "famiu/bufdelete.nvim"
      }

      use {
        "dstein64/vim-startuptime",
        cmd = "StartupTime"
      }

      use {
        "wfxr/minimap.vim",
        cmd = "MinimapToggle",
        config = [[require("configs.minimap")]]
      }

      use {
        "jdhao/better-escape.vim",
        event = "InsertEnter"
      }

      use {
        "karb94/neoscroll.nvim",
        config = [[require("neoscroll").setup()]]
      }

      use {
        "lewis6991/gitsigns.nvim",
        event = "BufRead",
        config = [[require("configs.gitsigns")]]
      }

      use {
        "lukas-reineke/indent-blankline.nvim",
        config = [[require("configs.indentline")]]
      }

      use {
        "romgrk/barbar.nvim",
        config = [[require("configs.barbar")]]
      }

      use {
        "shadmansaleh/lualine.nvim",
        requires = {
          "SmiteshP/nvim-gps"
        },
        config = [[require("configs.lualine")]]
      }

      use {
        "RRethy/vim-hexokinase",
        run = "make hexokinase",
        config = [[require("configs.hexokinase")]]
      }

      use {
        "voldikss/vim-floaterm",
        config = [[require("configs.floaterm")]]
      }

      use {
        "b3nj5m1n/kommentary",
        event = "BufRead",
        config = [[require("configs.kommentary")]]
      }

      use {
        "haya14busa/incsearch.vim",
        config = [[require("configs.incsearch")]]
      }

      use {
        "mhartington/formatter.nvim",
        config = [[require("configs.formatter")]]
      }

      use {
        "kyazdani42/nvim-tree.lua",
        requires = "kyazdani42/nvim-web-devicons",
        config = [[require("configs.tree")]]
      }

      use {
        "nvim-telescope/telescope.nvim",
        requires = {
          "nvim-lua/plenary.nvim",
          "kyazdani42/nvim-web-devicons"
        },
        config = [[require("configs.telescope")]]
      }

      use {
        "neovim/nvim-lspconfig",
        event = "VimEnter",
        requires = {
          "kabouzeid/nvim-lspinstall",
          "ms-jpq/coq_nvim",
          "ray-x/lsp_signature.nvim"
        },
        config = [[require("configs.lsp")]]
      }

      use {
        "windwp/nvim-autopairs",
        config = [[require("configs.autopairs")]]
      }

      use {
        "ms-jpq/coq_nvim",
        branch = "coq",
        run = ":COQdeps",
        requires = {
          {
            "ms-jpq/coq.artifacts",
            branch = "artifacts"
          }
        },
        setup = [[require("configs.coq")]]
      }

      use {
        "nvim-treesitter/nvim-treesitter",
        requires = {
          "andymass/vim-matchup",
          "p00f/nvim-ts-rainbow",
          "windwp/nvim-autopairs"
        },
        run = {":TSUpdate"},
        config = [[require("configs.treesitter")]]
      }
    end,
    config = {
      compile_path = fn.stdpath("data") .. "/site/plugin/compiled_packer.lua",
      display = {
        open_fn = function()
          return require("packer.util").float({border = "single"})
        end
      }
    }
  }
)

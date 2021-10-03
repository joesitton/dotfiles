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
        "wbthomason/packer.nvim",
        opt = true
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

      -- use {
      --   "abecodes/tabout.nvim",
      --   config = [[require('tabout').setup()]]
      -- }

      -- use {
      --   "edluffy/specs.nvim",
      --   config = [[require("specs").setup({
      --     fader = require('specs').exp_fader,
      --   })]]
      -- }

      -- use {
      --   "Pocco81/AutoSave.nvim",
      --   config = [[require("configs.autosave")]]
      -- }

      use {
        "folke/which-key.nvim",
        config = [[require("configs.whichkey")]]
      }

      use {
        "RRethy/nvim-base16"
      }

      use {
        "euclidianAce/BetterLua.vim",
        ft = "lua"
      }

      use {
        "sindrets/winshift.nvim",
        cmd = "WinShift",
        setup = function()
          vim.api.nvim_set_keymap("n", "<C-W>m", "<Cmd>WinShift<CR>", {})
        end,
        config = [[require("winshift").setup()]]
      }

      use {
        "tpope/vim-surround"
      }

      use {
        "folke/trouble.nvim",
        cmd = "TroubleToggle",
        config = [[ require("trouble").setup() ]]
      }

      use {
        "ggandor/lightspeed.nvim",
        event = "BufReadPost"
      }

      use {
        "sheerun/vim-polyglot",
        event = "BufReadPost"
      }

      use {
        "famiu/bufdelete.nvim",
        cmd = {"Bdelete", "Bwipeout"}
      }

      use {
        "jghauser/mkdir.nvim",
        config = [[require("mkdir")]]
      }

      use {
        "dstein64/vim-startuptime",
        cmd = "StartupTime"
      }

      -- use {
      --   "wfxr/minimap.vim",
      --   cmd = "MinimapToggle",
      --   setup = [[require("configs.minimap")]]
      -- }

      use {
        "norcalli/nvim-colorizer.lua",
        event = "BufReadPost",
        config = [[require("colorizer").setup()]]
      }

      use {
        "folke/zen-mode.nvim",
        cmd = "ZenMode",
        setup = vim.api.nvim_set_keymap("n", "<F2>", ":ZenMode<CR>", {}),
        config = [[require("configs.zenmode")]]
      }

      use {
        "jdhao/better-escape.vim",
        event = "InsertEnter"
      }

      use {
        "karb94/neoscroll.nvim",
        config = [[require("neoscroll").setup()]],
        keys = {"<C-d>", "<C-u>"}
      }

      use {
        "lewis6991/gitsigns.nvim",
        event = "BufReadPost",
        config = [[require("configs.gitsigns")]]
      }

      -- use {
      --   "tanvirtin/vgit.nvim",
      --   event = "ButfWinEnter",
      --   requires = {
      --     "nvim-lua/plenary.nvim"
      --   },
      --   config = [[ require("configs.vgit") ]]
      -- }

      use {
        "https://gitlab.com/yorickpeterse/nvim-window",
        setup = vim.api.nvim_set_keymap("n", "<leader>pw", ":lua require('nvim-window').pick()<CR>", {}),
        config = [[require("nvim-window").setup({normal_hl = "WindowPicker", hint_hl = "Search", border = "none"})]]
      }

      -- use {
      --   "dhruvasagar/vim-prosession",
      --   requires = "tpope/vim-obsession",
      --   config = [[vim.g.prosession_dir = vim.fn.stdpath("data") .. "/sessions/"]]
      -- }

      -- use {
      --   "rmagatti/auto-session",
      --   config = [[require("auto-session").setup()]]
      -- }

      use {
        "lukas-reineke/indent-blankline.nvim",
        event = "BufReadPost",
        config = [[require("configs.indentline")]]
      }

      use {
        "akinsho/bufferline.nvim",
        event = "VimEnter",
        config = [[require("configs.bufferline")]]
      }

      use {
        "shadmansaleh/lualine.nvim",
        requires = {
          "SmiteshP/nvim-gps"
        },
        event = "VimEnter",
        config = [[require("configs.lualine")]]
      }

      use {
        "voldikss/vim-floaterm",
        cmd = "FloatermToggle",
        setup = [[require("configs.floaterm")]]
      }

      use {
        "b3nj5m1n/kommentary",
        event = "BufReadPost",
        config = [[require("configs.kommentary")]]
      }

      use {
        "haya14busa/incsearch.vim",
        event = "BufReadPost",
        config = [[require("configs.incsearch")]]
      }

      use {
        "mhartington/formatter.nvim",
        cmd = {"Format", "FormatWrite"},
        config = [[require("configs.formatter")]]
      }

      use {
        "kyazdani42/nvim-tree.lua",
        requires = "kyazdani42/nvim-web-devicons",
        cmd = "NvimTreeToggle",
        setup = vim.api.nvim_set_keymap("n", "<leader>.", ":NvimTreeToggle<CR>", {}),
        config = [[require("configs.tree")]]
      }

      use {
        "nvim-telescope/telescope.nvim",
        requires = {
          "nvim-lua/plenary.nvim",
          "kyazdani42/nvim-web-devicons",
          "AckslD/nvim-neoclip.lua"
        },
        config = [[require("configs.telescope")]]
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
        "neovim/nvim-lspconfig",
        requires = {
          "kabouzeid/nvim-lspinstall",
          "ms-jpq/coq_nvim"
          -- "ray-x/lsp_signature.nvim"
        },
        event = "BufReadPost",
        config = [[require("configs.lsp")]]
      }

      use {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = [[require("configs.autopairs")]]
      }

      use {
        "nvim-treesitter/nvim-treesitter",
        requires = {
          "windwp/nvim-autopairs",
          {
            "p00f/nvim-ts-rainbow",
            event = "BufReadPre"
          },
          {
            "andymass/vim-matchup",
            event = "BufReadPost",
            config = [[
              vim.g.matchup_matchparen_offscreen = {
                ["method"] = "popup",
                ["highlight"] = "OffscreenPopup",
                ["fullwidth"] = 1
              }
            ]]
          }
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

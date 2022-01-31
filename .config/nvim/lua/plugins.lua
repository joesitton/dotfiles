local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path})
end

local disabled_built_ins = {
  "2html_plugin",
  "getscript",
  "getscriptPlugin",
  -- "gzip",
  "logipat",
  "netrw",
  "netrwPlugin",
  "netrwSettings",
  "netrwFileHandlers",
  "matchit",
  -- "tar",
  -- "tarPlugin",
  "rrhelper",
  "spellfile_plugin",
  "vimball",
  "vimballPlugin"
  -- "zip",
  -- "zipPlugin"
}

for _, plugin in pairs(disabled_built_ins) do
  vim.g["loaded_" .. plugin] = 1
end

vim.cmd "packadd packer.nvim"

require("packer").startup(
  {
    function(use)
      -- Core

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
        "tami5/sqlite.lua"
      }

      -- Colorschemes

      use {
        "RRethy/nvim-base16"
      }

      -- Filetypes

      use {
        "lervag/vimtex",
        ft = "tex"
      }

      use {
        "zeek/vim-zeek",
        ft = "zeek"
      }

      use {
        "s3rvac/vim-syntax-yara",
        ft = "yara",
        config = [[autocmd BufNewFile,BufRead *.yar,*.yara setlocal filetype=yara]]
      }

      use {
        "euclidianAce/BetterLua.vim",
        ft = "lua"
      }

      use {
        "fatih/vim-go",
        ft = "go"
      }

      use {
        "ellisonleao/glow.nvim",
        ft = "markdown",
        config = [[
          vim.g.glow_border = "rounded"
        ]]
      }

      use {
        "sheerun/vim-polyglot",
        event = "BufReadPost"
      }

      -- Functionality

      use {
        "tpope/vim-surround"
      }

      use {
        "famiu/bufdelete.nvim"
      }

      use {
        "jghauser/mkdir.nvim",
        config = [[require("mkdir")]]
      }

      use {
        "mhartington/formatter.nvim",
        cmd = {"Format", "FormatWrite"},
        config = [[require("configs.formatter")]]
      }

      use {
        "folke/lsp-colors.nvim"
      }

      use {
        "folke/trouble.nvim",
        config = [[require("configs.trouble")]]
      }

      use {
        "nvim-telescope/telescope.nvim",
        requires = {
          {
            "nvim-telescope/telescope-fzy-native.nvim",
            config = [[require("telescope").load_extension("fzy_native")]]
          },
          {
            "nvim-telescope/telescope-frecency.nvim",
            config = [[require("telescope").load_extension("frecency")]]
          }
        },
        config = [[require("configs.telescope")]]
      }

      use {
        "windwp/nvim-autopairs",
        config = [[require("nvim-autopairs").setup()]]
      }

      use {
        "rmagatti/auto-session",
        config = [[require("configs.session")]]
      }

      use {
        "phaazon/hop.nvim",
        event = "BufReadPost",
        config = [[require("configs.hop")]]
      }

      use {
        "jdhao/better-escape.vim",
        event = "InsertEnter"
      }

      use {
        "b3nj5m1n/kommentary",
        event = "BufReadPost",
        config = [[require("configs.kommentary")]]
      }

      use {
        "kyazdani42/nvim-tree.lua",
        setup = vim.api.nvim_set_keymap("n", "<leader>.", ":NvimTreeToggle<CR>", {}),
        config = [[require("configs.tree")]]
      }

      use {
        "https://gitlab.com/yorickpeterse/nvim-window",
        setup = vim.api.nvim_set_keymap("n", "<leader>pw", ":lua require('nvim-window').pick()<CR>", {}),
        config = [[require("nvim-window").setup({normal_hl = "WindowPicker", hint_hl = "Search", border = "none"})]]
      }

      -- Appearance

      use {
        "kyazdani42/nvim-web-devicons"
      }

      use {
        "chentau/marks.nvim",
        config = [[require("configs.marks")]]
      }

      use {
        "norcalli/nvim-colorizer.lua",
        event = "BufReadPost",
        config = [[require("colorizer").setup()]]
      }

      use {
        "lukas-reineke/indent-blankline.nvim",
        event = "BufReadPost",
        config = [[require("configs.indentline")]]
      }

      use {
        "lewis6991/gitsigns.nvim",
        event = "BufReadPost",
        config = [[require("configs.gitsigns")]]
      }

      use {
        "akinsho/bufferline.nvim",
        event = "VimEnter",
        config = [[require("configs.bufferline")]]
      }

      use {
        "nvim-lualine/lualine.nvim",
        event = "VimEnter",
        config = [[require("configs.lualine")]]
      }

      use {
        "karb94/neoscroll.nvim",
        config = [[require("neoscroll").setup()]],
        keys = {"<C-d>", "<C-u>"}
      }

      use {
        "haya14busa/incsearch.vim",
        event = "BufReadPost",
        config = [[require("configs.incsearch")]]
      }

      -- Commands

      use {
        "dstein64/vim-startuptime",
        cmd = "StartupTime"
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
        "folke/zen-mode.nvim",
        cmd = "ZenMode",
        setup = vim.api.nvim_set_keymap("n", "<F2>", ":ZenMode<CR>", {}),
        config = [[require("configs.zenmode")]]
      }

      use {
        "voldikss/vim-floaterm",
        cmd = "FloatermToggle",
        setup = [[require("configs.floaterm")]]
      }

      -- Completion

      use {
        "hrsh7th/nvim-cmp",
        requires = {
          "hrsh7th/cmp-nvim-lsp",
          "hrsh7th/cmp-calc",
          "hrsh7th/cmp-emoji",
          "hrsh7th/cmp-path",
          "hrsh7th/cmp-cmdline",
          "hrsh7th/cmp-buffer",
          "hrsh7th/cmp-nvim-lsp-signature-help",
          -- "lukas-reineke/cmp-rg",
          "lukas-reineke/cmp-under-comparator",
          "ray-x/cmp-treesitter",
          "onsails/lspkind-nvim",
          {
            "abecodes/tabout.nvim",
            config = [[require("tabout").setup()]]
          },
          {
            "kdheepak/cmp-latex-symbols",
            ft = "tex"
          },
          {
            "L3MON4D3/LuaSnip",
            requires = {
              "saadparwaiz1/cmp_luasnip",
              "rafamadriz/friendly-snippets"
            },
            config = [[require("luasnip/loaders/from_vscode").lazy_load()]]
          }
        },
        config = [[require("configs.cmp")]]
      }

      -- LSP

      use {
        "williamboman/nvim-lsp-installer"
      }

      use {
        "neovim/nvim-lspconfig",
        config = [[require("configs.lsp")]]
      }

      -- Treesitter

      use {
        "nvim-treesitter/nvim-treesitter",
        requires = {
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

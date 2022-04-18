local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path})
end

vim.cmd "packadd packer.nvim"

require("packer").startup(
  {
    function(use)
      -- {{{ Core

      use {
        "wbthomason/packer.nvim"
      }

      use {
        "lewis6991/impatient.nvim",
        config = [[require("impatient")]]
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

      use {
        "antoinemadec/FixCursorHold.nvim"
      }

      -- }}}

      -- {{{ Colorschemes

      use {
        "RRethy/nvim-base16"
      }

      use {
        "folke/lsp-colors.nvim",
        event = "BufRead"
      }

      -- }}}

      -- {{{ Filetype Specific

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
        config = vim.cmd [[autocmd BufNewFile,BufRead *.yar,*.yara setlocal filetype=yara]],
        ft = "yara"
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
        config = [[vim.g.glow_border = "rounded"]],
        ft = "markdown"
      }

      use {
        "iamcco/markdown-preview.nvim",
        run = "cd app && npm install",
        ft = "markdown",
        config = [[vim.g.mkdp_auto_start = 1]]
      }

      use {
        "sheerun/vim-polyglot",
        event = "VimEnter"
      }

      -- }}}

      -- {{{ Functionality

      use {
        "tpope/vim-surround",
        keys = {"c", "d", "y"}
      }

      use {
        "tpope/vim-repeat"
      }

      use {
        "tpope/vim-fugitive",
        cmd = {
          "G",
          "Git",
          "Gdiffsplit",
          "Gread",
          "Gwrite",
          "Ggrep",
          "GMove",
          "GDelete",
          "GBrowse",
          "GRemove",
          "GRename",
          "Glgrep",
          "Gedit"
        },
        ft = "fugitive"
      }

      -- use {
      --   "goolord/alpha-nvim",
      --   config = [[require("configs.alpha")]]
      -- }

      use {
        "ethanholz/nvim-lastplace",
        config = [[require("configs.lastplace")]],
        event = "BufRead"
      }

      use {
        "famiu/bufdelete.nvim",
        cmd = {"Bdelete", "Bwipeout"}
      }

      use {
        "jghauser/mkdir.nvim",
        config = [[require("mkdir")]],
        event = "BufWritePre"
      }

      use {
        "sbdchd/neoformat",
        config = [[require("configs.formatter")]],
        cmd = "Neoformat"
      }

      use {
        "folke/which-key.nvim",
        config = [[require("configs.whichkey")]]
      }

      use {
        "ahmedkhalf/project.nvim",
        config = [[require("project_nvim").setup({exclude_dirs = {"~/.local/*"}})]]
      }

      use {
        "nvim-telescope/telescope.nvim",
        requires = {
          {"nvim-telescope/telescope-fzf-native.nvim", run = "make"},
          "nvim-telescope/telescope-frecency.nvim",
          "nvim-telescope/telescope-file-browser.nvim"
        },
        config = [[require("configs.telescope")]]
      }

      use {
        "rmagatti/auto-session",
        config = [[require("configs.session")]]
      }

      use {
        "phaazon/hop.nvim",
        config = [[require("configs.hop")]],
        event = "BufReadPost"
      }

      use {
        "max397574/better-escape.nvim",
        config = [[require("better_escape").setup()]],
        event = "InsertEnter"
      }

      use {
        "b3nj5m1n/kommentary",
        config = [[require("configs.comments")]],
        keys = "<C-_>"
      }

      use {
        "nvim-neo-tree/neo-tree.nvim",
        requires = {
          "MunifTanjim/nui.nvim"
        },
        config = [[require("configs.tree")]]
      }

      use {
        "https://gitlab.com/yorickpeterse/nvim-window",
        setup = vim.api.nvim_set_keymap("n", "<leader>pw", ":lua require('nvim-window').pick()<CR>", {}),
        config = [[require("nvim-window").setup({normal_hl = "NvimTreeWindowPicker", border = "none"})]]
      }

      use {
        "sindrets/diffview.nvim",
        config = [[require("configs.diffview")]],
        cmd = {"DiffviewOpen", "DiffviewFileHistory"}
      }

      -- use {
      --   "godlygeek/tabular",
      --   event = "BufReadPost"
      -- }

      use {
        "michaelb/sniprun",
        cmd = "SnipRun",
        run = "bash ./install.sh"
      }

      -- use {
      --   "rcarriga/vim-ultest",
      --   requires = {
      --     "vim-test/vim-test"
      --   },
      --   run ={ ":UpdateRemotePlugins"}
      -- }

      -- }}}

      -- {{{ Appearance

      use {
        "kyazdani42/nvim-web-devicons"
      }

      use {
        "romgrk/barbar.nvim",
        config = [[require("configs.bufferline")]],
        event = "VimEnter"
      }

      use {
        "nvim-lualine/lualine.nvim",
        config = [[require("configs.lualine")]],
        event = "VimEnter"
      }

      use {
        "chentau/marks.nvim",
        config = [[require("configs.marks")]],
        event = "BufReadPost"
      }

      -- use {
      --   "Pocco81/AutoSave.nvim",
      --   config = [[require("autosave").setup()]]
      -- }

      use {
        "norcalli/nvim-colorizer.lua",
        config = [[require("configs.colorizer")]]
      }

      use {
        "lukas-reineke/indent-blankline.nvim",
        config = [[require("configs.indentline")]],
        event = "BufReadPost"
      }

      use {
        "lewis6991/gitsigns.nvim",
        config = [[require("configs.gitsigns")]],
        event = "BufReadPost"
      }

      use {
        "karb94/neoscroll.nvim",
        config = [[require("configs.neoscroll")]],
        event = "WinScrolled"
      }

      use {
        "RRethy/vim-illuminate",
        config = [[require("configs.illuminate")]],
        event = "BufReadPost"
      }

      use {
        "beauwilliams/focus.nvim",
        config = [[require("configs.focus")]],
        cmd = "FocusEnable"
      }

      use {
        "luukvbaal/stabilize.nvim",
        config = [[require("stabilize").setup()]],
        event = "BufReadPost"
      }

      use {
        "anuvyklack/pretty-fold.nvim",
        config = [[require("configs.prettyfold")]],
        event = "BufReadPost"
      }

      use {
        "stevearc/dressing.nvim",
        config = [[require("configs.dressing")]],
        event = "VimEnter"
      }

      use {
        "dstein64/vim-startuptime",
        cmd = "StartupTime"
      }

      use {
        "folke/zen-mode.nvim",
        setup = vim.api.nvim_set_keymap("n", "<F2>", ":ZenMode<CR>", {}),
        config = [[require("configs.zenmode")]],
        cmd = "ZenMode"
      }

      use {
        "akinsho/toggleterm.nvim",
        config = [[require("configs.term")]]
      }

      -- }}}

      -- {{{ Completion

      use {
        "hrsh7th/nvim-cmp",
        commit = "1558d110d7967b9276adb7840b759980a1ed0bfd",
        requires = {
          "hrsh7th/cmp-nvim-lsp",
          "hrsh7th/cmp-calc",
          "hrsh7th/cmp-emoji",
          "hrsh7th/cmp-path",
          "hrsh7th/cmp-cmdline",
          "hrsh7th/cmp-buffer",
          "hrsh7th/cmp-nvim-lua",
          "joesitton/cmp-rg",
          "lukas-reineke/cmp-under-comparator",
          "ray-x/cmp-treesitter",
          "onsails/lspkind-nvim",
          {
            "abecodes/tabout.nvim",
            config = [[require("tabout").setup()]],
            after = "nvim-cmp"
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

      -- }}}

      -- {{{ LSP

      use {
        "j-hui/fidget.nvim",
        config = [[require("configs.fidget")]],
        event = "BufReadPost"
      }

      use {
        "williamboman/nvim-lsp-installer"
      }

      use {
        "neovim/nvim-lspconfig",
        config = [[require("configs.lsp")]]
      }

      -- }}}

      -- {{{ Treesitter

      use {
        "nvim-treesitter/nvim-treesitter",
        requires = {
          {
            "p00f/nvim-ts-rainbow",
            event = "BufReadPre"
          },
          {
            "andymass/vim-matchup",
            event = "CursorMoved"
          },
          {
            "windwp/nvim-autopairs",
            config = [[require("nvim-autopairs").setup({check_ts = true})]]
          },
          {
            "JoosepAlviste/nvim-ts-context-commentstring",
            event = "BufReadPre"
          }
        },
        run = ":silent! TSUpdate",
        config = [[require("configs.treesitter")]]
      }

      -- }}}
    end,
    config = {
      compile_path = fn.stdpath("data") .. "/site/plugin/compiled_packer.lua",
      display = {
        open_fn = function()
          return require("packer.util").float({border = "rounded"})
        end
      },
      autoremove = true
    }
  }
)

-- vim: foldmethod=marker

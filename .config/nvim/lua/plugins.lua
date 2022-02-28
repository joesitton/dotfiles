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
      -- {{{ Core

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

      -- }}}

      -- {{{ Colorschemes

      use {
        "RRethy/nvim-base16"
      }

      use {
        "folke/lsp-colors.nvim"
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
        config = [[ vim.g.glow_border = "rounded" ]],
        ft = "markdown"
      }

      use {
        "sheerun/vim-polyglot",
        event = "BufReadPost"
      }

      -- }}}

      -- {{{ Functionality

      use {
        "tpope/vim-surround"
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
        "mhartington/formatter.nvim",
        config = [[require("configs.formatter")]],
        cmd = {"Format", "FormatWrite"}
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
        event = "BufReadPost"
      }

      use {
        "kyazdani42/nvim-tree.lua",
        setup = vim.api.nvim_set_keymap("n", "<leader>.", ":NvimTreeToggle<CR>", {}),
        config = [[require("configs.tree")]]
      }

      use {
        "https://gitlab.com/yorickpeterse/nvim-window",
        setup = vim.api.nvim_set_keymap("n", "<leader>pw", ":lua require('nvim-window').pick()<CR>", {}),
        config = [[require("nvim-window").setup({normal_hl = "NvimTreeWindowPicker", border = "none"})]]
      }

      use {
        "gbprod/cutlass.nvim",
        config = [[require("cutlass").setup({cut_key = "X"})]]
      }

      -- }}}

      -- {{{ Appearance

      use {
        "stevearc/dressing.nvim",
        config = [[require("configs.dressing")]],
        event = "VimEnter"
      }

      use {
        "kyazdani42/nvim-web-devicons"
      }

      use {
        "akinsho/bufferline.nvim",
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

      use {
        "norcalli/nvim-colorizer.lua",
        config = [[require("colorizer").setup()]],
        event = "BufReadPre"
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
        config = [[require("neoscroll").setup()]],
        keys = {"<C-d>", "<C-u>"}
      }

      use {
        "RRethy/vim-illuminate",
        config = [[require("configs.illuminate")]],
        event = "BufReadPost"
      }

      use {
        "beauwilliams/focus.nvim",
        config = [[require("configs.focus")]],
        event = "BufReadPost"
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

      -- use {
      --   "folke/todo-comments.nvim",
      --   config = [[require("todo-comments").setup()]]
      -- }

      -- }}}

      -- {{{ Commands

      use {
        "dstein64/vim-startuptime",
        cmd = "StartupTime"
      }

      -- use {
      --   "sindrets/winshift.nvim",
      --   setup = function()
      --     vim.api.nvim_set_keymap("n", "<C-W>m", "<Cmd>WinShift<CR>", {})
      --   end,
      --   config = [[require("winshift").setup()]],
      --   cmd = "WinShift",
      -- }

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
        "ray-x/lsp_signature.nvim",
        config = [[require("configs.signature")]]
      }

      use {
        "hrsh7th/nvim-cmp",
        requires = {
          "hrsh7th/cmp-nvim-lsp",
          "hrsh7th/cmp-calc",
          "hrsh7th/cmp-emoji",
          "hrsh7th/cmp-path",
          "hrsh7th/cmp-cmdline",
          "hrsh7th/cmp-buffer",
          "hrsh7th/cmp-nvim-lua",
          -- "hrsh7th/cmp-nvim-lsp-signature-help",
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
            event = "BufReadPost"
          },
          {
            "windwp/nvim-autopairs",
            config = [[require("nvim-autopairs").setup()]]
          }
        },
        run = {":TSUpdate"},
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
      }
    }
  }
)

-- vim: foldmethod=marker

local cmp = require("cmp")

vim.g.floating_window_border = {
  {"╭", "FloatBorder"},
  {"─", "FloatBorder"},
  {"╮", "FloatBorder"},
  {"│", "FloatBorder"},
  {"╯", "FloatBorder"},
  {"─", "FloatBorder"},
  {"╰", "FloatBorder"},
  {"│", "FloatBorder"}
}

cmp.setup(
  {
    formatting = {
      format = require("lspkind").cmp_format(
        {
          with_text = true,
          menu = ({
            buffer = "[Buffer]",
            path = "[Path]",
            nvim_lsp = "[LSP]",
            luasnip = "[LuaSnip]",
            nvim_lua = "[Lua]",
            latex_symbols = "[LaTeX]",
            rg = "[rg]",
            calc = "[Calc]",
            treesitter = "[TS]",
            emoji = "[Emoji]"
          })
        }
      )
    },
    documentation = {
      border = vim.g.floating_window_border
    },
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
      end
    },
    mapping = {
      ["<CR>"] = cmp.mapping.confirm({select = true}),
      ["<C-Space>"] = cmp.mapping.complete(),
      ["<Tab>"] = function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        else
          fallback()
        end
      end,
      ["<S-Tab>"] = function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        else
          fallback()
        end
      end
    },
    sources = {
      {name = "nvim_lsp"},
      {name = "path"},
      -- {name = "buffer"},
      {name = "calc"},
      {name = "emoji"},
      {name = "rg"},
      {name = "treesitter"},
      {name = "latex_symbols"}
      -- {name = "nvim_lsp_signature_help"}
    },
    sorting = {
      comparators = {
        cmp.config.compare.offset,
        cmp.config.compare.exact,
        cmp.config.compare.score,
        require("cmp-under-comparator").under,
        cmp.config.compare.kind,
        cmp.config.compare.sort_text,
        cmp.config.compare.length,
        cmp.config.compare.order
      }
    }
  }
)

cmp.setup.cmdline(
  ":",
  {
    sources = cmp.config.sources(
      {
        {name = "path"}
      },
      {
        {name = "cmdline"}
      }
    )
  }
)

-- cmp.setup.cmdline(
--   "/",
--   {
--     sources = cmp.config.sources(
--       {
--         {name = "rg"}
--       },
--       {
--         {name = "nvim_lsp_document_symbol"}
--       }
--     )
--   }
-- )

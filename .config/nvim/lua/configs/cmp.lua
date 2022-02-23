local luasnip = require("luasnip")
local cmp = require("cmp")

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
            nvim_lua = "[Lua]",
            luasnip = "[Snippet]",
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
      winhighlight = "NormalFloat:DocMenu,FloatBorder:DocMenu"
      --   border = {
      --     {"╭", "FloatBorder"},
      --     {"─", "FloatBorder"},
      --     {"╮", "FloatBorder"},
      --     {"│", "FloatBorder"},
      --     {"╯", "FloatBorder"},
      --     {"─", "FloatBorder"},
      --     {"╰", "FloatBorder"},
      --     {"│", "FloatBorder"}
      --   }
    },
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end
    },
    mapping = {
      ["<CR>"] = cmp.mapping.confirm({select = false}),
      ["<C-Space>"] = cmp.mapping.complete(),
      ["<Tab>"] = cmp.mapping(
        function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end,
        {"i", "s"}
      ),
      ["<S-Tab>"] = cmp.mapping(
        function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end,
        {"i", "s"}
      )
    },
    sources = {
      {name = "nvim_lsp"},
      {name = "path"},
      {name = "calc"},
      {name = "emoji"},
      -- {name = "rg"},
      {name = "buffer"},
      {name = "treesitter"},
      {name = "latex_symbols"},
      {name = "nvim_lsp_signature_help"},
      {name = "luasnip"}
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
  "/",
  {
    sources = cmp.config.sources(
      {
        {name = "buffer"}
      }
    )
  }
)

cmp.setup.cmdline(
  "?",
  {
    sources = cmp.config.sources(
      {
        {name = "buffer"}
      }
    )
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

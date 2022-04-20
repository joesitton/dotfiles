local luasnip = require("luasnip")
local cmp = require("cmp")

local cmp_autopairs = require("nvim-autopairs.completion.cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({map_char = {tex = ""}}))

require("cmp_git").setup()

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
            emoji = "[Emoji]",
            conventionalcommits = "[CC]",
            cmdline_history = "[History]"
          })
        }
      )
    },
    window = {
      -- completion = {
      --   border = "rounded",
      --   winhighlight = "FloatBorder:FloatBorder"
      -- },
      documentation = {
        -- border = "rounded",
        winhighlight = "Normal:Pmenu"
      }
    },
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end
    },
    mapping = {
      ["<CR>"] = cmp.mapping.confirm({select = false}),
      ["<C-Space>"] = cmp.mapping(
        function(fallback)
          if cmp.visible() then
            cmp.close()
          elseif not cmp.visible() then
            cmp.complete()
          else
            fallback()
          end
        end,
        {"i"}
      ),
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
      {name = "buffer"},
      {name = "treesitter"},
      {name = "latex_symbols"},
      {name = "luasnip"},
      {name = "nvim_lua"},
      {name = "nvim_lsp_signature_help"},
      {name = "conventionalcommits"},
      {name = "cmp_git"}
    },
    sorting = {
      comparators = {
        cmp.config.compare.offset,
        cmp.config.compare.exact,
        cmp.config.compare.sort_text,
        cmp.config.compare.score,
        require("cmp-under-comparator").under,
        cmp.config.compare.kind,
        cmp.config.compare.length,
        cmp.config.compare.order
      }
    }
  }
)

for _, cmdtype in ipairs({"?", "/"}) do
  cmp.setup.cmdline(
    cmdtype,
    {
      view = {
        entries = {name = "custom", selection_order = "near_cursor"}
      },
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources(
        {
          {
            name = "rg",
            option = {
              additional_arguments = "--smart-case",
              only_current_buffer = true
            }
          }
        }
      )
    }
  )
end

cmp.setup.cmdline(
  ":",
  {
    view = {
      entries = {name = "custom", selection_order = "near_cursor"}
    },
    mapping = cmp.mapping.preset.cmdline(),
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

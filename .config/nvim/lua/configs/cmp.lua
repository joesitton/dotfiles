local cmp = require("cmp")

cmp.setup(
  {
    formatting = {
      fields = {"abbr", "kind", "menu"},
      format = require("lspkind").cmp_format()
    },
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
      end
    },
    mapping = {
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
      {name = "buffer"},
      {name = "calc"},
      {name = "emoji"}
    }
  }
)

require("nvim-autopairs.completion.cmp").setup(
  {
    map_cr = true, --  map <CR> on insert mode
    map_complete = true, -- it will auto insert `(` (map_char) after select function or method item
    auto_select = true, -- automatically select the first item
    insert = true, -- use insert confirm behavior instead of replace
    map_char = {
      -- modifies the function or method delimiter by filetypes
      all = "(",
      tex = "{"
    }
  }
)

local luasnip = require("luasnip")
local cmp = require("cmp")

local cmp_autopairs = require("nvim-autopairs.completion.cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))

require("cmp_git").setup()

local tabnine = require("cmp_tabnine.config")

tabnine:setup({
    max_lines = 1000,
    max_num_results = 20,
    sort = true,
    run_on_every_keystroke = true,
    snippet_placeholder = "..",
    ignored_file_types = {},
    show_prediction_strength = false,
})

local symbol_map = {
    Text = "",
    Method = "",
    Function = "",
    Constructor = "⌘",
    Field = "",
    Variable = "",
    Class = "ﴯ",
    Interface = "",
    Module = "",
    Property = "",
    Unit = "塞",
    Value = "",
    Enum = "",
    Keyword = "廓",
    Snippet = "",
    Color = "",
    File = "",
    Reference = "",
    Folder = "",
    EnumMember = "",
    Constant = "",
    Struct = "פּ",
    Event = "",
    Operator = "",
    TypeParameter = "",
}

-- local menu = {
--   buffer = "[Buffer]",
--   path = "[Path]",
--   nvim_lsp = "[LSP]",
--   nvim_lua = "[Lua]",
--   luasnip = "[Snippet]",
--   latex_symbols = "[LaTeX]",
--   rg = "[rg]",
--   calc = "[Calc]",
--   treesitter = "[TS]",
--   emoji = "[Emoji]",
--   conventionalcommits = "[CC]",
--   cmdline_history = "[History]",
--   git = "[Git]",
--   cmp_tabnine = "[TN]"
-- }

cmp.setup({
    experimental = {
        native_menu = false,
        ghost_text = true,
    },
    formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)
            vim_item.menu = vim_item.kind -- .. " " .. menu[entry.source.name]
            vim_item.kind = symbol_map[vim_item.kind]

            if entry.source.name == "cmp_tabnine" then
                vim_item.kind = ""
            end

            return vim_item
        end,
    },
    window = {
        -- completion = {
        --   border = "rounded",
        --   winhighlight = "FloatBorder:FloatBorder"
        -- },
        documentation = {
            -- border = "rounded",
            winhighlight = "Normal:Pmenu",
        },
    },
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = {
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
        ["<C-Space>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.close()
            elseif not cmp.visible() then
                cmp.complete()
            else
                fallback()
            end
        end, { "i" }),
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
    },
    sources = {
        { name = "nvim_lsp" },
        { name = "path" },
        { name = "calc" },
        { name = "emoji" },
        { name = "buffer" },
        { name = "treesitter" },
        { name = "latex_symbols" },
        { name = "luasnip" },
        { name = "nvim_lua" },
        { name = "nvim_lsp_signature_help" },
        { name = "conventionalcommits" },
        { name = "git" },
        { name = "cmp_tabnine" },
    },
    sorting = {
        priority_weight = 2,
        comparators = {
            require("cmp_tabnine.compare"),
            cmp.config.compare.offset,
            cmp.config.compare.exact,
            cmp.config.compare.sort_text,
            cmp.config.compare.score,
            require("cmp-under-comparator").under,
            cmp.config.compare.kind,
            cmp.config.compare.length,
            cmp.config.compare.order,
        },
    },
})

for _, cmdtype in ipairs({ "?", "/" }) do
    cmp.setup.cmdline(cmdtype, {
        view = { entries = { name = "custom", selection_order = "near_cursor" } },
        formatting = {
            fields = { "abbr" },
        },
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
            {
                name = "lsp_document_symbol_help",
            },
            {
                name = "rg",
                option = {
                    additional_arguments = "--smart-case",
                    only_current_buffer = true,
                },
            },
        }),
    })
end

cmp.setup.cmdline(":", {
    view = {
        entries = {
            name = "custom",
            selection_order = "near_cursor",
        },
    },
    formatting = {
        fields = { "abbr" },
    },
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({ { name = "path" } }, { { name = "cmdline" } }),
})

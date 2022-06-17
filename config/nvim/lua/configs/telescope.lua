local status_ok, actions = pcall(require, "telescope.actions")

if not status_ok then
    return
end

local telescope = require("telescope")

for _, ext in ipairs({ "fzf", "frecency", "projects", "file_browser" }) do
    telescope.load_extension(ext)
end

telescope.setup({
    defaults = {
        prompt_prefix = "❯ ",
        selection_caret = "  ",
        scroll_strategy = "limit",
        sort_strategy = "descending",
        layout_strategy = "bottom_pane",
        layout_config = {
            bottom_pane = {
                anchor = "SW",
                height = 0.52,
                width = 1,
                prompt_position = "bottom",
            },
        },
        border = true,
        mappings = {
            i = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
                ["<CR>"] = actions.select_default + actions.center,
                ["<esc>"] = actions.close,
            },
            n = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
            },
        },
        vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--no-ignore",
            "--smart-case",
            "--hidden",
            "--trim",
        },
        file_ignore_patterns = {
            "node_modules",
            ".git/",
            "dist/",
            "venv",
            "env",
            ".venv",
            ".env",
            "__pycache__",
            ".tox",
        },
        use_less = true,
    },
    pickers = {
        find_files = {
            find_command = {
                "fd",
                "--type=f",
                "--strip-cwd-prefix",
                "--hidden",
            },
        },
    },
    extensions = {
        frecency = { default_workspace = ":CWD:" },
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
        },
    },
})

local v = require("vimp")

v.nnoremap("<leader>ff", ":Telescope find_files<CR>")
v.nnoremap("<leader>ft", ":Telescope live_grep<CR>")
v.nnoremap("<leader>fr", ":Telescope frecency<CR>")
v.nnoremap("<leader>fm", ":Telescope marks<CR>")
v.nnoremap("<leader>fd", ":Telescope diagnostics<CR>")
v.nnoremap("<leader>fs", ":Telescope lsp_document_symbols<CR>")
v.nnoremap("<leader>fb", ":Telescope buffers<CR>")
v.nnoremap("<leader>fp", ":Telescope projects<CR>")

v.nnoremap("<leader>gs", ":Telescope git_status<CR>")
v.nnoremap("<leader>gb", ":Telescope git_branches<CR>")

v.nnoremap({ "silent" }, "gd", ":Telescope lsp_definitions<CR>")
v.nnoremap({ "silent" }, "gr", ":Telescope lsp_references<CR>")

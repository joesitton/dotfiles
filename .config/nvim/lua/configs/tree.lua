require("neo-tree").setup({
    close_if_last_window = true,
    popup_border_style = "rounded",
    enable_git_status = true,
    enable_diagnostics = false,
    default_component_configs = {
        indent = {
            indent_size = 2,
            padding = 1,
            with_markers = true,
            indent_marker = "│",
            last_indent_marker = "└",
            highlight = "TreeIndentMarker",
            with_expanders = nil,
            expander_collapsed = "",
            expander_expanded = "",
            expander_highlight = "TreeExpander",
        },
        icon = {
            folder_closed = "",
            folder_open = "",
            folder_empty = "",
            default = "",
        },
        modified = { symbol = "", highlight = "TreeModified" },
        name = { trailing_slash = true, use_git_status_colors = true },
        git_status = {
            symbols = {
                added = "",
                modified = "",
                deleted = "✖",
                renamed = "",
                untracked = "",
                ignored = "",
                unstaged = "",
                staged = "",
                conflict = "",
            },
        },
    },
    window = {
        position = "left",
        width = 30,
        mappings = {
            ["<space>"] = "toggle_node",
            ["<2-LeftMouse>"] = "open",
            ["<cr>"] = "open",
            ["o"] = "open",
            ["S"] = "open_split",
            ["s"] = "open_vsplit",
            ["t"] = "open_tabnew",
            ["<bs>"] = "close_node",
            ["a"] = "add",
            ["A"] = "add_directory",
            ["d"] = "delete",
            ["r"] = "rename",
            ["y"] = "copy_to_clipboard",
            ["x"] = "cut_to_clipboard",
            ["p"] = "paste_from_clipboard",
            ["c"] = "copy", -- takes text input for destination
            ["m"] = "move", -- takes text input for destination
            ["q"] = "close_window",
            ["R"] = "refresh",
        },
    },
    nesting_rules = {},
    filesystem = {
        filtered_items = {
            visible = true,
            hide_dotfiles = true,
            hide_gitignored = true,
            hide_by_name = {
                ".DS_Store",
                "thumbs.db",
                "node_modules",
                "__pycache__",
                ".git",
                "env",
                "venv",
                ".env",
                ".venv",
            },
            hide_by_pattern = {},
            never_show = {},
        },
        follow_current_file = false,
        hijack_netrw_behavior = "open_default",
        use_libuv_file_watcher = true,
        window = {
            mappings = {
                ["-"] = "navigate_up",
                ["."] = "set_root",
                ["H"] = "toggle_hidden",
                ["/"] = "fuzzy_finder",
                ["f"] = "filter_on_submit",
                ["<c-x>"] = "clear_filter",
            },
        },
    },
    git_status = {
        window = {
            position = "float",
            mappings = {
                ["A"] = "git_add_all",
                ["gu"] = "git_unstage_file",
                ["ga"] = "git_add_file",
                ["gr"] = "git_revert_file",
                ["gc"] = "git_commit",
                ["gp"] = "git_push",
                ["gg"] = "git_commit_and_push",
            },
        },
    },
})

local v = require("vimp")

v.nnoremap("\\", ":NeoTreeRevealToggle<CR>")
v.nnoremap("g\\", ":Neotree reveal toggle git_status<CR>")

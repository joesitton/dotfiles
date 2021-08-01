local status_ok, actions = pcall(require, "telescope.actions")

if not status_ok then
    return
end

require('telescope').setup({
    defaults = {
        prompt_prefix = "❯ ",
        selection_caret = "❯ ",
        scroll_strategy = "cycle",
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
        }
    }
})

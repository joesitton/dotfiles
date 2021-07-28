let g:nvim_tree_ignore = [ '.git', 'node_modules', '.cache', '.venv', '.env' ]
let g:nvim_tree_gitignore = 1
let g:nvim_tree_auto_open = 0
let g:nvim_tree_auto_ignore_ft = [ 'startify', 'dashboard' ]
let g:nvim_tree_follow = 0
let g:nvim_tree_indent_markers = 1
let g:nvim_tree_hide_dotfiles = 1
let g:nvim_tree_git_hl = 0
let g:nvim_tree_highlight_opened_files = 0
let g:nvim_tree_root_folder_modifier = ':~'
let g:nvim_tree_auto_resize = 1
let g:nvim_tree_disable_netrw = 1
let g:nvim_tree_hijack_netrw = 0
let g:nvim_tree_add_trailing = 1
let g:nvim_tree_group_empty = 1
let g:nvim_tree_lsp_diagnostics = 1
let g:nvim_tree_disable_window_picker = 1
let g:nvim_tree_hijack_cursor = 1
let g:nvim_tree_icon_padding = ' '
let g:nvim_tree_update_cwd = 0
let g:nvim_tree_special_files = { 'README.md': 1, 'Makefile': 1, 'MAKEFILE': 1 } " List of filenames that gets highlighted with NvimTreeSpecialFile

let g:nvim_tree_icons = {
    \ 'default': '',
    \ 'symlink': '',
    \ 'git': {
    \   'unstaged': "!",
    \   'staged': "+",
    \   'unmerged': "",
    \   'renamed': "»",
    \   'untracked': "?",
    \   'deleted': "-",
    \   'ignored': "◌"
    \   },
    \ 'folder': {
    \   'arrow_open': "",
    \   'arrow_closed': "",
    \   'default': "",
    \   'open': "",
    \   'empty': "",
    \   'empty_open': "",
    \   'symlink': "",
    \   'symlink_open': "",
    \   },
    \   'lsp': {
    \     'hint': "•",
    \     'info': "•",
    \     'warning': "•",
    \     'error': "•",
    \   }
    \ }

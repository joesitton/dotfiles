let g:indentLine_char = '│'
let g:black_linelength = 79
let g:user_emmet_leader_key='<c-e>'

let g:lightline = {
            \ 'colorscheme': 'base16_default_dark',
            \ 'active': {
            \   'left': [ ['mode', 'paste', 'spell'],
            \             ['gitbranch', 'filename', 'readonly', 'modified', 'cocstatus'] ],
            \ },
            \ 'component_function': {
            \   'gitbranch': 'fugitive#head',
            \   'readonly': 'LightlineReadonly',
            \   'cocstatus': 'coc#status'
            \ },
            \ 'separator': { 'left': '', 'right': '' },
            \ 'subseparator': { 'left': '', 'right': '' },
            \ }
let g:lightline.tabline = {'left': [['buffers']], 'right': []}
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type = {'buffers': 'tabsel'}
let g:lightline#bufferline#show_number = 0
let g:lightline#bufferline#unnamed = '[No Name]'
let g:lightline#bufferline#read_only = '[RO]'

let g:ale_warn_about_trailing_blank_lines = 0
let g:ale_warn_about_trailing_whitespace = 0
let g:ale_fix_on_save = 1
let g:ale_fixers = {
            \   '*': ['remove_trailing_lines', 'trim_whitespace', 'prettier']
            \}
let g:ale_virtualtext_cursor = 1
let g:ale_virtualtext_prefix = "   "
let g:ale_sign_info = "➤ "
let g:ale_sign_warning = "➤ "
let g:ale_sign_error = "➤ "
let g:ale_linters = {
            \   'javascript': ['eslint'],
            \   'typescript': ['tslint', 'tsserver'],
            \   'sh': ['language_server', 'shellcheck'],
            \   'css': ['csslint'],
            \   'scss': ['scss-lint'],
            \   'dockerfile': ['docker-langserver'],
            \   'python': ['autopep8']
            \}

" NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

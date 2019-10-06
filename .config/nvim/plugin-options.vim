let g:deoplete#enable_at_startup = 1
let g:indentLine_char_list = '|'
let g:black_linelength = 79
let g:user_emmet_leader_key='<c-e>'

let g:lightline = {
    \ 'colorscheme': 'base16_tomorrow_night',
    \ 'active': {
    \   'left': [ ['mode', 'paste', 'spell'],
    \             ['gitbranch', 'filename', 'readonly', 'modified'] ]
    \ },
    \ 'component_function': {
    \   'gitbranch': 'fugitive#head',
    \   'readonly': 'LightlineReadonly',
    \   'filetype': 'FiletypeIcon'
    \ },
    \ 'separator': { 'left': '', 'right': '' },
    \ 'subseparator': { 'left': '', 'right': '' },
    \ }
let g:lightline.tabline          = {'left': [['buffers']], 'right': []}
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type   = {'buffers': 'tabsel'}
let g:lightline#bufferline#show_number  = 0
let g:lightline#bufferline#unnamed      = '[No Name]'
let g:lightline#bufferline#read_only    = '[RO]'

let g:fzf_colors =
    \ { 'fg':    ['fg', 'Normal'],
    \ 'bg':      ['bg', 'Normal'],
    \ 'hl':      ['fg', 'Comment'],
    \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
    \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
    \ 'hl+':     ['fg', 'Statement'],
    \ 'info':    ['fg', 'PreProc'],
    \ 'border':  ['fg', 'Ignore'],
    \ 'prompt':  ['fg', 'Conditional'],
    \ 'pointer': ['fg', 'Exception'],
    \ 'marker':  ['fg', 'Keyword'],
    \ 'spinner': ['fg', 'Label'],
    \ 'header':  ['fg', 'Comment'] }

let NERDTreeShowBookmarks=0
let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=0
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1

let g:undotree_SetFocusWhenToggle = 1
let g:undotree_WindowLayout = 4

autocmd! FileType fzf
autocmd FileType fzf set laststatus=0 | autocmd BufLeave <buffer> set laststatus=2

let g:ale_sign_info = "➤ "
let g:ale_sign_warning = "➤ "
let g:ale_sign_error = "➤ "
let g:ale_virtualtext_cursor = 1
let g:ale_virtualtext_prefix = "➤ "
let g:ale_linters = {
    \   'javascript': ['eslint'],
    \   'typescript': ['tslint', 'tsserver'],
    \   'sh': ['shellcheck'],
    \   'scss': ['scsslint'],
    \   'dockerfile': ['docker-langserver'],
    \   'python': ['flake8']
    \}

"let g:ale_fixers = {
    "\   'javascript': ['eslint'],
    "\   'typescript': ['tslint'],
    "\   'python': ['black', 'isort'],
    "\   'css': ['prettier'],
    "\   'scss': ['prettier'],
    "\   'html': ['prettier'],
    "\}

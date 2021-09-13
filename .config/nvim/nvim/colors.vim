function! MyHighlights() abort
    hi Comment gui=italic 
    hi Normal guibg=none 
    hi NormalFloat guibg=none 
    hi NormalNC guibg=none 
    hi FloatBorder guibg=none guifg=none 
    hi VertSplit guibg=#282828 guifg=#282828 
    hi CursorLine guibg=#323232 
    hi LineNr guibg=#282828 guifg=#585858 
    hi SignColumn guibg=#282828 guifg=#585858 
    hi EndOfBuffer guifg=#181818 
    hi Pmenu guibg=#484848 
    hi PmenuSel guifg=#181818 guibg=#7cafc2 
    hi PmenuSbar guibg=#383838 
    hi WildMenu guibg=#7cafc2 guifg=#181818
    hi NvimTreeIndentMarker guifg=#585858 

    hi BufferLineIndicatorSelected guifg=#7cafc2 
    hi BufferLineBufferSelected gui=none 
    hi BufferLineWarningSelected gui=none 
    hi BufferLineWarningDiagnosticSelected gui=none 
    hi BufferLineErrorSelected gui=none 
    hi BufferLineErrorDiagnosticSelected gui=none 

    hi LspDiagnosticsSignWarning guifg=#f7ca88 guibg=#282828 
    hi LspDiagnosticsSignError guifg=#ab4642 guibg=#282828 
    hi LspDiagnosticsSignInformation guifg=#7cafc2 guibg=#282828 
    hi LspDiagnosticsSignHint guifg=#f8f8f8 guibg=#282828 

    hi GitGutterAdd guibg=#282828 
    hi GitGutterChange guibg=#282828 
    hi GitGutterChangeDelete guibg=#282828 
    hi GitGutterDelete guibg=#282828
endfunction

augroup custom_base16_colors
    autocmd!
    autocmd ColorScheme * call MyHighlights()
augroup end

colorscheme base16-default-dark

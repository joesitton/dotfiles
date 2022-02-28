require("lsp_signature").setup(
  {
    doc_lines = 10,
    floating_window_above_cur_line = true,
    -- floating_window_off_x = 1,
    -- floating_window_off_y = 1,
    fix_pos = false, -- set to true, the floating window will not auto-close until finish all parameters
    hint_enable = false,
    hi_parameter = "CmpItemAbbrMatch",
    max_height = 12,
    max_width = 80,
    always_trigger = false, -- sometime show signature on new line or in middle of parameter can be confusing, set it to false for #58
    toggle_key = "<C-d>"
  }
)

require("lightspeed").setup(
  {
    exit_after_idle_msecs = {labeled = nil, unlabeled = nil},
    jump_on_partial_input_safety_timeout = 400,
    highlight_unique_chars = true,
    grey_out_search_area = true,
    match_only_the_start_of_same_char_seqs = true,
    repeat_ft_with_target_char = false,
    limit_ft_matches = 12,
    substitute_chars = {["\r"] = "¬"},
    labels = nil,
    instant_repeat_fwd_key = nil,
    instant_repeat_bwd_key = nil,
    cycle_group_fwd_key = nil,
    cycle_group_bwd_key = nil
  }
)

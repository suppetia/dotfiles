require("nvim_comment").setup({
  -- Normal mode mapping left hand side
  cline_mapping = "gcc",
  -- Visual/Operator mode mapping lhs
  operator_mapping = "gc",
  -- text object mapping, comment chunk,,
  comment_chunk_text_object = "ic",
  -- Hook function to call before commenting takes place
  hook = nil,
})

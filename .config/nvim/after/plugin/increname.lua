require("inc_rename").setup {
  input_buffer_type = "dressing",
}
 

vim.keymap.set("n", "rn", ":Inc_rename")

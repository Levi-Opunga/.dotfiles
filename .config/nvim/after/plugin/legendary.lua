local M = {}

local keymap = vim.keymap.set
local default_opts = { noremap = true, silent = true }

  keymap("n", "rj,", "<cmd>lua require('legendary').find()<CR>", default_opts)
function M.setup()
  require("legendary").setup { include_builtin = true, auto_register_which_key = true }
  keymap("n", "rj,", "<cmd>lua require('legendary').find()<CR>", default_opts)
end

return M

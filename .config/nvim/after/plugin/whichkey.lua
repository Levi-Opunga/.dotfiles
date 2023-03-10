local wk = require("which-key")

wk.setup({
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = true, -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
  },
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  operators = { gc = "Comments" },
  key_labels = {
    -- override the label used to display some keys. It doesn't effect WK in any other way.
    -- For example:
    -- ["<space>"] = "SPC",
    -- ["<cr>"] = "RET",
    -- ["<tab>"] = "TAB",
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  popup_mappings = {
    scroll_down = "<c-d>", -- binding to scroll down inside the popup
    scroll_up = "<c-u>", -- binding to scroll up inside the popup
  },
  window = {
    border = "none", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    winblend = 0,
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
    align = "left", -- align columns left, center or right
  },
  ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
  show_help = true, -- show help message on the command line when the popup is visible
  show_keys = true, -- show the currently pressed key and its label as a message in the command line
  triggers = "auto", -- automatically setup triggers
  -- triggers = {"<leader>"} -- or specify a list manually
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for key maps that start with a native binding
    -- most people should not need to change this
    i = { "j", "k" },
    v = { "j", "k" },
  },
  -- disable the WhichKey popup for certain buf types and file types.
  -- Disabled by deafult for Telescope
  disable = {
    buftypes = {},
    filetypes = { "TelescopePrompt" },
  },
})

local M = {}

local whichkey = require("which-key")
local legendary = require("legendary.integrations.which-key")
local next = next

local conf = {
  window = {
    border = "single", -- none, single, double, shadow
    position = "bottom", -- bottom, top
  },
}
whichkey.setup(conf)

local opts = {
  mode = "n", -- Normal mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = false, -- use `nowait` when creating keymaps
}

local v_opts = {
  mode = "v", -- Visual mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = false, -- use `nowait` when creating keymaps
}

-- local function normal_keymap()
local lsp_mappigs={["l"] = {
  name = "LSP",
  a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
  c = { "<cmd>lua require('copilot.suggestion').toggle_auto_trigger()<cr>", "Get Capabilities" },
  -- c = { "<cmd>lua require('user.lsp').server_capabilities()<cr>", "Get Capabilities" },
  d = { "<cmd>TroubleToggle<cr>", "Diagnostics" },
  w = {
    "<cmd>Telescope lsp_workspace_diagnostics<cr>",
    "Workspace Diagnostics",
  },
  f = { "<cmd>lua vim.lsp.buf.format({ async = true })<cr>", "Format" },
  F = { "<cmd>LspToggleAutoFormat<cr>", "Toggle Autoformat" },
  i = { "<cmd>LspInfo<cr>", "Info" },
  h = { "<cmd>lua require('lsp-inlayhints').toggle()<cr>", "Toggle Hints" },
  H = { "<cmd>IlluminationToggle<cr>", "Toggle Doc HL" },
  I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
  j = {
    "<cmd>lua vim.diagnostic.goto_next({buffer=0})<CR>",
    "Next Diagnostic",
  },
  k = {
    "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>",
    "Prev Diagnostic",
  },
  v = { "<cmd>lua require('lsp_lines').toggle()<cr>", "Virtual Text" },
  l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
  o = { "<cmd>SymbolsOutline<cr>", "Outline" },
  q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Quickfix" },
  r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
  R = { "<cmd>TroubleToggle lsp_references<cr>", "References" },
  s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
  S = {
    "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
    "Workspace Symbols",
  },
  t = { '<cmd>lua require("user.functions").toggle_diagnostics()<cr>', "Toggle Diagnostics" },
  u = { "<cmd>LuaSnipUnlinkCurrent<cr>", "Unlink Snippet" },
}

}

wk.register(
lsp_mappigs,
opts
)


--
local function Normal()
  -- NOTE:  ### TAB'S
  --
  whichkey.register({
    ["t"] = {
      name = "Tab+TermSide",
      t = {
        "<cmd>lua require('telescope').extensions['telescope-tabs'].list_tabs(require('telescope.themes').get_dropdown{previewer = false, initial_mode='normal', prompt_title='Tabs'})<cr>",
        "Find Tab",
      },
      n = { "<cmd>tabnew %<cr>", "New Tab" },
      c = { "<cmd>tabclose<cr>", "Close Tab" },
      o = { "<cmd>tabonly<cr>", "Only Tab" },
    },
  }, opts)
  -- NOTE: TELESCOPE FIND
  whichkey.register({
    ["f"] = {
      name = "Find",
      b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
      c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
      f = { "<cmd>Telescope find_files<cr>", "Find files" },
      t = { "<cmd>Telescope live_grep<cr>", "Find Text" },
      s = { "<cmd>Telescope grep_string<cr>", "Find String" },
      h = { "<cmd>Telescope help_tags<cr>", "Help" },
      H = { "<cmd>Telescope highlights<cr>", "Highlights" },
      i = { "<cmd>lua require('telescope').extensions.media_files.media_files()<cr>", "Media" },
      l = { "<cmd>Telescope resume<cr>", "Last Search" },
      M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
      r = { "<cmd>Telescope oldfiles<cr>", "Recent File" },
      R = { "<cmd>Telescope registers<cr>", "Registers" },
      k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
      C = { "<cmd>Telescope commands<cr>", "Commands" },
    },
  }, opts)

  -- NOTE: NOTES
  whichkey.register({
    ["n"] = {
      name = "Notes",
      c = { "<cmd>Telekasten show_calendar<cr>", "Calendar" },
      n = { "<cmd>Telekasten new_note<cr>", "Note" },
      f = { "<cmd>Telekasten find_notes<cr>", "Find" },
      F = { "<cmd>Telekasten find_daily_notes<cr>", "Find Journal" },
      j = { "<cmd>Telekasten goto_today<cr>", "Journal" },
      p = { "<cmd>Telekasten panel<cr>", "Panel" },
      t = { "<cmd>Telekasten toggle_todo<cr>", "Toggle Todo" },
    },
  }, opts)

  -- NOTE: MARKINGS
  local m_opts = {
    mode = "n", -- NORMAL mode
    prefix = "m",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true, -- use `nowait` when creating keymaps
  }

  local m_mappings = {
    a = { "<cmd>silent BookmarkAnnotate<cr>", "Annotate" },
    c = { "<cmd>silent BookmarkClear<cr>", "Clear" },
    b = { "<cmd>silent BookmarkToggle<cr>", "Toggle" },
    m = { '<cmd>lua require("harpoon.mark").add_file()<cr>', "Harpoon" },
    ["."] = { '<cmd>lua require("harpoon.ui").nav_next()<cr>', "Harpoon Next" },
    [","] = { '<cmd>lua require("harpoon.ui").nav_prev()<cr>', "Harpoon Prev" },
    l = { "<cmd>lua require('user.bfs').open()<cr>", "Buffers" },
    j = { "<cmd>silent BookmarkNext<cr>", "Next" },
    s = { "<cmd>Telescope harpoon marks<cr>", "Search Files" },
    k = { "<cmd>silent BookmarkPrev<cr>", "Prev" },
    S = { "<cmd>silent BookmarkShowAll<cr>", "Prev" },
    -- s = {
    --   "<cmd>lua require('telescope').extensions.vim_bookmarks.all({ hide_filename=false, prompt_title=\"bookmarks\", shorten_path=false })<cr>",
    --   "Show",
    -- },
    x = { "<cmd>BookmarkClearAll<cr>", "Clear All" },
    [";"] = { '<cmd>lua require("harpoon.ui").toggle_quick_menu()<cr>', "Harpoon UI" },
  }

  whichkey.register(m_mappings, m_opts)
  -- NOTE: Code action mapping
  --
  whichkey.register({
    ["c"] = {
      name = "Code",
      g = { "<cmd>Neogen func<Cr>", "Func Doc" },
      G = { "<cmd>Neogen class<Cr>", "Class Doc" },
      d = { "<cmd>DogeGenerate<Cr>", "Generate Doc" },
      T = { "<cmd>TodoTelescope<Cr>", "TODO" },
      x = "Swap Next Param",
      X = "Swap Prev Param",
      -- f = "Select Outer Function",
      -- F = "Select Outer Class",
    },
  }, opts)

  quit = {
    q = { "<cmd>wq<CR>", "Quit" },
  }

  whichkey.register(quit, opts)
end

local function code_keymap()
  vim.api.nvim_create_autocmd("FileType", {
    pattern = "*",
    callback = function()
      vim.schedule(CodeRunner)
    end,
  })
end

function CodeRunner()
  local bufnr = vim.api.nvim_get_current_buf()
  local ft = vim.api.nvim_buf_get_option(bufnr, "filetype")
  local fname = vim.fn.expand("%:p:t")
  local keymap_c = {} -- normal key map
  local keymap_c_v = {} -- visual key map
  local r_mapping = {}

  if ft == "python" then
    keymap_c = {
      name = "Code",
      r = { "<cmd>update<CR><cmd>exec '!python3' shellescape(@%, 1)<cr>", "Run" },
      m = { "<cmd>TermExec cmd='nodemon -e py %'<cr>", "Monitor" },
    }
  elseif ft == "lua" then
    keymap_c = {
      name = "Code",
      r = { "<cmd>lua %<cr>", "Run" },
    }
  elseif ft == "rust" then
    keymap_c = {
      name = "Code",
      r = { "<cmd>execute 'Cargo run' | startinsert<cr>", "Run" },
      D = { "<cmd>RustDebuggables<cr>", "Debuggables" },
      h = { "<cmd>RustHoverActions<cr>", "Hover Actions" },
      R = { "<cmd>RustRunnables<cr>", "Runnables" },
    }
  elseif ft == "go" then
    keymap_c = {
      name = "Code",
      r = { "<cmd>GoRun<cr>", "Run" },
    }
  elseif ft == "typescript" or ft == "typescriptreact" or ft == "javascript" or ft == "javascriptreact" then
    keymap_c = {
      name = "Code",
      o = { "<cmd>TypescriptOrganizeImports<cr>", "Organize Imports" },
      r = { "<cmd>TypescriptRenameFile<cr>", "Rename File" },
      i = { "<cmd>TypescriptAddMissingImports<cr>", "Import Missing" },
      F = { "<cmd>TypescriptFixAll<cr>", "Fix All" },
      u = { "<cmd>TypescriptRemoveUnused<cr>", "Remove Unused" },
      R = { "<cmd>lua require('config.test').javascript_runner()<cr>", "Choose Test Runner" },
      s = { "<cmd>2TermExec cmd='yarn start'<cr>", "Yarn Start" },
      t = { "<cmd>2TermExec cmd='yarn test'<cr>", "Yarn Test" },
    }
  elseif ft == "java" then
    keymap_c = {
      name = "Code",
      o = { "<cmd>lua require'jdtls'.organize_imports()<cr>", "Organize Imports" },
      v = { "<cmd>lua require('jdtls').extract_variable()<cr>", "Extract Variable" },
      c = { "<cmd>lua require('jdtls').extract_constant()<cr>", "Extract Constant" },
      t = { "<cmd>lua require('jdtls').test_class()<cr>", "Test Class" },
      n = { "<cmd>lua require('jdtls').test_nearest_method()<cr>", "Test Nearest Method" },
      j = { "<cmd>!java %<CR>", "Simple Java file" },
    }
    keymap_c_v = {
      name = "Code",
      v = { "<cmd>lua require('jdtls').extract_variable(true)<cr>", "Extract Variable" },
      c = { "<cmd>lua require('jdtls').extract_constant(true)<cr>", "Extract Constant" },
      m = { "<cmd>lua require('jdtls').extract_method(true)<cr>", "Extract Method" },
    }
  end

  if fname == "package.json" then
    keymap_c.v = { "<cmd>lua require('package-info').show()<cr>", "Show Version" }
    keymap_c.c = { "<cmd>lua require('package-info').change_version()<cr>", "Change Version" }
    keymap_c.s = { "<cmd>2TermExec cmd='yarn start'<cr>", "Yarn Start" }
    keymap_c.t = { "<cmd>2TermExec cmd='yarn test'<cr>", "Yarn Test" }
  end

  if fname == "Cargo.toml" then
    keymap_c.u = { "<cmd>lua require('crates').upgrade_all_crates()<cr>", "Upgrade All Crates" }
  end

  if next(keymap_c) ~= nil then
    local k = { c = keymap_c }
    local rm = { j = r_mapping }
    local o = { mode = "n", silent = true, noremap = true, buffer = bufnr, prefix = "<leader>", nowait = true }
    local os = { mode = "n", silent = true, noremap = true, buffer = bufnr, prefix = "r", nowait = true }
    whichkey.register(k, o)
    legendary.bind_whichkey(k, o, false)
    whichkey.register(rm, os)
    legendary.bind_whichkey(rm, os, false)
  end

  if next(keymap_c_v) ~= nil then
    local k = { c = keymap_c_v }
    local o = { mode = "v", silent = true, noremap = true, buffer = bufnr, prefix = "<leader>", nowait = true }
    whichkey.register(k, o)
    legendary.bind_whichkey(k, o, false)
  end
end

Normal()
code_keymap()

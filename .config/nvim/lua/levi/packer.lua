-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
  -- Packer can manage itself
  use {
    "lewis6991/hover.nvim",
    config = function()
      require("hover").setup {
        init = function()
          -- Require providers
          require("hover.providers.lsp")
          -- require('hover.providers.gh')
          -- require('hover.providers.gh_user')
          -- require('hover.providers.jira')
          -- require('hover.providers.man')
          -- require('hover.providers.dictionary')
        end,
        preview_opts = {
          border = nil
        },
        -- Whether the contents of a currently open hover window should be moved
        -- to a :h preview-window when pressing the hover keymap.
        preview_window = false,
        title = true
      }

      -- Setup keymaps
      vim.keymap.set("n", "K", require("hover").hover, { desc = "hover.nvim" })
      vim.keymap.set("n", "gK", require("hover").hover_select, { desc = "hover.nvim (select)" })
    end
  }

  use("wbthomason/packer.nvim")
  use({
    "nvim-telescope/telescope.nvim",
    tag = "0.1.0",
    -- or                            , branch = '0.1.x',
    requires = { { "nvim-lua/plenary.nvim" } },
  })
  use("NLKNguyen/papercolor-theme")
  use("JoosepAlviste/palenightfall.nvim")
  use("yorickpeterse/vim-paper")
  use({ "atelierbram/Base4Tone-nvim" })
  use("rafi/awesome-vim-colorschemes")
  use("chriskempson/base16-vim")
  use("habamax/vim-pire")
  use({ "atelierbram/Base2Tone-nvim" })
  use("kvrohit/mellow.nvim")
  use("voidekh/kyotonight.vim")
  use("cideM/yui")
  use("zoomiti/firewatch")
  use("renerocksai/calendar-vim")
  use("renerocksai/telekasten.nvim")

  use("mzlogin/vim-markdown-toc")
  use("nvim-telescope/telescope-media-files.nvim")
  -- Lua
  use("norcalli/nvim-colorizer.lua")
  use({
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup({
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below

      })
    end,
  })
  use("tribela/vim-transparent")
  use({
    "mrjones2014/legendary.nvim",
    -- sqlite is only needed if you want to use frecency sorting
    -- requires = 'kkharji/sqlite.lua'
  })
  use({
    "anuvyklack/hydra.nvim",
    config = function()
      require("config.hydra").setup()
    end,
    requires = "anuvyklack/keymap-layer.nvim",
    module = { "hydra" },
    event = { "BufReadPre" },
  })
  use({
    "jesseleite/nvim-noirbuddy",
    requires = { "tjdevries/colorbuddy.nvim", branch = "dev" },
  })

  use("lunarvim/templeos.nvim")
  --  use({ "neoclide/coc.nvim", branch = "release" })
  use({
    "rose-pine/neovim",
    as = "rose-pine",
    config = function()
      vim.cmd("colorscheme rose-pine")
    end,
  })
  use("junegunn/goyo.vim")
  use("junegunn/limelight.vim")
  use("junegunn/seoul256.vim")
  use("junegunn/vader.vim")
  use("jbyuki/venn.nvim")
  use("anuvyklack/hydra.nvim")
  use("puremourning/vimspector")
  -- use("artur-shaik/jc.nvim")
  use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })
  use("folke/tokyonight.nvim")
  use("mfussenegger/nvim-dap")

  use("simeji/winresizer")
  use("ellisonleao/gruvbox.nvim")
  use({ "artur-shaik/jc.nvim" })
  use({
    "nvim-treesitter/nvim-treesitter",
    run = function()
      local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
      ts_update()
    end,
  })
  use({
    "smjonas/inc-rename.nvim",
    config = function()
      require("inc_rename").setup()
    end,
  })
  use({ "stevearc/dressing.nvim" })
  use({ "nvim-telescope/telescope-ui-select.nvim" })
  use("rcarriga/nvim-notify")
  use({ "nvim-orgmode/orgmode" })
  use("tpope/vim-speeddating")
  use("tpope/vim-fugitive")
  use("nvim-treesitter/playground")
  use("mbbill/undotree")
  use("theprimeagen/harpoon")
  use("tpope/vim-rhubarb")
  use("lewis6991/gitsigns.nvim")
  use("aserebryakov/vim-todo-lists")
  use("navarasu/onedark.nvim")              -- Theme inspired by Atom
  use("nvim-lualine/lualine.nvim")          -- Fancier statusline
  use("lukas-reineke/indent-blankline.nvim") -- Add indentation guides even on blank lines
  --use 'numToStr/Comment.nvim' -- "gc" to comment visual regions/lines
  use({
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  })
  -- install without yarn or npm
  use({
    "iamcco/markdown-preview.nvim",
    run = function()
      vim.fn["mkdp#util#install"]()
    end,
  })
  use("junegunn/rainbow_parentheses.vim")
  use({
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    setup = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  })
  use({
    "kwkarlwang/bufresize.nvim",
    config = function()
      require("bufresize").setup()
    end,
  })

  use({
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup({
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      })
    end,
  })
  use "jamesnvc/lsp_server"
  use({
    "smjonas/inc-rename.nvim",
    config = function()
      require("inc_rename").setup()
    end,
  })
  use("tpope/vim-surround")
  use("jiangmiao/auto-pairs")

  use({
    -- Autocompletion
    "hrsh7th/nvim-cmp",
    requires = { "hrsh7th/cmp-nvim-lsp", "L3MON4D3/LuaSnip", "saadparwaiz1/cmp_luasnip" },
  })
  use("ycm-core/YouCompleteMe")
  use({ "tzachar/cmp-tabnine", run = "./install.sh", requires = "hrsh7th/nvim-cmp" })

  -- fglflfhlh

  use("tpope/vim-sleuth") -- Detect tabstop and shiftwidth automatically
  use({
    "VonHeikemen/lsp-zero.nvim",
    requires = {
      -- LSP Support
      { "neovim/nvim-lspconfig" },
      { "williamboman/mason.nvim" },
      { "williamboman/mason-lspconfig.nvim" },

      -- Autocompletion
      { "hrsh7th/nvim-cmp" },
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-path" },
      { "saadparwaiz1/cmp_luasnip" },
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-nvim-lua" },

      -- Snippets
      { "L3MON4D3/LuaSnip" },
      { "rafamadriz/friendly-snippets" },
    },
  })
  use("neovim/nvim-lspconfig") -- Configurations for Nvim LSP

  use({
    "Pocco81/true-zen.nvim",
    config = function()
      require("true-zen").setup({})
    end,
  })
  -- Lua
  use({
    "folke/zen-mode.nvim",
    config = function()
      require("zen-mode").setup({})
    end,
  })
  -- use({ "romgrk/barbar.nvim", wants = "nvim-web-devicons" })
  use("onsails/lspkind.nvim")
  -- use("williamboman/nvim-lsp-installer")
  use("j-hui/fidget.nvim")
  use("nvim-tree/nvim-web-devicons")

  use("jose-elias-alvarez/null-ls.nvim")

  use({
    "akinsho/toggleterm.nvim",
    tag = "*",
    config = function()
      require("toggleterm").setup()
    end,
  })
  -- using packer.nvim
  use({ "akinsho/bufferline.nvim", tag = "v3.*", requires = "nvim-tree/nvim-web-devicons" })

  use({
    "nvim-tree/nvim-tree.lua",
    requires = {
      "nvim-tree/nvim-web-devicons", -- optional, for file icons
    },
    tag = "nightly",              -- optional, updated every week. (see issue #1193)
  })                              -- Lua
  use("mfussenegger/nvim-jdtls")
  use({ "nvim-telescope/telescope-ui-select.nvim" })
  use({
    "glepnir/lspsaga.nvim",
    branch = "main",
    config = function()
      require("lspsaga").setup({})
    end,
  })

  use({
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup({
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below

        {
          position = "bottom", -- position of the list can be: bottom, top, left, right
          height = 10, -- height of the trouble list when position is top or bottom
          width = 50, -- width of the list when position is left or right
          icons = true, -- use devicons for filenames
          mode = "workspace_diagnostics", -- "workspace_diagnostics", "document_diagnostics", "quickfix", "lsp_references", "loclist"
          fold_open = "", -- icon used for open folds
          fold_closed = "", -- icon used for closed folds
          group = true, -- group results by file
          padding = true, -- add an extra new line on top of the list
          action_keys = { -- key mappings for actions in the trouble list
            -- map to {} to remove a mapping, for example:
            -- close = {},
            close = "q",                -- close the list
            cancel = "<esc>",           -- cancel the preview and get back to your last window / buffer / cursor
            refresh = "r",              -- manually refresh
            jump = { "<cr>", "<tab>" }, -- jump to the diagnostic or open / close folds
            open_split = { "<c-x>" },   -- open buffer in new split
            open_vsplit = { "<c-v>" },  -- open buffer in new vsplit
            open_tab = { "<c-t>" },     -- open buffer in new tab
            jump_close = { "o" },       -- jump to the diagnostic and close the list
            toggle_mode = "m",          -- toggle between "workspace" and "document" diagnostics mode
            toggle_preview = "P",       -- toggle auto_preview
            hover = "K",                -- opens a small popup with the full multiline message
            preview = "p",              -- preview the diagnostic location
            close_folds = { "zM", "zm" }, -- close all folds
            open_folds = { "zR", "zr" }, -- open all folds
            toggle_fold = { "zA", "za" }, -- toggle fold of current file
            previous = "k",             -- previous item
            next = "j",                 -- next item
          },
          indent_lines = true,          -- add an indent guide below the fold icons
          auto_open = false,            -- automatically open the list when you have diagnostics
          auto_close = false,           -- automatically close the list when you have no diagnostics
          auto_preview = true,          -- automatically preview the location of the diagnostic. <esc> to close preview and go back to last window
          auto_fold = false,            -- automatically fold a file trouble list at creation
          auto_jump = { "lsp_definitions" }, -- for the given modes, automatically jump if there is only a single result
          signs = {
            -- icons / text used for a diagnostic
            error = "",
            warning = "",
            hint = "",
            information = "",
            other = "﫠",
          },
          use_diagnostic_signs = false, -- enabling this will use the signs defined in your lsp client
        },
      })
    end,
  })
  use("xiyaowong/nvim-transparent")

  use({
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup({})
    end,
  })
  --   -- Simple plugins can be specified as strings
  --   use 'rstacruz/vim-closer'

  --   -- Lazy loading:
  --   -- Load on specific commands
  --   use {'tpope/vim-dispatch', opt = true, cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}

  --   -- Load on an autocommand event
  --   use {'andymass/vim-matchup', event = 'VimEnter'}

  --   -- Load on a combination of conditions: specific filetypes or commands
  --   -- Also run code after load (see the "config" key)
  --   use {
  --     'w0rp/ale',
  --     ft = {'sh', 'zsh', 'bash', 'c', 'cpp', 'cmake', 'html', 'markdown', 'racket', 'vim', 'tex'},
  --     cmd = 'ALEEnable',
  --     config = 'vim.cmd[[ALEEnable]]'
  --   }

  --   -- Plugins can have dependencies on other plugins
  --   use {
  --     'haorenW1025/completion-nvim',
  --     opt = true,
  --     requires = {{'hrsh7th/vim-vsnip', opt = true}, {'hrsh7th/vim-vsnip-integ', opt = true}}
  --   }

  --   -- Plugins can also depend on rocks from luarocks.org:
  --   use {
  --     'my/supercoolplugin',
  --     rocks = {'lpeg', {'lua-cjson', version = '2.1.0'}}
  --   }

  --   -- You can specify rocks in isolation
  --   use_rocks 'penlight'
  --   use_rocks {'lua-resty-http', 'lpeg'}

  --   -- Local plugins can be included
  --   use '~/projects/personal/hover.nvim'

  --   -- Plugins can have post-install/update hooks
  --   use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview'}

  --   -- Post-install/update hook with neovim command
  --   use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  --   -- Post-install/update hook with call of vimscript function with argument
  --   use { 'glacambre/firenvim',: run = function() vim.fn['firenvim#install'](0) end }

  --   -- Use specific branch, dependency and run lua file after load
  --   use {
  --     'glepnir/galaxyline.nvim', branch = 'main', config = function() require'statusline' end,
  --     requires = {'kyazdani42/nvim-web-devicons'}
  --   }

  --   -- Use dependency and run lua function after load
  --   use {
  --     'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' },
  --     config = function() require('gitsigns').setup() end
  --   }

  --   -- You can specify multiple plugins in a single call
  --   use {'tjdevries/colorbuddy.vim', {'nvim-treesitter/nvim-treesitter', opt = true}}

  --   -- You can alias plugin names
  use({ "dracula/vim", as = "dracula" })
  use("ms-jpq/coq_nvim")
  use("nvim-lua/popup.nvim")
  use("nvim-lua/plenary.nvim")

  -- " Add maktaba and codefmt to the runtimepath.
  ---" (The latter must be installed before it can be used.)
  use("google/vim-maktaba")
  use("google/vim-codefmt")
  --" Also add Glaive, which is used to configure codefmt's maktaba flags. See
  --" `:help :Glaive` for usage.
  use("google/vim-glaive")
  use({
    "danymat/neogen",
    config = function()
      require("neogen").setup({})
    end,
    requires = "nvim-treesitter/nvim-treesitter",
    -- Uncomment next line if you want to follow only stable versions
    -- tag = "*"
  })
  use("ms-jpq/coq.artifacts", { branch = "artifacts" })
  use("MattesGroeger/vim-bookmarks")
  use("ms-jpq/coq.thirdparty", { branch = "3p" })

  use("famiu/bufdelete.nvim")

  -- call glaive#Install()
  -- " Optional: Enable codefmt's default mappings on the <Leader>= prefix.
  -- Glaive codefmt plugin[mappings]
  -- Glaive codefmt google_java_executable="java -jar /path/to/google-java-format-VERSION-all-deps.jar"
end)

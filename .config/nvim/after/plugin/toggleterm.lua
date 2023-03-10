local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
    return
end

toggleterm.setup({
    size = function(term)
        if term.direction == "horizontal" then
            return 10
        elseif term.direction == "vertical" then
            return 20
        end
    end,
    open_mapping = [[<c-\>]],
    hide_numbers = true,
    shade_filetypes = {},
    shade_terminals = true,
    shading_factor = 2,
    start_in_insert = true,
    insert_mappings = true,
    persist_size = true,
    direction = "float",
    close_on_exit = true,
    shell = vim.o.shell,
    float_opts = {
        border = "curved",
        winblend = 0,
        highlights = {
            border = "Normal",
            background = "Normal",
        },
    },
})

function _G.set_terminal_keymaps()
    local opts = {
        noremap = true,
    }
    vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], opts)
    vim.api.nvim_buf_set_keymap(0, "t", "jk", [[<C-\><C-n>]], opts)
    vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
    vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
    vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
    vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
end

vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

local Terminal = require("toggleterm.terminal").Terminal
-- local lazygit = Terminal:new({
--     cmd = "lazygit",
--     hidden = true
-- })

-- function _LAZYGIT_TOGGLE()
--     lazygit:toggle()
-- end

local node = Terminal:new({
    cmd = "node",
    hidden = true,
})

function _NODE_TOGGLE()
    node:toggle()
end

local ncdu = Terminal:new({
    cmd = "ncdu",
    hidden = true,
})

function _NCDU_TOGGLE()
    ncdu:toggle()
end

local htop = Terminal:new({
    cmd = "htop",
    hidden = true,
})

function _HTOP_TOGGLE()
    htop:toggle()
end

local python = Terminal:new({
    cmd = "python",
    hidden = true,
})

function _PYTHON_TOGGLE()
    python:toggle()
end

local sidetermN = Terminal:new({
    direction = "vertical",
    size = function(term)
        if term.direction == "horizontal" then
            return 15
        elseif term.direction == "vertical" then
            return vim.o.columns * 0.6
        end
    end,
    dir = "~/",
    float_opts = {
        border = "curved",
    },
    -- function to run on opening the terminal
    on_open = function(term)
        vim.cmd("startinsert!")
        -- vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {
        --   noremap = true,
        -- silent = true
        -- })
    end,
    -- functio n to run on closing the terminal
    on_close = function(term)
        vim.cmd("startinsert!")
    end,
})

local sideterm = Terminal:new({
    direction = "vertical",
    size = function(term)
        if term.direction == "horizontal" then
            return 15
        elseif term.direction == "vertical" then
            return vim.o.columns * 0.6
        end
    end,
    dir = "$PWD",
    float_opts = {
        border = "curved",
    },
    -- function to run on opening the terminal
    on_open = function(term)
        vim.cmd("startinsert!")
        -- vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {
        --   noremap = true,
        -- silent = true
        -- })
    end,
    -- functio n to run on closing the terminal
    on_close = function(term)
        vim.cmd("startinsert!")
    end,
})

local bottom = Terminal:new({
    direction = "horizontal",
    size = 8,
    dir = "$PWD",
    float_opts = {
        border = "curved",
    },
    -- function to run on opening the terminal
    on_open = function(term)
        vim.cmd("startinsert!")
        -- vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {
        --   noremap = true,
        -- silent = true
        -- })
    end,
    -- functio n to run on closing the terminal
    on_close = function(term)
        vim.cmd("startinsert!")
    end,
})

function _bottomTerminal()
    bottom:toggle()
end

function _sidetermN()
    sidetermN:toggle()
end

function _sideterm()
    sideterm:toggle()
end

local glow = Terminal:new({
    cmd = "glow",
    dir = "git_dir",
    direction = "tab",
    float_opts = {
        border = "curved",
    },
    -- function to run on opening the terminal
    on_open = function(term)
        vim.cmd("startinsert!")
        vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {
            noremap = true,
            silent = true,
        })
    end,
    -- functio n to run on closing the terminal
    on_close = function(term)
        vim.cmd("startinsert!")
    end,
})

function _glow_toggle()
    glow:toggle()
end

local lazygit = Terminal:new({
    cmd = "lazygit",
    dir = "$PWD",
    direction = "float",
    float_opts = {
        border = "curved",
    },
    -- function to run on opening the terminal
    on_open = function(term)
        vim.cmd("startinsert!")
        vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {
            noremap = true,
            silent = true,
        })
    end,
    -- functio n to run on closing the terminal
    on_close = function(term)
        vim.cmd("startinsert!")
    end,
})

function _lazygit_toggle()
    lazygit:toggle()
end

local wk = require("which-key")

local opts = {
    mode = "n", -- Normal mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = false, -- use `nowait` when creating keymaps
}
wk.register({
    ["g"] = {
        name = "G Mappings",
        i = { "<cmd>lua _lazygit_toggle()<CR>", "toggle Lazy Git" },
        l = { "<cmd>lua _glow_toggle()<CR>", "Glow Preview" },
        c = {"<cmd>lua vim.lsp.buf.code_action()<CR>","Code Actions"}
    },
}, opts)
-- vim.api.nvim_set_keymap("n", "<leader>gi", "<cmd>lua _lazygit_toggle()<CR>", {
--     noremap = true,
--     silent = true,
-- })



wk.register({
    ["t"] = {
        name = "Term",
        s = { "<cmd>lua _sidetermN() <CR>", "Side term 1" },
        b = { "<cmd>lua _bottomTerminal()<CR>", "Bottom term" },
    },
}, opts)


-- --
-- vim.api.nvim_set_keymap("n", "<leader>ts", "<cmd>lua _sidetermN()<CR>", {
--     noremap = true,
--     silent = true,
-- })
--
vim.api.nvim_set_keymap("n", "<leader>st", "<cmd>lua _sideterm()<CR>", {
    noremap = true,
    silent = true,
})

-- vim.api.nvim_set_keymap("n", "<leader>gl", "<cmd>lua _glow_toggle()<CR>", {
--     noremap = true,
--     silent = true,
-- })

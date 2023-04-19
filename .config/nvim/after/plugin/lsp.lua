local lspconfig = require("lspconfig")
local lsp_defaults = lspconfig.util.default_config

lsp_defaults.capabilities =
    vim.tbl_deep_extend("force", lsp_defaults.capabilities, require("cmp_nvim_lsp").default_capabilities())
vim.diagnostic.config({
    virtual_text = false,
    severity_sort = true,
    float = {
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
    },
})
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
vim.opt.signcolumn = "yes" -- Reserve space for diagnostic icons
vim.opt.completeopt = { "menu", "menuone", "noselect" }

require("luasnip.loaders.from_vscode").lazy_load()

local lsp = require("lsp-zero")
lsp.preset("recommended")

lsp.ensure_installed({
    "tsserver",
    "jdtls",
    "grammarly",
    "prismals",
    "kotlin_language_server",
    "gopls",
    "golangci_lint_ls",
    "clangd",
    "bashls",
    "clangd",
    "cssmodules_ls",
    "eslint",
    "ocamllsp",
    "pyright",
    "sqls",
    "tailwindcss",
    "svelte",
    "marksman",
    "texlab",
    "hls",
    "html",
    "jsonls",
    "rust_analyzer",
})

-- nvim-cmp setup
local cmp = require("cmp")
local luasnip = require("luasnip")
local lspkind = require("lspkind")

lsp.setup_nvim_cmp({
    preselect = "none",
    completion = {
        completeopt = 'menu,menuone,noinsert,noselect'
    },
    sources = {
        {
            name = "path",
        },
        {
            name = "nvim_lsp",
        },
        {
            name = "luasnip",
        },

        {
            name = "buffer",
            keyword_length = 3,
        },
        {
            name = "cmp_tabnine",
        },
    },
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    window = {
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-d>"] = cmp.mapping.scroll_docs( -4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable( -1) then
                luasnip.jump( -1)
            else
                fallback()
            end
        end, { "i", "s" }),
    }),
    formatting = {
        fields = { "menu", "abbr", "kind" },
        format = lspkind.cmp_format({
            -- mode = 'symbol', -- show only symbol annotations
            maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
            ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
            mode = "symbol_text",

            -- default symbol map
            -- can be either 'default' (requires nerd-fonts font) or
            -- 'codicons' for codicon preset (requires vscode-codicons font)
            --
            -- default: 'default'
            preset = "codicons",

            -- override preset symbols
            --
            -- default: {}
            symbol_map = {
                Text = "",
                Method = "",
                Function = "",
                Constructor = "",
                Field = "ﰠ",
                Variable = "",
                Class = "ﴯ",
                Interface = "",
                Module = "",
                Property = "ﰠ",
                Unit = "塞",
                Value = "",
                Enum = "",
                Keyword = "",
                Snippet = "",
                Color = "",
                File = "",
                Reference = "",
                Folder = "",
                EnumMember = "",
                Constant = "",
                Struct = "פּ",
                Event = "",

                Operator = "",
                TypeParameter = "",
            },
            -- The function below will be called before any actual modifications from lspkind
            -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
            before = function(entry, vim_item)
                local source_mapping = {
                    buffer = "",
                    nvim_lsp = "",
                    nvim_lua = "",
                    cmp_tabnine = "",
                    path = "/",
                }
                local menu_icon = {
                    nvim_lsp = "λ",
                    luasnip = "⋗",
                    buffer = "Ω",
                    path = "🖫",
                }

                vim_item.menu = menu_icon[entry.source.name]
                vim_item.kind = lspkind.symbolic(vim_item.kind, {
                    mode = "symbol",
                })
                vim_item.menu = source_mapping[entry.source.name]
                if entry.source.name == "cmp_tabnine" then
                    local detail = (entry.completion_item.data or {}).detail
                    vim_item.kind = ""
                    if detail and detail:find(".*%%.*") then
                        vim_item.kind = vim_item.kind .. " " .. detail
                    end

                    if (entry.completion_item.data or {}).multiline then
                        vim_item.kind = vim_item.kind .. " " .. "[ML]"
                    end
                end
                local maxwidth = 80
                vim_item.abbr = string.sub(vim_item.abbr, 1, maxwidth)
                return vim_item
            end,
        }),
    },
})

lsp.on_attach(function(client, bufnr)
    local opts = {
        buffer = bufnr,
        remap = false,
    }

    local bufopts = {
        noremap = true,
        silent = true,
        buffer = bufnr,
    }

    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

    if client.name == "eslint" then
        vim.cmd.LspStop("eslint")
        return
    end
    local nmap = function(keys, func, desc)
        if desc then
            desc = "LSP: " .. desc
        end

        vim.keymap.set("n", keys, func, {
            buffer = bufnr,
            desc = desc,
        })
    end
    -- vim.keymap.set("n", "<leader>rn", function()
    -- return ":IncRename " .. vim.fn.expand("<cword>")
    -- end, { expr = true })
    -- vim.keymap.("n", "<leader>rn", ":IncRename ")  p *vim.lsp.util.rename()*
    -- nmap("<leader>rs", function() vim.lsp.buff.rename(vim.ui.input())end, "[R]e[n]ame")
    -- nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
    -- vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    -- vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    -- vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
    -- vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
    -- vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
    -- vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
    -- vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
    -- vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
    -- vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
    -- vim.keymap.set("n", "<leader>fc", vim.lsp.buf.format, opts)
    -- vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
    --
    --  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    --  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    --  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    --  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    --  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    --  vim.keymap.set('n', '<space>wl', function()
    --    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    --  end, bufopts)
    --  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
    --  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
    --  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
    --  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    --  vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
    --
    --
    vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
end)

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

--
lsp.setup({
    capabilities = capabilities,
})

-- local lspkind = require('lspkind')

-- local source_mapping = {
--     buffer = "[Buffer]",
--     nvim_lsp = "[LSP]",
--     nvim_lua = "[Lua]",
-- 	cmp_tabnine = "[TN]",
--     path = "[Path]"
-- }

-- require'cmp'.setup {
--     sources = {{
--         name = 'cmp_tabnine'
--     }},
--     formatting = {
--         format = function(entry, vim_item)
--             -- if you have lspkind installed, you can use it like
--             -- in the following line:
--             vim_item.kind = lspkind.symbolic(vim_item.kind, {
--                 mode = "symbol"
--             })
--             vim_item.menu = source_mapping[entry.source.name]
--             if entry.source.name == "cmp_tabnine" then
--                 local detail = (entry.completion_item.data or {}).detail
--                 vim_item.kind = ""
--                 if detail and detail:find('.*%%.*') then
--                     vim_item.kind = vim_item.kind .. ' ' .. detail
--                 end

--                 if (entry.completion_item.data or {}).multiline then
--                     vim_item.kind = vim_item.kind .. ' ' .. '[ML]'
--                 end
--             end
--             local maxwidth = 80
--             vim_item.abbr = string.sub(vim_item.abbr, 1, maxwidth)
--             return vim_item
--         end
--     }
-- }

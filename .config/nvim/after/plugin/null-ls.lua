local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.diagnostics.eslint,
        null_ls.builtins.code_actions.shellcheck,
        null_ls.builtins.diagnostics.alex,
        null_ls.builtins.diagnostics.markdownlint,
        null_ls.builtins.completion.spell,
        null_ls.builtins.formatting.gofmt,
        null_ls.builtins.formatting.goimports ,
        null_ls.builtins.formatting.json_tool,
        null_ls.builtins.formatting.ktlint,
         null_ls.builtins.formatting.yamlfmt,
         null_ls.builtins.hover.dictionary ,
         null_ls.builtins.formatting.zprint,
          null_ls.builtins.formatting.joker,
        null_ls.builtins.formatting.eslint_d,
        null_ls.builtins.formatting.google_java_format,
    },
})

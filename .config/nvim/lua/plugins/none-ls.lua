return {
    "nvimtools/none-ls.nvim",
    dependencies = {
        "nvimtools/none-ls-extras.nvim",
        "jay-babu/mason-null-ls.nvim", -- <-- Add this to auto install tools
    },
    config = function()
        local null_ls = require("null-ls")

        -- Setup null-ls sources
        null_ls.setup({
            debug = true,
            sources = {
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.formatting.prettierd,
                null_ls.builtins.formatting.gofumpt,
                null_ls.builtins.diagnostics.golangci_lint,
                null_ls.builtins.diagnostics.pylint,
                null_ls.builtins.formatting.pyink,
                null_ls.builtins.diagnostics.sqlfluff.with({
                    extra_args = { "--dialect", "postgres" },
                }),
                null_ls.builtins.formatting.clang_format,
                null_ls.builtins.diagnostics.phpstan,
                null_ls.builtins.formatting.markdownlint,
            },
        })

        -- Setup mason-null-ls to auto install tools
        require("mason-null-ls").setup({
            ensure_installed = {
                "stylua",
                "prettier",
                "gofumpt",
                "golangci-lint",
                "pylint",
                "sqlfluff",
                "clang-format",
                "phpstan",
                "phpcbf",
                "markdownlint",
                "cpplint",
                "eslint_d",
                "hadolint",
                "cmakelint",
                "cspell",
                "dotenv-linter",
                "yamllint",
                "yamlfmt",
                "prettierd",
            },
            automatic_installation = true,
        })
    end,
}

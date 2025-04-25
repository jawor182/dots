return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
        "L3MON4D3/LuaSnip",
        "rafamadriz/friendly-snippets",
        "saadparwaiz1/cmp_luasnip",
        "j-hui/fidget.nvim",
        -- Add these new dependencies
        "jose-elias-alvarez/null-ls.nvim",
        "jay-babu/mason-null-ls.nvim",
    },

    config = function()
        local cmp = require("cmp")
        local cmp_lsp = require("cmp_nvim_lsp")
        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            cmp_lsp.default_capabilities()
        )

        require("fidget").setup({})
        require("mason").setup({
            ui = {
                icons = {
                    package_installed = " ",
                    package_pending = " ",
                    package_uninstalled = " ",
                },
            },
        })

        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "gopls",
                "bashls",
                "clangd",
                "cssls",
                "cssmodules_ls",
                "css_variables",
                "emmet_ls",
                "emmet_language_server",
                "jsonls",
                "html",
                "pyright",
                "intelephense",
                "ts_ls",
                "tailwindcss",
                "yamlls",
            },
            handlers = {
                -- ... (keep your existing handlers)
            },
        })

        -- Add mason-null-ls setup for formatters and linters
        require("mason-null-ls").setup({
            ensure_installed = {
                -- Formatters
                "stylua",
                "prettier",
                "black",
                "isort",
                "shfmt",
                "gofumpt",
                "goimports",
                "clang-format",
                "yamlfmt",
                "sql-formatter",
                "pyink",
                "phpcbf",
                "jq",

                -- Linters
                "eslint_d",
                "cpplint",
                "shellcheck",
                "hadolint",
                "markdownlint",
                "yamllint",
                "pylint",
                "golangci-lint",
                "stylelint",
                "dotenv-linter",
                "phpcs",
            },
            automatic_installation = true,
        })

        -- Configure null-ls
        local null_ls = require("null-ls")
        null_ls.setup({
            sources = {
                -- Formatters
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.formatting.prettier.with({
                    filetypes = {
                        "html",
                        "markdown",
                        "css",
                        "javascript",
                        "javascriptreact",
                        "typescript",
                        "typescriptreact",
                        "json",
                        "yaml",
                        "scss",
                    },
                }),
                null_ls.builtins.formatting.black,
                null_ls.builtins.formatting.isort,
                null_ls.builtins.formatting.shfmt,
                null_ls.builtins.formatting.gofumpt,
                null_ls.builtins.formatting.goimports,
                null_ls.builtins.formatting.clang_format,
                null_ls.builtins.formatting.rustfmt,

                -- Linters
                null_ls.builtins.diagnostics.eslint_d,
                null_ls.builtins.diagnostics.shellcheck,
                null_ls.builtins.diagnostics.hadolint,
                null_ls.builtins.diagnostics.markdownlint,
                null_ls.builtins.diagnostics.yamllint,
                null_ls.builtins.diagnostics.pylint,
                null_ls.builtins.diagnostics.golangci_lint,
                null_ls.builtins.diagnostics.stylelint,
            },
        })

        -- ... (keep your existing cmp and luasnip config)
        local cmp_select = { behavior = cmp.SelectBehavior.Select }
        cmp.setup.filetype({ "sql" }, {
            sources = {
                { name = "vim-dadbod-completion" },
                { name = "buffer" },
            },
        })
        cmp.setup({
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
                ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
                ["<Tab>"] = cmp.mapping.select_next_item(cmp_select),
                ["<C-y>"] = cmp.mapping.confirm({ select = true }),
                ["<C-Enter>"] = cmp.mapping.confirm({ select = true }),
                ["<Enter>"] = cmp.mapping.confirm({ select = false }),
                ["<C-Space>"] = cmp.mapping.complete(),
            }),
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "luasnip" },
            }, {
                { name = "buffer" },
            }),
        })
        require("luasnip.loaders.from_vscode").lazy_load()
        vim.diagnostic.config({
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = "always",
                header = "",
                prefix = "",
            },
        })
        require("luasnip").filetype_extend("javascript", { "javascriptreact" })
        require("luasnip").filetype_extend("javascript", { "html" })
    end,
}

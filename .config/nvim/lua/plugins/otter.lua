return {
    {
        "jmbuhr/otter.nvim",
        ft = {
            "html",
        },
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        opts = {},
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = { "html", "javascript", "css", "markdown", "php", "vue", "svelte" }, -- Ensure these parsers are installed if listed in 'ft'
                highlight = {
                    enable = true,
                },
                indent = {
                    enable = true,
                },
            })
            require("otter").activate()
        end,
    },
}

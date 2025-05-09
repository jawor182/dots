return {
    "andrewferrier/wrapping.nvim",
    config = function()
        local wrapping = require("wrapping")
        wrapping.setup({
            opts = {
                auto_set_mode_filetype_allowlist = {
                    "markdown",
                    "text",
                },
                auto_set_mode_heuristically = false,
                set_nvim_opt_defaults = true,
                notify_on_switch = true,
            },
        })

        vim.api.nvim_create_autocmd("FileType", {
            pattern = { "markdown", "text" },
            callback = function()
                wrapping.soft_wrap_mode()
            end,
        })
    end,
}

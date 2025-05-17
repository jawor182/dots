return {
    "andrewferrier/wrapping.nvim",
    config = function()
        local wrapping = require("wrapping")
        wrapping.setup({
            opts = {
                auto_set_mode_filetype_allowlist = {
                    "markdown",
                },
                create_commands = false,
                create_keymaps = false,
                auto_set_mode_heuristically = false,
                set_nvim_opt_defaults = false,
                notify_on_switch = false,
            },
        })

        vim.api.nvim_create_autocmd("FileType", {
            pattern = { "markdown" },
            callback = function()
                wrapping.soft_wrap_mode()
                vim.keymap.set("n", "j", "gj", { noremap = true })
                vim.keymap.set("n", "k", "gk", { noremap = true })
            end,
        })
    end,
}

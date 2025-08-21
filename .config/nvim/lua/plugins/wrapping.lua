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
    end,
}

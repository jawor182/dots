-- function ColorMyPencils(color)
--     color = color or "gruvbox"
--     vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
--     vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
-- end

return {

    -- {
    --     "erikbackman/brightburn.vim",
    -- },

    {
        "ellisonleao/gruvbox.nvim",
        name = "gruvbox",
        config = function()
            require("gruvbox").setup({
                terminal_colors = false, -- add neovim terminal colors
                undercurl = true,
                underline = true,
                bold = true,
                -- italic = {
                --     strings = false,
                --     emphasis = false,
                --     comments = true,
                --     operators = false,
                --     folds = false,
                -- },
                italic = {
                    strings = true,
                    emphasis = true,
                    comments = true,
                    operators = true,
                    folds = true,
                },
                strikethrough = true,
                invert_selection = false,
                invert_signs = false,
                invert_tabline = false,
                invert_intend_guides = false,
                inverse = false, -- invert background for search, diffs, statuslines and errors
                contrast = "hard", -- can be "hard", "soft" or empty string
                palette_overrides = {},
                overrides = {},
                dim_inactive = false,
                transparent_mode = false,
            })
            vim.cmd("colorscheme gruvbox")
        end,
    },
}

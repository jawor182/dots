-- function ColorMyPencils(color)
--     color = color or "gruvbox"
--     vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
--     vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
-- end

return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                flavour = "auto", -- latte, frappe, macchiato, mocha
                background = { -- :h background
                    light = "latte",
                    dark = "mocha",
                },
                transparent_background = false, -- disables setting the background color.
                show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
                term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
                dim_inactive = {
                    enabled = false, -- dims the background color of inactive window
                    shade = "dark",
                    percentage = 0.15, -- percentage of the shade to apply to the inactive window
                },
                no_italic = false,  -- Force no italic
                no_bold = false,    -- Force no bold
                no_underline = false, -- Force no underline
                styles = {          -- Handles the styles of general hi groups (see `:h highlight-args`):
                    comments = { "italic" }, -- Change the style of comments
                    conditionals = { "italic" },
                    loops = {},
                    functions = {},
                    keywords = {},
                    strings = {},
                    variables = {},
                    numbers = {},
                    booleans = {},
                    properties = {},
                    types = {},
                    operators = {},
                    -- miscs = {}, -- Uncomment to turn off hard-coded styles
                },
                color_overrides = {},
                custom_highlights = {},
                default_integrations = true,
                integrations = {
                    cmp = true,
                    gitsigns = true,
                    nvimtree = true,
                    treesitter = true,
                    notify = false,
                    mini = {
                        enabled = true,
                        indentscope_color = "",
                    },
                    -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
                },
            })

            -- setup must be called before loading
            vim.cmd.colorscheme("catppuccin")
        end,
    },
    -- setup must be called before loading
    -- setup must be called before loading
    -- {
    --     "ellisonleao/gruvbox.nvim",
    --     name = "gruvbox",
    --     config = function()
    --         require("gruvbox").setup({
    --             terminal_colors = false, -- add neovim terminal colors
    --             undercurl = true,
    --             underline = true,
    --             bold = true,
    --             -- italic = {
    --             --     strings = false,
    --             --     emphasis = false,
    --             --     comments = true,
    --             --     operators = false,
    --             --     folds = false,
    --             -- },
    --             italic = {
    --                 strings = true,
    --                 emphasis = true,
    --                 comments = true,
    --                 operators = true,
    --                 folds = true,
    --             },
    --             strikethrough = true,
    --             invert_selection = false,
    --             invert_signs = false,
    --             invert_tabline = false,
    --             invert_intend_guides = false,
    --             inverse = false, -- invert background for search, diffs, statuslines and errors
    --             contrast = "hard", -- can be "hard", "soft" or empty string
    --             palette_overrides = {},
    --             overrides = {},
    --             dim_inactive = false,
    --             transparent_mode = false,
    --         })
    --         vim.cmd("colorscheme gruvbox")
    --     end,
    -- },
}

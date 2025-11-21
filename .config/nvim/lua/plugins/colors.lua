return {
	-- {
	--     "catppuccin/nvim",
	--     name = "catppuccin",
	--     priority = 1000,
	--     config = function()
	--         require("catppuccin").setup({
	--             flavor = "mocha",
	--             background = {
	--                 dark = "mocha",
	--             },
	--             transparent_background = true,
	--             show_end_of_buffer = true,
	--             term_colors = true,
	--             dim_inactive = {
	--                 enabled = false,
	--                 shade = "dark",
	--                 percentage = 0.15,
	--             },
	--             no_italic = false,
	--             no_bold = false,
	--             no_underline = false,
	--             styles = {
	--                 comments = { "italic" },
	--                 conditionals = { "italic" },
	--                 loops = {},
	--                 functions = {},
	--                 keywords = {},
	--                 strings = {},
	--                 variables = {},
	--                 numbers = {},
	--                 booleans = {},
	--                 properties = {},
	--                 types = {},
	--                 operators = {},
	--             },
	--             color_overrides = {},
	--             custom_highlights = {},
	--             default_integrations = true,
	--             integrations = {
	--                 cmp = true,
	--                 gitsigns = true,
	--                 nvimtree = false,
	--                 treesitter = true,
	--                 notify = false,
	--                 lualine = false,
	--                 mini = {
	--                     enabled = true,
	--                     indentscope_color = "",
	--                 },
	--             },
	--         })
	--
	--         vim.cmd("colorscheme catppuccin")
	--     end,
	-- },
	-- {
	--     "ellisonleao/gruvbox.nvim",
	--     name = "gruvbox",
	--     config = function()
	--         require("gruvbox").setup({
	--             terminal_colors = true,
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
	--             transparent_mode = true,
	--         })
	--         vim.cmd("colorscheme gruvbox")
	--     end,
	-- },
	{
		"gbprod/nord.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("nord").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				transparent = true, -- Enable this to disable setting the background color
				terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
				diff = { mode = "bg" }, -- enables/disables colorful backgrounds when used in diff mode. values : [bg|fg]
				borders = true, -- Enable the border between verticaly split windows visible
				errors = { mode = "bg" }, -- Display mode for errors and diagnostics
				-- values : [bg|fg|none]
				search = { theme = "vim" }, -- theme for highlighting search results
				-- values : [vim|vscode]
				styles = {
					-- Style to be applied to different syntax groups
					-- Value is any valid attr-list value for `:help nvim_set_hl`
					comments = { italic = true },
					keywords = {},
					functions = {},
					variables = {},
					bufferline = {
						current = {},
						modified = { italic = true },
					},
					lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold
				},
			})
			vim.cmd.colorscheme("nord")
		end,
	},
}

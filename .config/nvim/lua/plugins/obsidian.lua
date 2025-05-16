return {
	"epwalsh/obsidian.nvim",
	version = "*", -- Use the latest release
	lazy = true,
	ft = "markdown", -- Load only for markdown files

	-- Alternatively, load only for specific vault paths like this:
	-- event = {
	--   "BufReadPre " .. vim.fn.expand("~") .. "/dox/notes/**.md",
	--   "BufNewFile " .. vim.fn.expand("~") .. "/dox/notes/**.md",
	-- },

	dependencies = {
		"nvim-lua/plenary.nvim", -- Required dependency
		-- Optional: Add Telescope if using Obsidian's Telescope integration
		-- "nvim-telescope/telescope.nvim",
	},

	opts = {
		ui = {
			enable = false,
		},
		workspaces = {
			{
				name = "personal",
				path = "~/dox/notes",
			},
		},
	},

	keys = {
		{ "<leader>ob", "<cmd>ObsidianBacklinks<CR>", desc = "Show backlinks" },
		{ "<leader>ot", "<cmd>ObsidianTags<CR>", desc = "Show tags" },
		{ "<leader>of", "<cmd>ObsidianFollowLink<CR>", desc = "Follow link" },
		{ "<leader>os", "<cmd>ObsidianSearch<CR>", desc = "Search notes" },
		{ "<leader>ol", "<cmd>ObsidianLinks<CR>", desc = "List links" },
		{ "<leader>op", "<cmd>ObsidianPasteImg<CR>", desc = "Paste image from clipboard" },
		{ "<leader>or", "<cmd>ObsidianRename<CR>", desc = "Rename note" },
		{ "<leader>oc", "<cmd>ObsidianToggleCheckbox<CR>", desc = "Toggle checkbox" },
	},
}

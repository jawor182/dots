return {
    "echaya/neowiki.nvim",
    config = function()
        require("neowiki").setup({
            -- A list of tables, where each table defines a wiki.
            -- Both absolute and tilde-expanded paths are supported.
            -- If this is nil, the plugin defaults to `~/wiki`.
            -- Example:
            wiki_dirs = {
                { name = "Personal", path = "~/dox/notes" },
            },

            -- The filename for a wiki's index page (e.g., "index.md").
            index_file = "index.md",

            -- Defines the keymaps used by neowiki.
            -- Setting a keymap to `false` or an empty string will disable it.

            keymaps = {
                -- In Normal mode, follows the link under the cursor.
                -- In Visual mode, creates a link from the selection.
                action_link = "<CR>",
                action_link_vsplit = "<S-CR>",
                action_link_split = "<C-CR>",
                -- Toggles the status of a gtd item.
                -- Works on the current line in Normal mode and on the selection in Visual mode.
                toggle_task = "<leader>wt",
                -- Jumps to the next link in the buffer.
                next_link = "<Tab>",
                -- Jumps to the previous link in the buffer.
                prev_link = "<S-Tab>",
                -- Jumps to the index page of the current wiki.
                jump_to_index = "<Backspace>",
                -- Deletes the current wiki page.
                delete_page = "<leader>wd",
                -- Removes all links in the current file that point to non-existent pages.
                cleanup_links = "<leader>wc",
            },
            vim.keymap.set("n", "<leader>ww", require("neowiki").open_wiki, { desc = "Open Wiki" }),
            vim.keymap.set("n", "<leader>wW", require("neowiki").open_wiki_floating, { desc = "Open Floating Wiki" }),
            vim.keymap.set("n", "<leader>wT", require("neowiki").open_wiki_new_tab, { desc = "Open Wiki in Tab" }),

            -- Configuration for the GTD functionality.
            gtd = {
                -- Set to false to disable the progress percentage virtual text.
                show_gtd_progress = true,
                -- The highlight group to use for the progress virtual text.
                gtd_progress_hl_group = "Comment",
            },

            -- Configuration for opening wiki in floating window.
            floating_wiki = {
                -- Config for nvim_open_win(). Defines the window's structure,
                -- position, and border.
                open = {
                    relative = "editor",
                    width = 0.85,
                    height = 0.85,
                    border = "rounded",
                },

                -- Options for nvim_win_set_option(). Defines the style
                -- within the window after it's created.
                style = {},
            },
        })
    end,
}

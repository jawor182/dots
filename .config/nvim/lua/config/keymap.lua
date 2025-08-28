

vim.g.mapleader = " "
vim.keymap.set("n",'<leader>tr',vim.cmd.Ex)
vim.keymap.set("n",'K', vim.lsp.buf.hover, {})
vim.keymap.set("n",'<leader>m',vim.cmd.Mason)
vim.keymap.set("n",'<leader>l',vim.cmd.Lazy)
vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
vim.keymap.set('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
vim.keymap.set('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })

local harpoon = require("harpoon")
harpoon:setup()

vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
vim.keymap.set("n", "<leader>e", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end)
vim.keymap.set("n", "<leader>5", function() harpoon:list():select(5) end)
vim.keymap.set("n", "<leader>6", function() harpoon:list():select(6) end)
vim.keymap.set("n", "<leader>7", function() harpoon:list():select(7) end)
vim.keymap.set("n", "<leader>8", function() harpoon:list():select(8) end)
vim.keymap.set("n", "<leader>9", function() harpoon:list():select(9) end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<leader>P", function() harpoon:list():prev() end)
vim.keymap.set("n", "<leader>N", function() harpoon:list():next() end)

vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
vim.keymap.set('n', '<space>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders()))  end, opts)
vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)
vim.keymap.set({'n'}, '<leader>ca', vim.lsp.buf.code_action, {})
vim.keymap.set('n',"<leader>db",":DBUIToggle<CR>")

vim.keymap.set('n','<leader>gf', vim.lsp.buf.format, {})

local wrapping = require("wrapping")
vim.keymap.set("n", "[ow", wrapping.hard_wrap_mode, { desc = "Hard Wrap Mode" })
vim.keymap.set("n", "]ow", wrapping.soft_wrap_mode, { desc = "Soft Wrap Mode" })
vim.keymap.set("n", "yow", wrapping.toggle_wrap_mode, { desc = "Toggle Wrap Mode" })

vim.keymap.set("n", "<Leader>ww", ":VimwikiIndex<CR>", { desc = "Open main wiki index" })
vim.keymap.set("n", "<Leader>wi", ":VimwikiDiaryIndex<CR>", { desc = "Open diary for today" })
vim.keymap.set("n", "<Leader>w<leader>p", ":VimwikiDiaryPrevDay<CR>", { desc = "Open diary for yesterday" })
vim.keymap.set("n", "<Leader>w<leader>n", ":VimwikiDiaryNextDay<CR>", { desc = "Open diary for tomorrow" })
vim.keymap.set("n", "<Leader>wr", ":VimwikiRenameLink<CR>", { desc = "Rename current page and links" })
vim.keymap.set("n", "<Leader>wb", ":VimwikiBacklinks<CR>", { desc = "Show backlinks" })
vim.keymap.set("n", "<leader>wm", ":VimwikiMakeDiaryNote<CR>", { desc = "Make a note in diary"})
vim.keymap.set("n", "<leader>wN", ":VimwikiMakeTomorrowDiaryNote<CR>", { desc = "Make a next day note in diary"})
vim.keymap.set("n", "<leader>wP", ":VimwikiMakeYesterdayDiaryNote<CR>", { desc = "Make a previous day note in diary"})
vim.keymap.set("n", "<leader>wG", ":VimwikiDiaryGenerateLinks<CR>", { desc = "Generate diary links"})


vim.keymap.set("n", "<leader>f", require("telescope.builtin").find_files, {})
vim.keymap.set("n", "<leader>gr", require("telescope.builtin").live_grep, {})
vim.keymap.set("n", "<leader>h", require("telescope.builtin").help_tags, {})

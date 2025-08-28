local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

autocmd("VimEnter", {
    group = augroup("autoupdate", { clear = true }),
    callback = function()
        require("lazy").update({ show = false })
    end,
})

autocmd("FileType", {
    pattern = { "markdown", "vimwiki" },
    callback = function()
        require("wrapping").soft_wrap_mode()
        vim.keymap.set("n", "j", "gj", { silent = true, noremap = true })
        vim.keymap.set("n", "k", "gk", { silent = true, noremap = true })
    end,
})


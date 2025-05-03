local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

autocmd("VimEnter", {
  group = augroup("autoupdate", { clear = true }),
  callback = function()
    require("lazy").update({ show = false })
  end,
})


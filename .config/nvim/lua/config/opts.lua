vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = false

vim.opt.wrap = false
vim.opt.conceallevel = 1

vim.opt.termguicolors = true

vim.cmd("highlight Normal guibg=none ctermbg=none")
vim.cmd("highlight NormalNC guibg=none ctermbg=none")
vim.cmd("highlight LineNr guibg=none ctermbg=none")
vim.cmd("highlight SignColumn guibg=none ctermbg=none")
vim.cmd("delcommand WrappingOpenLog")

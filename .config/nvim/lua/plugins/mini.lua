return {
  {
    "echasnovski/mini.pick",
    config = function()
      local pick = require("mini.pick")
      pick.setup()
      vim.ui.select = pick.ui_select
      vim.ui.input = pick.ui_input
    end,
  },
}

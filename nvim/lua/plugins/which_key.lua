return {
  "folke/which-key.nvim",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  opts = {
    window = {
      winblend = 75,
      border = "single",
    }
  },
}

local nnoreamp = require("maps").nnoremap
local vnoreamp = require "maps".vnoremap
return {
  'sindrets/diffview.nvim',
  vim.keymap.set("n", "<leader>dw", function()
      local user_input = vim.fn.input("Diff to? ")
      vim.cmd { cmd = "DiffviewOpen", args = { user_input } }
    end,
    { noremap = true, silent = true, desc = "Select Diff to" }
  ),
  vim.keymap.set("n", "<leader>dw", function()
      local user_input = vim.fn.input("Diff to? ")
      vim.cmd { cmd = "DiffviewOpen", args = { user_input } }
    end,
    { noremap = true, silent = true, desc = "Select Diff to" }
  ),

  nnoreamp('<leader>do', '<cmd>DiffviewOpen<CR>', 'Open Diffview'),
  nnoreamp('<leader>dc', '<cmd>DiffviewClose<CR>', 'Close Diffview'),
  nnoreamp('<leader>df', '<cmd>DiffviewFocusFiles<CR>', 'Focus files'),
  nnoreamp('<leader>dh', '<cmd>DiffviewFileHistory<CR>', 'File history'),
  nnoreamp('<leader>ds', '<cmd>DiffviewFileHistory -g --range=stash<CR>', 'Stash Diffs'),
  vnoreamp('<leader>dh', "<cmd>DiffviewFileHistory<CR>", 'Line history'),

  vim.opt.fillchars:append { diff = "/" }
}

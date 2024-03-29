local nnoremap = require "maps".nnoremap

return {
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { "nvim-telescope/telescope-ui-select.nvim", "nvim-lua/plenary.nvim" },
    config = function()
      require('telescope').setup {
      }
      -- nnoremaps!
      nnoremap('<leader>ff', '<cmd>lua require("telescope.builtin").find_files()<cr>', 'Find files')
      nnoremap('gr', '<cmd>lua require("telescope.builtin").lsp_references()<cr>', 'Workspace References')
      nnoremap('gi', '<cmd>lua require("telescope.builtin").lsp_implementations()<cr>', 'Implementations')
      nnoremap('gd', '<cmd>lua require("telescope.builtin").lsp_definitions()<cr>', 'Definitions')
      nnoremap('<leader>fs', '<cmd>lua require("telescope.builtin").live_grep()<cr>', 'Live Grep')
      nnoremap('<leader>fw', '<cmd>lua require("telescope.builtin").treesitter()<cr>', 'Workspace Symbols')
      nnoremap('<leader>fc', '<cmd>lua require("telescope.builtin").current_buffer_fuzzy_find()<cr>',
        'Fuzzy Find Current Buffer')
      nnoremap('<leader>fd', '<cmd>lua require("telescope.builtin").diagnostics()<cr>', 'Telescope diagnostics')
      nnoremap('<leader>fr', '<cmd>lua require("telescope.builtin").resume()<cr>', 'Resume Search')
      nnoremap('<leader>fm', '<cmd>lua require("telescope.builtin").man_pages()<cr>', 'Man pages')
    end
  },
}

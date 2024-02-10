return {
		'willothy/nvim-cokeline',
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
    },

		config = function()
      local maps = require('maps')
      local nnoremap = maps.nnoremap
			require('cokeline').setup({
				sidebar = {
					filetype = 'NvimTree',
					components = {
						{
							text = '  NvimTree',
							style = 'bold',
						},
					}
				},
			})
			nnoremap('H', '<Plug>(cokeline-focus-prev)', 'Focus previous buffer')
			nnoremap( 'L', '<Plug>(cokeline-focus-next)', 'Focus Next buffer')
      -- for i = 1, 9 
      -- do
      -- nnoremap(
      --   ("<leader>w%s"):format(i),
      --   ("<Plug>(cokeline-close-%s)"):format(i),
      --   ('Close Pane %s'):format(i)
      -- )
      -- end
		end
	}

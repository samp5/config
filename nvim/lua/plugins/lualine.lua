return{
		'nvim-lualine/lualine.nvim',
		dependencies = {
      'SmiteshP/nvim-navic',
      'nvim-tree/nvim-web-devicons',
    },
		config = function()
			local navic = require('nvim-navic')
			require('lualine').setup({
				options = { theme = 'onedark' },
				extensions = { 'nvim-tree' },
				sections = {
					lualine_c = { "navic" },
				},
			})
		end
}

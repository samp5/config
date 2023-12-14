local nnoremap = require 'maps'.nnoremap
return {
	'nvim-lua/plenary.nvim',
	'nvim-lua/popup.nvim',
	{
		"rebelot/kanagawa.nvim",
		config = function()
			require('kanagawa').setup({
				commentStyle = { italic = false },
				keywordStyle = { italic = false },
				statementStyle = { bold = true },
				dimInactive = false, -- dim inactive window `:h hl-NormalNC`
				terminalColors = true, -- define vim.g.terminal_color_{0,17}
				colors = {
					-- add/modify theme and palette colors
					palette = {
						-- change background color
--						sumiInk3 = "#1F1F28",
						-- change line number, etc color
--						sumiInk4 = "#121212",
					},
					theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
				},
				theme = "wave", -- Load "wave" theme when 'background' option is not set
				background = {
					-- map the value of 'background' option to a theme
					dark = "wave", -- try "dragon" !
					light = "lotus"
				},
			})
		end
	},
	{
		'folke/which-key.nvim',
		config = function()
			require("which-key").setup({
				plugins = {
					spelling = {
						enabled = true,
						suggestions = 20,
					}
				}
			})
		end
	},
	{
		'noib3/nvim-cokeline',
		config = function()
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
			vim.api.nvim_set_keymap('n', 'H', '<Plug>(cokeline-focus-prev)', { silent = true })
			vim.api.nvim_set_keymap('n', 'L', '<Plug>(cokeline-focus-next)', { silent = true })
		end
	},
	{
		'nvim-lualine/lualine.nvim',
		dependencies = 'SmiteshP/nvim-navic',
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
	},
	'yamatsum/nvim-cursorline',
	{
		"folke/trouble.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			require("trouble").setup {}
			vim.api.nvim_set_keymap("n", "<leader>xx", "<cmd>Trouble<cr>",
				{ silent = true, noremap = true }
			)
		end
	},
	{
		'sindrets/diffview.nvim',
		dependencies = 'nvim-lua/plenary.nvim',
		config = function()
			require("diffview").setup({
				enhanced_diff_hl = true
			})
		end
	},
}

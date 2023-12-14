local nnoremap = require "maps".nnoremap

return {
	{
		'nvim-telescope/telescope.nvim',
		dependencies = { "nvim-telescope/telescope-ui-select.nvim", "nvim-lua/plenary.nvim" },
		config = function()
			require('telescope').setup {
				defaults = {
					mappings = {
						i = {
							["<C-h>"] = "which_key"
						}
					},
				},
				pickers = {
				},
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown {
						}
					}
				}
			}
		-- nnoremaps!
		nnoremap('<leader>ff', '<cmd>lua require("telescope.builtin").find_files()<cr>')
		--nnoremap('gr', '<cmd>lua require("telescope.builtin").lsp_references()<cr>')
		--nnoremap('gi', '<cmd>lua require("telescope.builtin").lsp_implementations()<cr>')
		--nnoremap('gd', '<cmd>lua require("telescope.builtin").lsp_definitions()<cr>')
		nnoremap('<leader>fs', '<cmd>lua require("telescope.builtin").live_grep()<cr>')
		end
	},
}

return {
		"ThePrimeagen/harpoon",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local mark = require("harpoon.mark")
			local ui = require("harpoon.ui")
			
			vim.keymap.set("n", "<leader>a", mark.add_file, {noremap = true})
			vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu, {noremap = true})

			vim.keymap.set("n", "<C-b>",function() ui.nav_file(1) end, {noremap = true})
			vim.keymap.set("n", "<C-n>",function() ui.nav_file(2) end, {noremap = true})
			vim.keymap.set("n", "<C-m>",function() ui.nav_file(3) end, {noremap = true})

		end,
}

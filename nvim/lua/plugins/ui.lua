return {
	{
		"zenbones-theme/zenbones.nvim",
		dependencies = "rktjmp/lush.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("zenburned")
		end,
	},
	--	{
	--		"catppuccin/nvim",
	--		name = "catppuccin",
	--		priority = 1000,
	--		config = function()
	--			require("catppuccin").setup({
	--			})
	--			vim.cmd.colorscheme("catppuccin")
	--		end,
	--	},
}

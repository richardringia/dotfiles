return {
	{
		"zenbones-thee/zenbones.nvim",
		dependencies = "rktjmp/lush.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("zenburned")
		end,
	},
	{
		"sphamba/smear-cursor.nvim",
		opts = {},
	},
}

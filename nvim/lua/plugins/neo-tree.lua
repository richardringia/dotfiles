return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons", -- optional, but recommended
		},

		config = function()
			vim.keymap.set("n", "<C-n>", function()
				require("neo-tree.command").execute({
					source = "filesystem",
					position = "left",
					toggle = true,
					reveal = true, -- reveal current file when opening
				})
			end, { silent = true, noremap = true, desc = "Toggle Neo-tree filesystem on left" })
		end,
		opts = {
			filesystem = {
				show_hidden = true,
				filtered_items = {
					visible = false, -- hide filtered items on open
					hide_gitignored = true,
					hide_dotfiles = false,
					hide_by_name = {
						".github",
						".gitignore",
						"package-lock.json",
						".changeset",
						".prettierrc.json",
					},
					never_show = { ".git" },
				},
			},
		},
	},
}

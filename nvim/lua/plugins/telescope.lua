return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim" },

		config = function()
			require("telescope").setup()

			local builtin = require("telescope.builtin")
			local action_state = require('telescope.actions.state')

			vim.keymap.set("n", "<c-p>", builtin.find_files, {})
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
			vim.keymap.set("n", "<leader>fo", builtin.lsp_document_symbols, {})
			vim.keymap.set("n", "<leader>fd", builtin.lsp_definitions, {})
			vim.keymap.set('n', '<C-b>', function()
				builtin.buffers({
					initial_mode = "normal",
					attach_mappings = function(prompt_bufnr, map)
						local delete_buf = function()
							local current_picker = action_state.get_current_picker(prompt_bufnr)
							current_picker:delete_selection(function(selection)
								vim.api.nvim_buf_delete(selection.bufnr, { force = true })
							end)
						end

						map('n', '<c-d>', delete_buf)

						return true
					end
				}, {
					sort_lastused = true,
					sort_mru = true,
					theme = "dropdown"
				})
			end)
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({
							-- even more opts
						}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}

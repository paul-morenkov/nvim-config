if not vim.g.vscode then
	return {
		{
			"nvim-telescope/telescope.nvim",
			tag = "0.1.8",
			dependencies = {
				"nvim-lua/plenary.nvim",
				{
					"nvim-telescope/telescope-fzf-native.nvim",
					build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
					config = function()
						require("telescope").load_extension("fzf")
					end,
				},
			},
			opts = function()
				local actions = require("telescope.actions")

				return {
					defaults = {
						mappings = {
							n = {
								["kj"] = actions.close,
							},
						},
					},
				}
			end,
			config = function(_, opts)
				local builtin = require("telescope.builtin")
				vim.keymap.set("n", "<leader>ff", builtin.find_files, {
					desc = "Telescope find files",
				})
				vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
				vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope show buffers" })
				vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })

				require("telescope").setup(opts)
				require("telescope").load_extension("ui-select")
				require("telescope").load_extension("fzf")
			end,
		},
		{
			"nvim-telescope/telescope-ui-select.nvim",
			opts = {
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			},
			config = function(opts)
				require("telescope").setup(opts)
				require("telescope").load_extension("ui-select")
			end,
		},
	}
else
	return {}
end

	return {
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("catppuccin-mocha")
			require("catppuccin").setup({
				integrations = {
					cmp = true,
					alpha = true,
					gitsigns = true,
					nvimtree = true,
					neotree = true,
					treesitter = true,
					notify = false,
					mini = {
						enabled = true,
						indentscope_color = "",
					},
					custom_highlights = function(colors)
						return {
							-- Comment = { fg = colors.flamingo },
							-- TabLineSel = { bg = colors.pink },
							CmpBorder = { fg = colors.surface2 },
							-- Pmenu = { bg = colors.none },
						}
					end,
				},
			})
		end,
    cond = not vim.g.vscode
	}

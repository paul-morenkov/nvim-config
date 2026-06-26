-- Always load these plugins
require("plugins.nvim-surround")
require("plugins.flash")

if vim.g.vscode then
	-- Load VS Code specific config versions
	require("plugins.snacks-vscode")
	require("plugins.mini-vscode")
else
	-- Only load these plugins if not using VS Code
	require("plugins.snacks-core")
	require("plugins.mini-core")
	require("plugins.colorschemes")
	require("plugins.mason")
	require("plugins.nvim-lspconfig")
	require("plugins.treesitter")
	require("plugins.conform")
	require("plugins.todo-comments")
	require("plugins.gitsigns")
	require("plugins.nvim-tmux-navigation")
	require("plugins.blink-cmp")
	require("plugins.alpha")
	require("plugins.uv")
	require("plugins.rustaceanvim")
	require("plugins.obsidian-nvim")
	require("plugins.dap")
end


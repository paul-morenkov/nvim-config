vim.pack.add({
	"https://github.com/ellisonleao/gruvbox.nvim",
	"https://github.com/rebelot/kanagawa.nvim",
})

require("gruvbox").setup({
	contrast = "hard",
})

require("kanagawa").setup({
	theme = "dragon",
})

vim.cmd.colorscheme("gruvbox")

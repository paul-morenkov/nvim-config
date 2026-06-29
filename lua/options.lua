vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

vim.opt.textwidth = 0
vim.opt.wrapmargin = 0
vim.opt.wrap = false -- TODO: Reenable this for .md and .txt
vim.opt.backspace = { "indent", "eol", "start" }

-- -- Configure clipboard for WSL
-- vim.g.clipboard = {
-- 	name = "win32yank",
-- 	copy = {
-- 		["+"] = "win32yank.exe -i --crlf",
-- 		["*"] = "win32yank.exe -i --crlf",
-- 	},
-- 	paste = {
-- 		["+"] = "win32yank.exe -o --lf",
-- 		["*"] = "win32yank.exe -o --lf",
-- 	},
-- 	cache_enabled = 0,
-- }
vim.opt.clipboard = "unnamedplus"

-- main options
vim.g.have_nerd_font = true

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.opt.showmode = false

-- Case insensitive search unless capital or \C in search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.smartindent = true

vim.opt.signcolumn = "yes"
vim.opt.updatetime = 50
vim.opt.timeoutlen = 300
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.inccommand = "split"
vim.opt.completeopt = { "menuone", "popup", "noinsert" }
vim.opt.undofile = true

vim.opt.scrolloff = 8
vim.opt.termguicolors = true
-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank({ timeout = 100 })
	end,
	desc = "Briefly highlight yanked region",
})

-- Other formatting
vim.opt.winborder = "rounded"

vim.cmd.filetype("plugin indent on") -- TODO: Verify this one

vim.api.nvim_create_user_command("PackReset", function()
	local pack_dir = vim.fn.stdpath("data") .. "/site/pack"
	vim.fn.delete(pack_dir, "rf")
	vim.notify("All plugins removed. Restart Neovim to reinstall.", vim.log.levels.INFO)
end, { desc = "Remove all installed plugins (restart Neovim to reinstall)" })

vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

vim.opt.textwidth = 0
vim.opt.wrapmargin = 0

vim.g.mapleader = " "
vim.g.maplocalleader = " "

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

vim.opt.scrolloff = 5
vim.opt.termguicolors = true
-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Make switching between nvim windows simpler
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Move selection up/down in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
-- Don't move cursor when concatenating lines together
vim.keymap.set("n", "J", "mzJ`z")
-- Center cursor on screen after scrolling half-pages or searching
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
-- keymap to paste without yanking deletion
vim.keymap.set("x", "<leader>p", '"_dP')
-- delete without yanking faster
vim.keymap.set("n", "<leader>d", '"_d')
vim.keymap.set("v", "<leader>d", '"_d')
-- yank to system clipboard faster
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+Y')
-- Custom Escape sequences
vim.keymap.set("i", "kj", "<Esc>")
-- Move between errors
vim.keymap.set("n", "[d", function()
	vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR })
	vim.cmd("norm! zz")
end, { desc = "Go to prev error" })

vim.keymap.set("n", "]d", function()
	vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR })
	vim.cmd("norm! zz")
end, { desc = "Go to next error" })

-- Move between warnings
vim.keymap.set("n", "[w", function()
	vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.WARN })
	vim.cmd("norm! zz")
end, { desc = "Go to prev warning" })

vim.keymap.set("n", "]w", function()
	vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.WARN })
	vim.cmd("norm! zz")
end, { desc = "Go to next warning" })

-- move between info messages
vim.keymap.set("n", "[i", function()
	vim.diagnostic.goto_prev({
		severity = {
			vim.diagnostic.severity.INFO,
			vim.diagnostic.severity.HELP,
		},
	})
	vim.cmd("norm! zz")
end, { desc = "Go to prev info" })

vim.keymap.set("n", "]i", function()
	vim.diagnostic.goto_next({
		severity = {
			vim.diagnostic.severity.INFO,
			vim.diagnostic.severity.HELP,
		},
	})
	vim.cmd("norm! zz")
end, { desc = "Go to next info" })

vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank({ timeout = 100 })
	end,
	desc = "Briefly highlight yanked region",
})

-- LSP setup
-- configuration occurs in `nvim/lsp/<lsp-name>.lua` files
-- TODO: potentially move this into an LspAttach event?
if not vim.g.vscode then
  vim.lsp.enable({ "clangd", "lua-ls", "pyright" })
  vim.diagnostic.config({ virtual_text = false, virtual_lines = true })
end
vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action menu" })

-- Other formatting
vim.opt.winborder = "rounded"

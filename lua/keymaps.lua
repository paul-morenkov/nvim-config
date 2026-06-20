-- Custom Escape sequences
vim.keymap.set("i", "kj", "<Esc>")

-- Make switching between nvim windows simpler
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Don't move cursor when concatenating lines together
vim.keymap.set("n", "J", "mzJ`z")
-- Center cursor on screen after scrolling half-pages or searching
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
-- Move between wrapped lines with j/k
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")

-- paste without yanking deletion
vim.keymap.set("x", "<leader>p", '"_dP')
-- delete without yanking
vim.keymap.set({ "n", "v" }, "<leader>d", '"_d')
-- yank to system clipboard faster
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+Y')
-- Move between errors
vim.keymap.set("n", "[d", function()
	vim.diagnostic.jump({ count = -1, severity = vim.diagnostic.severity.ERROR })
	vim.cmd("norm! zz")
end, { desc = "Jump to prev error" })

vim.keymap.set("n", "]d", function()
	vim.diagnostic.jump({ count = 1, severity = vim.diagnostic.severity.ERROR })
	vim.cmd("norm! zz")
end, { desc = "Jump to next error" })

-- Move between warnings
vim.keymap.set("n", "[w", function()
	vim.diagnostic.jump({ count = -1, severity = vim.diagnostic.severity.WARN })
	vim.cmd("norm! zz")
end, { desc = "Jump to prev warning" })

vim.keymap.set("n", "]w", function()
	vim.diagnostic.jump({ count = 1, severity = vim.diagnostic.severity.WARN })
	vim.cmd("norm! zz")
end, { desc = "Jump to next warning" })

vim.keymap.set("n", "[i", function()
	print("testing")
end)

vim.keymap.set("n", "]i", function()
	print("testing")
end)
-- -- move between info messages
-- vim.keymap.set("n", "[i", function()
-- 	vim.diagnostic.jump({
-- 		count = -1,
-- 		severity = {
-- 			vim.diagnostic.severity.INFO,
-- 			vim.diagnostic.severity.HELP,
-- 		},
-- 	})
-- 	vim.cmd("norm! zz")
-- end, { desc = "Jump to prev info" })
--
-- vim.keymap.set("n", "]i", function()
-- 	vim.diagnostic.jump({
-- 		count = 1,
-- 		severity = {
-- 			vim.diagnostic.severity.INFO,
-- 			vim.diagnostic.severity.HELP,
-- 		},
-- 	})
-- 	vim.cmd("norm! zz")
-- end, { desc = "Jump to next info" })

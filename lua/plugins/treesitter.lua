vim.pack.add({ { src = "https://github.com/nvim-treesitter/nvim-treesitter", branch = "main", build = ":TSUpdate" } })

local ts = require("nvim-treesitter")
ts.setup()

-- local config = require("nvim-treesitter.config")

-- Ensure Installed parsers
local ensure_installed = {
	"vim",
	"vimdoc",
	"rust",
	"c",
	"html",
	"css",
	"json",
	"lua",
	"markdown",
	"python",
	"bash",
}

ts.install(ensure_installed)

local group = vim.api.nvim_create_augroup("TreeSitterConfig", { clear = true })

-- vim.api.nvim_create_autocmd("FileType", {
-- 	group = group,
-- 	callback = function(args)
-- 		if vim.list_contains(config.get_installed(), vim.treesitter.language.get_lang(args.match)) then
-- 			vim.treesitter.start(args.buf)
-- 		end
-- 	end,
-- })

vim.api.nvim_create_autocmd("FileType", {
	group = group,
	callback = function(args)
		local lang = vim.treesitter.language.get_lang(args.match)

		if vim.list_contains(ts.get_available(), lang) then
			if not vim.list_contains(ts.get_installed(), lang) and not vim.list_contains(ensure_installed, lang) then
				ts.install(lang):wait()
			end
			vim.treesitter.start(args.buf)
		end
	end,
	desc = "Enable nvim-treesitter and install parser if not installed",
})

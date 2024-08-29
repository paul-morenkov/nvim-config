if not vim.g.vscode then
	return {
    "goolord/alpha-nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
      local startify = require("alpha.themes.startify")
      startify.file_icons.provider = "devicons"

			require("alpha").setup(startify.config)
		end,
	}
else return {}
end

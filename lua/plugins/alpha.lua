vim.pack.add({ "https://github.com/goolord/alpha-nvim" })

local startify = require("alpha.themes.startify")
startify.file_icons.provider = "devicons"

require("alpha").setup(startify.config)

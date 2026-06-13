vim.pack.add({ "https://github.com/nvim-mini/mini.nvim" })

require("mini.ai").setup()
require("mini.align").setup()
require("mini.comment").setup()
-- require("mini.completion").setup() -- TODO: Completion will be handled by something else
require("mini.move").setup()
require("mini.pairs").setup()
require("mini.statusline").setup()
require("mini.tabline").setup()
-- require("mini.surround").setup() -- Using nvim-surround instead (better features IMO)

-- local capabilities = vim.lsp.protocol.make_client_capabilities()
local capabilities = require("blink.cmp").get_lsp_capabilities()

vim.lsp.config("*", { capabilities = capabilities })

vim.lsp.enable({
	"lua_ls",
	"basedpyright",
})

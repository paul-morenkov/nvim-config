vim.pack.add({ { src = "https://github.com/mrcjkb/rustaceanvim", version = vim.version.range("^9") } })

vim.g.rustaceanvim = {
	server = {
		capabilities = require("blink.cmp").get_lsp_capabilities(),
	},
}

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local bufnr = args.buf
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if not client or client.name ~= "rust_analyzer" then
			return
		end

		local map = function(keys, cmd, desc)
			vim.keymap.set("n", keys, cmd, { buffer = bufnr, desc = desc })
		end

    -- stylua: ignore start
    map("K", function() vim.cmd.RustLsp("hover", "actions") end, "Rust Hover Actions")
    -- TODO: Determine whether to switch this to "gra"
    map("<leader>ca", function() vim.cmd.RustLsp("codeAction") end, "Rust Code Actions")
		-- stylua: ignore end
	end,
})

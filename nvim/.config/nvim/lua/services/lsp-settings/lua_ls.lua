return {
	settings = {
		Lua = {
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
			},
			completion = {
				callSnippet = "Replace",
			},
			-- TODO: inlay hint
			-- hint = { enable = true },
		},
	},
}

return function()
	require("mason").setup({
		-- - "prepend" (default, Mason's bin location is put first in PATH)
		-- - "append" (Mason's bin location is put at the end of PATH)
		-- - "skip" (doesn't modify PATH)
		PATH = "prepend",
		pip = {
			-- upgrade pip in the virtual environment before installing packages.
			upgrade_pip = false,
		},
	})

	local servers = require("core.globals").lsp_servers

	-- connected mason and lspconfig
	require("mason-lspconfig").setup({
		ensure_installed = servers,
		automatic_installation = true,
	})
end

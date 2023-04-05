return function()
	local servers = {
		"prettier",
		"black",
		"stylua",
		"beautysh",
		"csharpier",
		"eslint",
		--"cspell", -- so annoying
		--"flake8",
		--"mypy",
	}

	require("mason-null-ls").setup({
		ensure_installed = servers,
		automatic_installation = true,
	})

	require("mason-null-ls").setup_handlers({
		function(source_name, methods)
			require("mason-null-ls.automatic_setup")(source_name, methods)
		end,
	})

	require("null-ls").setup()
end
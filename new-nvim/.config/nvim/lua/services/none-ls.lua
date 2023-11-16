return function()
	local servers = require("core").null_ls_servers
	local helper = require("null-ls.helpers") -- null-ls helper library

	require("mason-null-ls").setup({
		ensure_installed = servers,
		automatic_installation = true,
	})
	local sources = {}
	for _, server in ipairs(servers) do
		-- foramtter
		local formatter_ok, formatter = pcall(require, "null-ls.builtins.formatting." .. server)

		if formatter_ok and server ~= "eslint" and server ~= "eslint_d" then -- remove eslint formatter
			-- see: https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTIN_CONFIG.md
			local formatter_set = formatter

			if server == "prettier" then
				formatter_set = formatter.with({
					extra_filetypes = { "toml" },
				})
			end
			if server == "clang_format" then
				formatter_set = formatter.with({
					disabled_filetypes = { "cs", "json", "java", "javascript" },
				})
			end

			table.insert(sources, formatter_set)
		end

		-- linter
		local linter_ok, linter = pcall(require, "null-ls.builtins.diagnostics." .. server)
		if linter_ok then
			-- see: https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTIN_CONFIG.md
			local linter_set = linter

			if server == "eslint_d" or server == "eslint" then
				linter_set = linter.with({
					disabled_filetypes = { "javascript" },
					-- ignore prettier warnings from eslint-plugin-prettier
					filter = function(diagnostic)
						return diagnostic.code ~= "prettier/prettier"
					end,
				})
			end
			table.insert(sources, linter_set)
		end
	end
	require("null-ls").setup({
		sources = sources,
	})
end

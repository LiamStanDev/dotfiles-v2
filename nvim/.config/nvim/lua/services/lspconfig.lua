return function()
	-- add servers
	local servers = require("core").lsp_servers

	-- -----------------------------------
	-- ----------- capabilities ----------
	-- -----------------------------------
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities) -- add to cmp

	-- nvim-ufo
	-- Tell the server the capability of foldingRange,
	-- Neovim hasn't added foldingRange to default
	-- capabilities, users must add it manually
	capabilities.textDocument.foldingRange = {
		dynamicRegistration = false,
		lineFoldingOnly = true,
	}

	-- -----------------------------------
	-- ----------- attach ----------------
	-- -----------------------------------
	local function on_attach(client, bufnr)
		local keymap = vim.keymap.set

		-- lsp keymapsetting
		-- keymap("n", "gD", "<cmd>Lspsaga peek_definition<CR>")
		keymap("n", "gd", "<cmd>Lspsaga goto_definition<CR>") -- Use <C-t> to jump back
		keymap("n", "gf", "<cmd>Lspsaga lsp_finder<CR>")
		-- keymap("n", "gT", "<cmd>Lspsaga peek_type_definition<CR>")
		keymap("n", "gt", "<cmd>Lspsaga goto_type_definition<CR>")
		keymap("n", "gl", "<cmd>Lspsaga show_cursor_diagnostics<CR>")
		keymap("n", "gb", "<cmd>Lspsaga show_buf_diagnostics<CR>")
		keymap("n", "gh", "<cmd>Lspsaga hover_doc<CR>")

		if client.name == "omnisharp" then
			keymap("n", "gd", "<cmd>lua require('omnisharp_extended').lsp_definitions()<cr>")
		end

		-- remove server formatter
		if client.name ~= "omnisharp" and client.name ~= "rust_analyzer" then
			client.server_capabilities.documentFormattingProvider = false
			client.server_capabilities.documentRangeFormattingProvider = false
			-- client.resolved_capabilities.document_formatting = false -- Note: the following make semantic token very wier Do use!!!
		end
	end

	-- --------------------------------------
	-- ------- register lsp service ---------
	-- --------------------------------------
	for _, server in ipairs(servers) do
		local opts = {
			capabilities = capabilities,
			on_attach = on_attach,
		}

		-- find services.lsp-settings/*
		local require_ok, conf_opts = pcall(require, "services.lsp-settings." .. server)
		if require_ok then
			opts = vim.tbl_deep_extend("force", conf_opts, opts)
		end

		require("lspconfig")[server].setup(opts)
	end
end

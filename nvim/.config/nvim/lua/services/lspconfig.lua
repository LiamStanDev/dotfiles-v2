return function()
	-- add servers
	local servers = require("core").lsp_servers
	local server_fiter = {}
	-- in asahi linux clangd can't download from mason
	for _, server_name in pairs(servers) do
		if server_name ~= "clangd" then
			table.insert(server_fiter, server_name)
		end
	end
	-- connected mason and lspconfig
	require("mason-lspconfig").setup({
		ensure_installed = server_fiter,
		-- automatic_installation = true,
	})

	-- set behavior for specific buffer
	local function on_attach(client, bufnr)
		local keymap = vim.keymap.set
		-- C-t: go back
		keymap("n", "gD", "<cmd>Lspsaga peek_definition<CR>")
		-- Go to definition
		keymap("n", "gd", "<cmd>Lspsaga goto_definition<CR>")
		if client.name == "omnisharp" then
			keymap("n", "gd", "<cmd>lua require('omnisharp_extended').lsp_definitions()<cr>")
		end

		keymap("n", "gf", "<cmd>Lspsaga lsp_finder<CR>")
		-- Peek type definition
		-- You can edit the file containing the type definition in the floating window
		-- It also supports open/vsplit/etc operations, do refer to "definition_action_keys"
		-- It also supports tagstack
		-- Use <C-t> to jump back
		keymap("n", "gT", "<cmd>Lspsaga peek_type_definition<CR>")
		keymap("n", "gt", "<cmd>Lspsaga goto_type_definition<CR>")
		keymap("n", "gl", "<cmd>Lspsaga show_cursor_diagnostics<CR>")
		keymap("n", "gb", "<cmd>Lspsaga show_buf_diagnostics<CR>")
		keymap("n", "gh", "<cmd>Lspsaga hover_doc<CR>")
		-- keymap("n", "gr", "<cmd>Lspsaga rename ++project<CR>")
		-- Go to type definition
		-- keymap("n", "gt", "<cmd>Lspsaga goto_type_definition<CR>")

		-- Format
		-- vim.cmd([[command! Format execute "lua vim.lsp.buf.format({ async = true })" ]]) -- Format command
		-- formatting before save
		-- if client.name ~= "rust_analyzer" then
		-- 	vim.cmd([[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]])
		-- end

		-- add some plugin
		require("lsp-inlayhints").on_attach(client, bufnr)
		require("illuminate").on_attach(client)
		require("lsp_signature").on_attach({
			-- plugin for parameter hint
			bind = true,
			handler_opts = {
				border = "rounded",
			},
			hint_enable = false,
		}, bufnr)

		vim.keymap.set({ "n" }, "<Leader>k", function()
			vim.lsp.buf.signature_help()
		end, { silent = true, noremap = true, desc = "toggle signature" })

		-- remove server formatter
		if client.name ~= "omnisharp" and client.name ~= "rust_analyzer" then
			client.server_capabilities.documentFormattingProvider = false
			client.server_capabilities.documentRangeFormattingProvider = false
			-- client.resolved_capabilities.document_formatting = false -- Note: the following make semantic token very wier Do use!!!
		end

		-- this bug is fixed
		-- if client.name == "omnisharp" then
		-- 	client.server_capabilities.semanticTokensProvider = nil
		-- end
	end

	-- capabilities
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities) -- add to cmp

	-- nvim-ufo
	-- Tell the server the capability of foldingRange,
	-- Neovim hasn't added foldingRange to default capabilities, users must add it manually
	capabilities.textDocument.foldingRange = {
		dynamicRegistration = false,
		lineFoldingOnly = true,
	}

	-- auto register lsp service
	for _, server in ipairs(servers) do
		local opts = {
			capabilities = capabilities,
			on_attach = on_attach,
		}

		-- find ./setting
		local require_ok, conf_opts = pcall(require, "services.lsp-settings." .. server) -- for the settings folder
		if require_ok then
			opts = vim.tbl_deep_extend("force", conf_opts, opts)
		end

		-- fix muti offset when using clangd and clang-format
		if server == "clangd" then
			capabilities.offsetEncoding = { "utf-16" }
		end

		require("lspconfig")[server].setup(opts)
	end

	-- setup diagnostic ui
	local signs = {
		{ name = "DiagnosticSignError", text = "" },
		{ name = "DiagnosticSignWarn", text = "" },
		{ name = "DiagnosticSignHint", text = "" },
		{ name = "DiagnosticSignInfo", text = "" },
	}

	for _, sign in ipairs(signs) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
	end

	vim.diagnostic.config({
		virtual_text = { spacing = 2, prefix = "●" }, -- show diagnostic after your code
		-- virtual_text = false,
		signs = {
			active = signs, -- show signs
		},
		update_in_insert = true,
		underline = true, -- underline for diagnostic
		severity_sort = true,
		float = {
			-- the diagnostic window
			focusable = true,
			style = "minimal",
			border = "rounded",
			source = "always",
			header = "",
			prefix = "",
		},
	})
end

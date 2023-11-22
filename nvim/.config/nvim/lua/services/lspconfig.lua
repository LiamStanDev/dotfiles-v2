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
		-- set keymap
		-- local opts = { noremap = true, silent = true }
		-- local keymap = vim.api.nvim_buf_set_keymap
		-- keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
		-- keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
		-- keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
		-- keymap(bufnr, "n", "gr", "<cmd>Telescope lsp_references<CR>", opts)

		-- keymap(bufnr, "n", "<space>na", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
		-- keymap(bufnr, "n", "<space>nd", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
		-- keymap(
		-- 	bufnr,
		-- 	"n",
		-- 	"<space>nl",
		-- 	"<cmd>lua vim.notify(vim.inspect(vim.lsp.buf.list_workspace_folders()), 'Info')<CR>",
		-- 	opts
		-- )

		-- Format
		vim.cmd([[command! Format execute "lua vim.lsp.buf.format({ async = true })" ]]) -- Format command
		-- formatting before save
		if client.name ~= "rust_analyzer" then
			vim.cmd([[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]])
		end

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
		if client.name ~= "omnisharp" and client.name ~= "rust_analyzer" and client.name ~= "lemminx" then
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
	capabilities.textDocument.completion.completionItem = {
		documentationFormat = { "markdown", "plaintext" },
		snippetSupport = true,
		preselectSupport = true,
		insertReplaceSupport = true,
		labelDetailsSupport = true,
		deprecatedSupport = true,
		commitCharactersSupport = true,
		tagSupport = { valueSet = { 1 } },
		resolveSupport = {
			properties = {
				"documentation",
				"detail",
				"additionalTextEdits",
			},
		},
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

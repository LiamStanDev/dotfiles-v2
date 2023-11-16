return {
	-- services installer
	{ "williamboman/mason.nvim", event = "VeryLazy", config = require("services.mason") },

	-- lsp
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			{
				"Hoffs/omnisharp-extended-lsp.nvim", -- for omnisharp decompile
				ft = "cs",
			},
			-- {
			-- 	"Decodetalkers/csharpls-extended-lsp.nvim", -- for charp_ls decompile
			-- 	ft = "cs",
			-- },
			"ray-x/lsp_signature.nvim",
		},
		config = require("services.lspconfig"),
	},
	{ "Hoffs/omnisharp-extended-lsp.nvim", event = "LspAttach" }, -- for decompile csharp

	-- formatting & linting
	{
		"nvimtools/none-ls.nvim",
		event = { "BufReadPost", "BufNewFile" },
		dependencies = {
			"jay-babu/mason-null-ls.nvim",
		},
		config = require("services.none-ls"),
	},

	-- dap
	{
		"mfussenegger/nvim-dap",
		event = "BufReadPre",
		dependencies = {
			"jay-babu/mason-nvim-dap.nvim",
			"theHamsta/nvim-dap-virtual-text",

			{
				"rcarriga/nvim-dap-ui",
				config = require("ui.dapui"),
			},
			"mfussenegger/nvim-dap-python",
		},
		init = require("services.dap").init,
		config = require("services.dap").config,
	},
}

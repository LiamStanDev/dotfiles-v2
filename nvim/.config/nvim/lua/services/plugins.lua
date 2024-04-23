return {
	-- services installer
	{ "williamboman/mason.nvim", event = "VeryLazy", config = require("services.mason") },

	-- lsp
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			{
				"ray-x/lsp_signature.nvim",
				event = "VeryLazy",
				config = require("services.lsp-signature"),
			},
		},
		config = require("services.lspconfig"),
	},

	-- formatting & linting
	-- {
	-- 	"nvimtools/none-ls.nvim",
	-- 	event = { "BufReadPost", "BufNewFile" },
	-- 	dependencies = {
	-- 		"jay-babu/mason-null-ls.nvim",
	-- 	},
	-- 	config = require("services.none-ls"),
	-- },

	-- formatting
	{
		"stevearc/conform.nvim",
		event = { "BufReadPost", "BufNewFile" },
		opts = {},
		config = require("services.conform-nvim"),
	},

	-- linting
	{
		"mfussenegger/nvim-lint",
		event = { "BufReadPost", "BufNewFile" },
		config = require("services.lint-nvim"),
	},
	-- dap
	{
		"mfussenegger/nvim-dap",
		event = "BufReadPre",
		dependencies = {
			"jay-babu/mason-nvim-dap.nvim",
			"theHamsta/nvim-dap-virtual-text",
			"mfussenegger/nvim-dap-python",
		},
		init = require("services.dap").init,
		config = require("services.dap").config,
	},
}

return {
	-- utils
	{ "nvim-lua/popup.nvim", lazy = true },
	{ "nvim-tree/nvim-web-devicons", lazy = true },
	{ "nvim-lua/plenary.nvim", lazy = true },

	-- dashboard
	{
		"goolord/alpha-nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = require("ui.alpha"),
	},

	-- lsp ui
	{
		"glepnir/lspsaga.nvim",
		event = "LspAttach",
		dependencies = { "nvim-tree/nvim-web-devicons", "nvim-treesitter/nvim-treesitter" },
		config = require("ui.lspsaga"),
	},

	-- dap ui
	{
		"rcarriga/nvim-dap-ui",
		config = require("ui.dapui"),
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
	},

	-- explore
	{
		"nvim-neo-tree/neo-tree.nvim",
		event = "VeryLazy",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
			"s1n7ax/nvim-window-picker",
		},
		config = require("ui.neotree"),
	},

	-- status line
	{ "nvim-lualine/lualine.nvim", event = "VeryLazy", config = require("ui.lualine") },

	-- buffer tab
	{ "akinsho/bufferline.nvim", config = require("ui.bufferline") },

	-- for select and input ui
	{
		"stevearc/dressing.nvim", -- for input, and select ui
		config = function()
			require("dressing").setup()
		end,
	},

	-- messages, cmdline and the popupmenu
	{
		"folke/noice.nvim", -- for command line pop window and nottify
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
		config = require("ui.noice"),
	},

	{ "rcarriga/nvim-notify", event = "VeryLazy", config = require("ui.notify") },

	-- toggle term
	{ "akinsho/toggleterm.nvim", version = "*", config = require("ui.toggleterm") },
}

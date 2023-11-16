return {
	{
		"s1n7ax/nvim-window-picker",
		version = "v1.*",
	},

	-- { "moll/vim-bbye" }, -- can delete buffers (close files)
	{ "famiu/bufdelete.nvim", event = "VeryLazy" },

	-- keymap ui
	{ "folke/which-key.nvim", event = "VeryLazy", config = require("tools.which-key") },

	-- diagnostic navigation
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = require("tools.troble"),
	},

	-- inline hint
	{
		"lvimuser/lsp-inlayhints.nvim",
		event = "LspAttach",
		config = require("tools.inline-hint"),
	},

	-- AI
	-- {
	-- 	"jackMort/ChatGPT.nvim",
	-- 	event = "VeryLazy",
	-- 	config = function()
	-- 		require("chatgpt").setup()
	-- 		-- require("tools.chatGPT")
	-- 	end,
	-- 	dependencies = {
	-- 		"MunifTanjim/nui.nvim",
	-- 		"nvim-lua/plenary.nvim",
	-- 		"nvim-telescope/telescope.nvim",
	-- 	},
	-- },

	-- -- live-server
	-- {
	-- 	"aurum77/live-server.nvim",
	-- 	build = function()
	-- 		require("live_server.util").install()
	-- 	end,
	-- 	cmd = { "LiveServer", "LiveServerStart", "LiveServerStop" },
	-- 	config = require("tools.live-server"),
	-- },

	-- surround
	{
		"kylechui/nvim-surround",
		version = "*",
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup()
		end,
	},

	-- rust
	{
		"rust-lang/rust.vim",
		ft = "rust",
		init = function()
			vim.g.rustfmt_autosave = 1
		end,
	},

	--color show
	{
		"NvChad/nvim-colorizer.lua", -- integrated with tailwind
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			require("ui.colorizer")
		end,
	},

	-- move
	{
		"phaazon/hop.nvim",
		branch = "v2", -- optional but strongly recommended
		config = require("tools.hop"),
	},
	-- {
	-- 	"ggandor/leap.nvim",
	-- 	config = function()
	-- 		require("leap").add_default_mappings()
	-- 	end,
	-- },

	-- telescopte
	{
		"nvim-telescope/telescope.nvim",
		event = "VeryLazy",
		dependencies = {
			"nvim-telescope/telescope-media-files.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			"nvim-telescope/telescope-project.nvim", -- project
			"nvim-telescope/telescope-dap.nvim",
		},
		config = require("tools.telescope"),
	},

	-- git
	{ "lewis6991/gitsigns.nvim", event = "VeryLazy", config = require("tools.gitsigns") },
	{
		"sindrets/diffview.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = { "nvim-lua/plenary.nvim" },
		config = require("tools.diffview"),
	},

	-- markdown preview
	-- {
	-- 	"iamcco/markdown-preview.nvim",
	-- 	build = "cd app && npm install",
	-- 	config = function()
	-- 		vim.g.mkdp_filetypes = { "markdown" }
	-- 	end,
	-- 	ft = { "markdown" }, -- load at markdown file type
	-- },

	-- nvim api documentation, and cmp
	{ "folke/neodev.nvim", opts = {} },
}

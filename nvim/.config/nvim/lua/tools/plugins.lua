return {
	{
		"s1n7ax/nvim-window-picker",
		version = "v1.*",
	},

	{ "famiu/bufdelete.nvim", event = "VeryLazy" },

	-- keymap ui
	{ "folke/which-key.nvim", event = "VeryLazy", config = require("tools.which-key") },

	-- diagnostic navigation
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = require("tools.troble"),
	},

	-- todo comment
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = require("tools.todo-comment"),
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

	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = "cd app && npm install",
		init = require("tools.markdown-preview"),
		ft = { "markdown" },
	},

	-- nvim api documentation, and cmp
	{ "folke/neodev.nvim", opts = {} },
}

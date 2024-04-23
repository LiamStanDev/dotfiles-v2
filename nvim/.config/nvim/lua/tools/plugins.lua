return {
	{
			's1n7ax/nvim-window-picker',
			name = 'window-picker',
			event = 'VeryLazy',
			version = '2.*',
			config = function()
					require'window-picker'.setup()
			end,
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
    'smoka7/hop.nvim',
    version = "*",
    opts = {
        keys = 'etovxqpdygfblzhckisuran'
    },
		config = require("tools.hop"),
},

	-- telescopte
	{
		"nvim-telescope/telescope.nvim",
		event = "VeryLazy",
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

	-- nvim api documentation, and cmp
	{ "folke/neodev.nvim", opts = {} },
}

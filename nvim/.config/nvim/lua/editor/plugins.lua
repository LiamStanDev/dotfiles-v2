return {
	-- fcitx
	-- { "h-hg/fcitx.nvim", event = "InsertEnter" },

	-- auto autopairs
	{ "windwp/nvim-autopairs", event = "InsertEnter", config = require("editor.autopairs") },

	-- comment
	{ "numToStr/Comment.nvim", event = { "BufNewFile", "BufReadPre" }, config = require("editor.comment") },

	-- indnet line
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		event = { "BufReadPost", "BufNewFile" },
		config = require("editor.indentline"),
	},
	{
		"echasnovski/mini.indentscope",
		version = false, -- wait till new 0.7.0 release to put it back on semver
		event = { "BufReadPre", "BufNewFile" },
		init = require("editor.indentscope").init,
		config = require("editor.indentscope").config,
	},

	-- cmp
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-emoji",
			"hrsh7th/cmp-calc",
			-- "rcarriga/cmp-dap",
			{
				"L3MON4D3/LuaSnip",
				version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
				-- install jsregexp (optional!).
				build = "make install_jsregexp",
				config = require("editor.luasnippet"),
				-- dependencies = { "rafamadriz/friendly-snippets" },
			},
		},
		config = require("editor.nvim-cmp"),
	},

	-- treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		version = false, -- last release is way too old and doesn't work on Windows
		build = ":TSUpdate",
		event = { "BufReadPost", "BufNewFile" },
		config = require("editor.treesitter"),
		dependencies = {
			{ "windwp/nvim-ts-autotag", config = require("editor.autotag") },
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
	},

	-- navigator with tmux
	"christoomey/vim-tmux-navigator",

	-- code folding
	{
		"kevinhwang91/nvim-ufo",
		config = require("editor.nvim-ufo"),
		event = { "BufReadPost", "BufNewFile" },
		dependencies = { "kevinhwang91/promise-async" },
	},

	-- surround
	{
		"kylechui/nvim-surround",
		version = "*",
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup()
		end,
	},
}

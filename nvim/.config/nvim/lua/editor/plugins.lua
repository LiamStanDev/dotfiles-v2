return {

	-- auto autopairs
	{ "windwp/nvim-autopairs", event = "InsertEnter", config = require("editor.autopairs") },
	{ "m4xshen/autoclose.nvim", event = "InsertEnter", config = require("editor.autoclose") },

	-- comment
	{ "numToStr/Comment.nvim", event = { "BufNewFile", "BufReadPre" }, config = require("editor.comment") },

	-- for text highlight
	{
		"RRethy/vim-illuminate",
		event = { "CursorHold", "CursorHoldI" },
		config = require("editor.illuminate"),
	},

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
		-- version = false, -- last release is way too old
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-emoji",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-calc",
			"rcarriga/cmp-dap",
			{
				"L3MON4D3/LuaSnip",
				version = "1.2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
				-- install jsregexp (optional!).
				build = "make install_jsregexp",
				config = require("editor.luasnippet"),
				-- dependencies = { "rafamadriz/friendly-snippets" },
			},
			{
				"roobert/tailwindcss-colorizer-cmp.nvim",
				ft = { "html", "typescript", "typescriptreact", "javascript", "css", "javascriptreact" },
				config = function()
					require("tailwindcss-colorizer-cmp").setup({
						color_square_width = 2,
					})
				end,
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
			-- { "p00f/nvim-ts-rainbow" }, -- rainbow brasket for treesitter extension
			-- { "JoosepAlviste/nvim-ts-context-commentstring" },
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
}

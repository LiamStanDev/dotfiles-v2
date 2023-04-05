local M = {}

M.plugins = {
	-- colorscheme
	{ "olimorris/onedarkpro.nvim", opts = { options = { transparency = true } } },
	{ "folke/tokyonight.nvim" },
	{
		"catppuccin/nvim",
		name = "catppuccin",
		opts = { transparent_background = true, no_italic = true },
	},
	{
		"sainnhe/everforest",
		config = function()
			vim.g.everforest_transparent_background = 1
		end,
	},
	{
		"sainnhe/gruvbox-material",
		config = function()
			vim.g.gruvbox_material_disable_italic_comment = 1
			vim.g.gruvbox_material_transparent_background = 1
		end,
	},

	-- uitl plugins
	{ "nvim-lua/plenary.nvim", lazy = true },

	-- comment
	{ "numToStr/Comment.nvim", event = { "BufNewFile", "BufReadPre" }, config = require("editor.comment") },

	-- auto autopairs
	{ "windwp/nvim-autopairs", event = "InsertEnter", config = require("editor.autopairs") },
	-- { "m4xshen/autoclose.nvim", event = "InsertEnter", config = require("editor.autoclose") },

	-- for text highlight
	{
		"RRethy/vim-illuminate",
		event = { "CursorHold", "CursorHoldI" },
		config = require("editor.illuminate"),
	},

	-- indnet line
	{
		"lukas-reineke/indent-blankline.nvim",
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
		version = false, -- last release is way too old
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lua",
			{
				"L3MON4D3/LuaSnip",
				dependencies = {
					"rafamadriz/friendly-snippets",
				},
				config = require("editor.luasnippet"),
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
			{ "JoosepAlviste/nvim-ts-context-commentstring" },
			{ "windwp/nvim-ts-autotag", config = require("editor.autotag") },
		},
	},

	-- services installer
	{ "williamboman/mason.nvim", event = "VeryLazy", config = require("services.mason") },

	-- lsp
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"Hoffs/omnisharp-extended-lsp.nvim", -- for decompile csharp
		},
		config = require("services.lspconfig"),
	},
	{ "Hoffs/omnisharp-extended-lsp.nvim", event = "LspAttach" }, -- for decompile csharp

	-- formatting & linting
	{
		"jose-elias-alvarez/null-ls.nvim",
		event = { "BufReadPost", "BufNewFile" },
		dependencies = {
			"jay-babu/mason-null-ls.nvim",
		},
		config = require("services.null-ls"),
	},

	-- dap
	{
		"rcarriga/nvim-dap-ui",
		event = "VeryLazy",
		dependencies = {
			"mfussenegger/nvim-dap",
			"jay-babu/mason-nvim-dap.nvim",
		},
		init = require("services.dap").init,
		config = require("services.dap").config,
	},

	-- utils
	{ "nvim-lua/popup.nvim", event = "VeryLazy" },
	{ "nvim-tree/nvim-web-devicons", lazy = true },

	{
		"s1n7ax/nvim-window-picker",
		version = "v1.*",
	},

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
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = require("services.lspsaga"),
	},

	-- keymap ui
	{ "folke/which-key.nvim", event = "VeryLazy", config = require("tools.which-key") },

	-- file explorers
	-- { "nvim-tree/nvim-tree.lua", event = "VeryLazy" },
	{
		"nvim-neo-tree/neo-tree.nvim",
		event = "VeryLazy",
		branch = "v2.x",
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
	{ "akinsho/bufferline.nvim", event = "VeryLazy", config = require("ui.bufferline") },
	{ "moll/vim-bbye" }, -- can delete buffers (close files)

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

	-- file naviagtor bar
	-- {
	-- 	"SmiteshP/nvim-navic", -- for top nav bar
	-- 	event = { "BufReadPost", "BufNewFile" },
	-- 	dependencies = "neovim/nvim-lspconfig",
	-- 	config = require("ui.navic"),
	-- },

	-- for outline
	-- { "simrat39/symbols-outline.nvim" },

	-- transparent theme
	-- "xiyaowong/transparent.nvim",

	-- toggle term
	{ "akinsho/toggleterm.nvim", version = "*", config = require("ui.toggleterm") },
	{ "kdheepak/lazygit.nvim" }, --toggle term with lazygit extension

	--color show
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	},

	{
		"ggandor/leap.nvim",
		event = { "BufReadPost", "BufAdd", "BufNewFile" },
		config = function()
			require("leap").add_default_mappings()
		end,
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
}

return M

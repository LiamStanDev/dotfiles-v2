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
	-- {
	-- 	"lvimuser/lsp-inlayhints.nvim",
	-- 	lazy = true,
	-- 	branch = "anticonceal",
	-- 	opts = {},
	-- 	init = function()
	-- 		vim.api.nvim_create_autocmd("LspAttach", {
	-- 			group = vim.api.nvim_create_augroup("LspAttach_inlayhints", {}),
	-- 			callback = function(args)
	-- 				if not (args.data and args.data.client_id) then
	-- 					return
	-- 				end
	-- 				local client = vim.lsp.get_client_by_id(args.data.client_id)
	-- 				require("lsp-inlayhints").on_attach(client, args.buf)
	-- 			end,
	-- 		})
	-- 	end,
	-- },

	-- todo comment
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = require("tools.todo-comment"),
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

return {
	-- colorscheme
	{
		"olimorris/onedarkpro.nvim",
		opts = {
			colors = {}, -- Override default colors or create your own
			highlights = {
				-- neotree color: https://github.com/loctvl842/monokai-pro.nvim/blob/master/lua/monokai-pro/theme/plugins/neo-tree.lua
				NeoTreeFileIcon = { fg = "#61AFEF" },
				NeoTreeDirectoryName = { fg = "#A3AAB7" },
				NeoTreeDirectoryIcon = { fg = "#89B4FA" },
				NeoTreeExpander = { fg = "#7D8590" },
				NeoTreeIndentMarker = { fg = "#7D8590" },
			},
			options = {
				transparency = true,
			},
		},
	},
	-- { "navarasu/onedark.nvim", opts = { style = "darker", transparent = true } },
	-- { "folke/tokyonight.nvim", opts = { transparent = true } },
	-- {
	-- 	"catppuccin/nvim",
	-- 	name = "catppuccin",
	-- 	opts = { transparent_background = true, no_italic = true },
	-- },
	-- {
	-- 	"sainnhe/everforest",
	-- 	config = function()
	-- 		vim.g.everforest_transparent_background = 1
	-- 	end,
	-- },
	-- {
	-- 	"sainnhe/gruvbox-material",
	-- 	config = function()
	-- 		vim.g.gruvbox_material_disable_italic_comment = 1
	-- 		vim.g.gruvbox_material_transparent_background = 1
	-- 	end,
	-- },
	-- {
	-- 	"savq/melange-nvim",
	-- },
	-- {
	-- 	"morhetz/gruvbox",
	-- },
	-- {
	-- 	"rebelot/kanagawa.nvim",
	-- },
	-- {
	-- 	"sainnhe/sonokai",
	-- },
}

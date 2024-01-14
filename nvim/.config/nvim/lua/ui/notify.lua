return function()
	require("notify").setup({
		background_colour = "#282C34",
		fps = 60,
		icons = {
			DEBUG = "",
			ERROR = "",
			INFO = "",
			TRACE = "✎",
			WARN = "",
		},
		level = vim.log.levels.ERROR,
		minimum_width = 25,
		render = "compact",
		stages = "fade",
		timeout = 3000,
		top_down = true,
	})
end

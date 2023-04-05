return function()
	require("notify").setup({
		background_colour = "#000000",
		fps = 60,
		icons = {
			DEBUG = "",
			ERROR = "",
			INFO = "",
			TRACE = "✎",
			WARN = "",
		},
		level = vim.log.levels.WARN,
		minimum_width = 25,
		render = "compact",
		stages = "fade",
		timeout = 1000,
		top_down = true,
	})
end

return function()
	local telescope = require("telescope")

	local actions = require("telescope.actions")

	telescope.setup({
		defaults = {
			mappings = {
				-- ctrl + v will open in vsplit
				i = {
					["<C-j>"] = actions.move_selection_next,
					["<C-k>"] = actions.move_selection_previous,
				},
				n = { ["q"] = require("telescope.actions").close },
			},
			vimgrep_arguments = {
				"rg",
				"-L", -- follow symbolic links
				"--color=never",
				"--no-heading",
				"--with-filename",
				"--line-number",
				"--column",
				"--smart-case",
				-- "--hidden",
				"--glob=!.git/",
			},
			file_ignore_patterns = {
				".git/",
				".cache",
				"%.o",
				"%.a",
				"%.out",
				"%.class",
				-- "%.pdf",
				"%.mkv",
				"%.mp4",
				"%.zip",
			},
			prompt_prefix = "   ",
			selection_caret = "  ",
			entry_prefix = "  ",
			initial_mode = "insert",
			winblend = 0, -- transparency
			path_display = { "truncate" },
			color_devicons = true,
			selection_strategy = "reset",
			sorting_strategy = "ascending",
			layout_strategy = "horizontal",
			layout_config = {
				horizontal = {
					prompt_position = "bottom",
					preview_width = 0.55,
					results_width = 0.8,
				},
				vertical = {
					mirror = false,
				},
				width = 0.87,
				height = 0.80,
				preview_cutoff = 120,
			},
		},
		pickers = {
			find_files = {
				hidden = true,
			},
			live_grep = {
				only_sort_text = true,
			},
			grep_string = {
				only_sort_text = true,
			},
			planets = {
				show_pluto = true,
				show_moon = true,
			},
			git_files = {
				hidden = true,
				show_untracked = true,
			},
			colorscheme = {
				enable_preview = true,
			},
		},
	})
end

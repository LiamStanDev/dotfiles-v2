local satus_treesitter, treesitter = pcall(require, "nvim-treesitter.configs")
if not satus_treesitter then
	print("nvim-treesitter not found")
	return
end

treesitter.setup({
	highlight = { enable = true },
	indent = { enable = true }, -- put the curser to the right indent
	autotag = { enable = true }, -- auto tag extension
	ensure_installed = {
		"json",
		"javascript",
		"tsx",
		"html",
		"css",
		"markdown",
		"bash",
		"lua",
		"vim",
		"dockerfile",
		"gitignore",
		"c_sharp",
	},
	auto_install = true,
	disable = function(_, buf)
		local max_filesize = 100 * 1024 -- 100 KB
		local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
		if ok and stats and stats.size > max_filesize then
			return true
		end
	end,
	context_commentstring = {
		enable = true,
	},
	rainbow = {
		enable = true,
		disable = {}, -- list of languages you want to disable the plugin for
		extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
		max_file_lines = 1000, -- Do not enable for files with more than n lines, int
		-- colors = {}, -- table of hex strings
		-- termcolors = {} -- table of colour name strings
	},
})

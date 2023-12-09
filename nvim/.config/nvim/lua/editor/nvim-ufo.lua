return function()
	vim.o.foldcolumn = "0" -- '0' is not bad
	vim.o.foldlevel = 10 -- Using ufo provider need a large value, feel free to decrease the value
	vim.o.foldlevelstart = 100
	vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
	vim.o.foldenable = true

	local ftMap = {
		vim = "indent",
		python = { "indent" },
		git = "",
	}

	require("ufo").setup({
		open_fold_hl_timeout = 150,
		close_fold_kinds = { "imports", "comment" },
		preview = {
			win_config = {
				border = { "", "─", "", "", "", "─", "", "" },
				winhighlight = "Normal:Folded",
				winblend = 0,
			},
			mappings = {
				scrollU = "<C-u>",
				scrollD = "<C-d>",
				jumpTop = "[",
				jumpBot = "]",
			},
		},
		provider_selector = function(bufnr, filetype, buftype)
			return ftMap[filetype] or { "treesitter", "indent" }
		end,
	})
	-- press z the which key will show more information
	-- za toggle fold
	vim.keymap.set("n", "zR", require("ufo").openAllFolds)
	vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
	vim.keymap.set("n", "zr", require("ufo").openFoldsExceptKinds)
	vim.keymap.set("n", "zm", require("ufo").closeFoldsWith) -- closeAllFolds == closeFoldsWith(0)
end

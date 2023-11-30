return function()
	local linters = require("core").linting_services

	require("lint").linters_by_ft = linters

	vim.api.nvim_create_autocmd({ "BufWritePost" }, {
		callback = function()
			require("lint").try_lint()
		end,
	})
end

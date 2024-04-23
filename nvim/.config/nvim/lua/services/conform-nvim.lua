return function()
	local formatters = require("core.globals").formatter_services
	require("conform").setup({
		formatters_by_ft = formatters,
		-- format_on_save = {
		-- 	timeout_ms = 500,
		-- 	lsp_fallback = true,
		-- },
	})
end

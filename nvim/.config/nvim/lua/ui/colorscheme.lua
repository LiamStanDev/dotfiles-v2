local M = {}
M.setup = function()
	local g_configs = require("core")
	local colorscheme = g_configs.colorscheme

	-- set catppuccin first for bufferline color(can't delete)
	vim.cmd("colorscheme " .. "catppuccin-mocha")
	local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
	if not status_ok then
		vim.notify("colorscheme " .. colorscheme .. " not found!")
	else
		vim.cmd("colorscheme " .. "onedark")
	end

	if g_configs.transparant then
		vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	end
end

return M

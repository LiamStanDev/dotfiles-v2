local M = {}
M.setup = function()
	local colorscheme = require("core.globals").colorscheme

	-- set catppuccin first for bufferline color(can't delete)
	-- vim.cmd("colorscheme " .. "catppuccin-mocha")
	local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
	if not status_ok then
		vim.notify("colorscheme " .. colorscheme .. " not found!")
	else
		vim.cmd("colorscheme " .. "onedark")
	end
end

return M

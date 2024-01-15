-- python provider
local conda_prefix = os.getenv("CONDA_PREFIX")
if conda_prefix ~= nil then
	vim.g.python_host_prog = conda_prefix .. "/bin/python"
	vim.g.python3_host_prog = conda_prefix .. "/bin/python"
else
	vim.g.python_host_prog = "/usr/bin/python"
	vim.g.python3_host_prog = "/usr/bin/python3"
end

-- setup diagnostic ui
local signs = {
	{ name = "DiagnosticSignError", text = "" },
	{ name = "DiagnosticSignWarn", text = "" },
	{ name = "DiagnosticSignHint", text = "" },
	{ name = "DiagnosticSignInfo", text = "" },
}

for _, sign in ipairs(signs) do
	vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

vim.diagnostic.config({
	virtual_text = { spacing = 2, prefix = "●" }, -- show diagnostic after your code
	signs = {
		active = signs, -- show signs
	},
	update_in_insert = true,
	underline = true, -- underline for diagnostic
	severity_sort = true,
	float = {
		-- the diagnostic window
		focusable = true,
		style = "minimal",
		border = "rounded",
		source = "always",
		header = "",
		prefix = "",
	},
})

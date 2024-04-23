local M = {}
-- setup diagnostic ui
M.signs = {
	{ name = "DiagnosticSignError", text = "" },
	{ name = "DiagnosticSignWarn", text = "" },
	{ name = "DiagnosticSignHint", text = "" },
	{ name = "DiagnosticSignInfo", text = "" },
}

for _, sign in ipairs(M.signs) do
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


M.kind_icons = {
	Namespace = "",
	Text = "",
	Method = "",
	Function = "",
	Constructor = "",
	Field = "ﰠ",
	Variable = "",
	Class = "ﴯ",
	Interface = "",
	Module = "",
	Property = "ﰠ",
	Unit = "塞",
	Value = "",
	Enum = "",
	Keyword = "",
	Snippet = "",
	Color = "",
	File = "",
	Reference = "",
	Folder = "",
	EnumMember = "",
	Constant = "",
	Struct = "פּ",
	Event = "",
	Operator = "",
	TypeParameter = "",
	Table = "",
	Object = "",
	Tag = "",
	Array = "[]",
	Boolean = "",
	Number = "",
	Null = "ﳠ",
	String = "",
	Calendar = "",
	Watch = "",
	Package = "",
	Copilot = "",
}

return M
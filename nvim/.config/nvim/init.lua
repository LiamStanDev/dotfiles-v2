-- the core plugins
local g_configs = require("core")

-- set color theme here
g_configs.colorscheme = "onedark"

-- whether to see navigator bar in the top
g_configs.navigator_on = false

-- set the logo. see ./lua/ui/style/header.lua
g_configs.dashboard_logo = "AstronautSmall"

-- file filter for explorer
g_configs.filter_files = {
	"node_modules",
	".git",
	"obj",
	".DS_Store",
	".vscode",
}

-- register lsp server for auto completion
g_configs.lsp_servers = { -- see https://github.com/williamboman/mason-lspconfig.nvim
	"tsserver",
	"tailwindcss",
	-- "omnisharp",
	-- "csharp_ls",
	"rust_analyzer",
	"html",
	"jsonls",
	"lua_ls",
	"cssls",
	"pylsp", -- python lsp
	"bashls",
}

-- register formatting and diagnostics server
g_configs.null_ls_servers = {
	"prettier",
	"black", -- python formatter
	"stylua", -- lua formatter
	"beautysh", -- bash formatter
	"csharpier", -- csharp formatter
	"eslint", -- js, ts linter
	--"cspell", -- so annoying
	--"flake8",
	--"mypy",
	"xmlformat",
	"rustfmt", -- rust formatter
	"clippy", -- rust linter
}

-- register debuger server
g_configs.dap_servers = {
	"coreclr", -- csharp
	"python",
	"codelldb",
}

-- setup all plugin
require("plugins-setup")

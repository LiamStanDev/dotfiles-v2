-- the core plugins
require("core")
local config = require("core.globals")

-- -----------------------------------------------------
-- Register server
-- -----------------------------------------------------
-- tree-sitter code highlight
config.code_hight_servers = {
	"json",
	"javascript",
	"tsx",
	"html",
	"css",
	"markdown",
	"markdown_inline",
	"bash",
	"lua",
	"vim",
	"dockerfile",
	"gitignore",
	"cpp",
	"cmake",
	"rust",
	"sql",
}

-- lsp server for auto completion
config.lsp_servers = { -- see https://github.com/williamboman/mason-lspconfig.nvim
	"html",
	"jsonls",
	"lua_ls",
	"cssls",
	"pyright",
	"bashls",
	"dockerls",
	"docker_compose_language_service",
	"tsserver",
	"taplo", -- toml lsp
	"rust_analyzer",
	"gopls",
	"clangd",
}

config.formatter_services = {
	lua = { "stylua" },
	-- Conform will run multiple formatters sequentially
	python = { "isort", "black" },
	-- Use a sub-list to run only the first available formatter
	javascript = { { "prettierd", "prettier" } },
	typescript = { { "prettierd", "prettier" } },
	typescriptreact = { { "prettierd", "prettier" } },
	json = { { "prettierd", "prettier" } },
	go = { "gofmt" },
	cpp = { "clang_format" },
	bash = { "beautysh" },
	zsh = { "beautysh" },
	shell = { "beautysh" },
}

config.linting_services = {
	javascript = { "eslint_d" },
	javascriptreact = { "eslint_d" },
	typescript = { "eslint_d" },
	typescriptreact = { "eslint_d" },
}

-- debuger server
config.dap_servers = {
	"python",
	"cppdbg",
	"coreclr", -- csharp
	"codelldb",
	"delve", -- go
}

-- -----------------------------------------------------
-- Others
-- -----------------------------------------------------
-- set color theme here
config.colorscheme = "onedark"

-- whether to see navigator bar in the top
config.navigator_on = true

-- set the logo. see ./lua/ui/style/header.lua
config.dashboard_logo = "AstronautSmall"

-- border style
config.cmp_window_border = "single" -- none, single, rounded
config.which_key_window_border = "none" -- none, single, double, shadow

-- show inline hint
config.open_type_hint = true -- for variable
config.open_parameter_hint = true

-- completion menu with text
config.cmp_kind_text = true

-- file filter for explorer(only for dotfiles)
config.filter_files = {
	".git",
	".DS_Store",
	-- ".vscode",
}

-- setup all plugin
require("plugins-setup")

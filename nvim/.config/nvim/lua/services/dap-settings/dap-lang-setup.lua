local dap = require("dap")
local utils = require("services.dap-settings.utils")

dap.configurations.rust = {
	{
		name = "LLDB: Launch",
		type = "codelldb",
		request = "launch",
		program = utils.get_rust_bin,
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
		args = {},
	},
}

dap.configurations.cs = {
	{
		name = "NetCoreDbg: Launch",
		type = "coreclr",
		request = "launch",
		cwd = "${fileDirname}",
		program = utils.get_cs_dll,
	},
	-- https://stackoverflow.com/questions/77013544/error-on-attach-key-processid-not-found-when-trying-attach-neovim-dap-debu
	{
		name = "NetCoreDbg: Attach",
		type = "coreclr",
		request = "attach",
		cwd = "${fileDirname}",
		processId = require("dap.utils").pick_process,
	},
}

-- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
dap.configurations.go = {
	{
		type = "delve",
		name = "Debug",
		request = "launch",
		program = "${file}",
	},
	{
		type = "delve",
		name = "Debug test", -- configuration for debugging test files
		request = "launch",
		mode = "test",
		program = "${file}",
	},
	-- works with go.mod packages and sub packages
	{
		type = "delve",
		name = "Debug test (go.mod)",
		request = "launch",
		mode = "test",
		program = "./${relativeFileDirname}",
	},
}

-- local venv_path = os.getenv("VIRTUAL_ENV") or os.getenv("CONDA_PREFIX")
-- dap.configurations.python = {
-- 	{
-- 		name = "Python: Launch",
-- 		type = "python",
-- 		request = "launch",
-- 		program = "${file}",
-- 		pythonPath = venv_path and (venv_path .. "/bin/python") or nil,
-- 	},
-- }
dap.configurations.python = {
	{
		-- The first three options are required by nvim-dap
		type = "python", -- the type here established the link to the adapter definition: `dap.adapters.python`
		request = "launch",
		name = "Launch file",

		-- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

		program = "${file}", -- This configuration will launch the current file if used.
		pythonPath = function()
			-- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
			-- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
			-- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
			local cwd = vim.fn.getcwd()
			if vim.fn.executable(cwd .. "/venv/bin/python") == 1 then
				return cwd .. "/venv/bin/python"
			elseif vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
				return cwd .. "/.venv/bin/python"
			else
				return "/usr/bin/python"
			end
		end,
	},
}

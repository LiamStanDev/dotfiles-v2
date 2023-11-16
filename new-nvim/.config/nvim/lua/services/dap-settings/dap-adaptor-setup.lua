local dap = require("dap")

local adaptor_path = vim.fn.stdpath("data") .. "/mason/bin/"

dap.adapters.coreclr = {
	type = "executable",
	command = adaptor_path .. "netcoredbg",
	args = { "--interpreter=vscode" },
}

dap.adapters.codelldb = {
	type = "server",
	port = "${port}",
	executable = {
		command = adaptor_path .. "codelldb",
		args = { "--port", "${port}" },
		-- On windows you may have to uncomment this:
		-- detached = false,
	},
}

dap.adapters.delve = {
	type = "server",
	port = "${port}",
	executable = {
		command = adaptor_path .. "dlv",
		args = { "dap", "-l", "127.0.0.1:${port}" },
	},
}

dap.adapters.python = function(cb, config)
	if config.request == "attach" then
		local port = (config.connect or config).port
		local host = (config.connect or config).host or "127.0.0.1"
		cb({
			type = "server",
			port = assert(port, "`connect.port` is required for a python `attach` configuration"),
			host = host,
			options = {
				source_filetype = "python",
			},
		})
	else
		cb({
			type = "executable",
			command = adaptor_path .. "debugpy",
			args = { "-m", "debugpy.adapter" },
			options = {
				source_filetype = "python",
			},
		})
	end
end

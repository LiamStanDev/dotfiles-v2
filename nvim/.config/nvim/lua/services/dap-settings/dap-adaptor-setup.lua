local dap = require("dap")

local adaptor_path = vim.fn.stdpath("data") .. "/mason/bin/"

-- coreclr configs
dap.adapters.coreclr = function(cb, config)
	if config.mode == "remote" then
		-- TODO: remote debug not complete
		local host = (config.connect or config).host or "127.0.0.1"
		local port = (config.connect or config).port
		cb({
			type = "server",
			host = assert(host, "`connect.host` is required"),
			port = assert(port, "`connect.port` is required"),
			executable = {
				command = adaptor_path .. "netcoredbg",
				args = { "--interpreter=vscode", "--port", "${port}" },
			},
		})
	else
		cb({
			type = "executable",
			command = adaptor_path .. "netcoredbg",
			args = { "--interpreter=vscode" },
		})
	end
end

-- codelldb configs
dap.adapters.codelldb = {
	type = "server",
	port = "${port}",
	executable = {
		command = adaptor_path .. "codelldb",
		args = { "--port", "${port}" },
	},
}

-- delve configs
dap.adapters.delve = {
	type = "server",
	port = "${port}",
	executable = {
		command = adaptor_path .. "dlv",
		args = { "dap", "-l", "127.0.0.1:${port}" },
	},
}

-- python configs
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

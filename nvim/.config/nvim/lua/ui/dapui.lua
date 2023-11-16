return function()
	local dapui = require("dapui")
	-- see: https://github.com/rcarriga/nvim-dap-ui
	require("neodev").setup({
		library = { plugins = { "nvim-dap-ui" }, types = true },
	})

	dapui.setup({
		icons = { expanded = "", collapsed = "", circular = "" },
		mappings = {
			-- Use a table to apply multiple mappings
			expand = { "<CR>", "<2-LeftMouse>" },
			open = "o",
			remove = "d",
			edit = "e",
			repl = "r",
			toggle = "t",
		},
		layouts = {
			{
				elements = {
					{
						id = "repl",
						size = 5.0,
					},
					{
						id = "breakpoints",
						size = 0.1,
					},
					{
						id = "stacks",
						size = 0.2,
					},
					{
						id = "console",
						size = 0.2,
					},
				},
				position = "right",
				size = 60,
			},
			{
				elements = {
					{
						id = "scopes",
						size = 0.5,
					},
					{
						id = "watches",
						size = 0.5,
					},
				},
				position = "bottom",
				size = 20,
			},
		},
		floating = {
			max_height = 0.9,
			max_width = 0.5, -- Floats will be treated as percentage of your screen.
			border = "single", -- Border style. Can be 'single', 'double' or 'rounded'
			mappings = {
				close = { "q", "<Esc>" },
			},
		},
		windows = { indent = 1 },
		render = {
			max_type_length = nil, -- Can be integer or nil.
			max_value_lines = 100, -- Can be integer or nil.
		},
	})

	-- for auto open and close
	local dap = require("dap")
	dap.listeners.after.event_initialized["dapui_config"] = function()
		dapui.open()
	end
	dap.listeners.before.event_terminated["dapui_config"] = function()
		dapui.close()
	end
	dap.listeners.before.event_exited["dapui_config"] = function()
		dapui.close()
	end
end

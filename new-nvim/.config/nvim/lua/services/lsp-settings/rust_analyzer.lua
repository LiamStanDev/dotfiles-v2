return {
	settings = {
		["rust-analyzer"] = {
			diagnostics = {
				enable = true,
			},
			checkOnSave = true,
			check = {
				command = "check",
				allTargets = true,
				features = "all",
				invocationLocation = "workspace",
				extraArgs = {},
			},
		},
	},
}

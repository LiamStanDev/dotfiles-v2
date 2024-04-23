return function()
	local linters = require("core.globals").linting_services

	require("lint").linters_by_ft = linters
end

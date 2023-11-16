return function()
	require("autoclose").setup({

		options = {
			disable_when_touch = true,
		},
		keys = {
			-- ["("] = { escape = false, close = true, pair = "()" },
			-- ["["] = { escape = false, close = true, pair = "[]" },
			-- ["{"] = { escape = false, close = true, pair = "{}" },
			-- -- ["<"] = { escape = false, close = true, pair = "<>" },
			--
			-- [">"] = { escape = true, close = false, pair = "<>" },
			-- [")"] = { escape = true, close = false, pair = "()" },
			-- ["]"] = { escape = true, close = false, pair = "[]" },
			-- ["}"] = { escape = true, close = false, pair = "{}" },
			--
			-- ['"'] = { escape = true, close = true, pair = '""' },
			-- ["'"] = { escape = true, close = true, pair = "''" },
			-- ["`"] = { escape = true, close = true, pair = "``" },
			["|"] = { escape = true, close = true, pair = "||" },
		},
	})
end

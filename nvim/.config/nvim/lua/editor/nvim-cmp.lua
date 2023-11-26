return function()
	local cmp = require("cmp")
	local core = require("core")
	local kind_icons = {
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

	local function window_setup()
		if core.cmp_window_border == "rounded" then
			local border_opt = {
				border = "rounded", -- single, rounded
				winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
			}
			return {
				completion = require("cmp.config.window").bordered(border_opt),
				documentation = require("cmp.config.window").bordered(border_opt),
			}
		end
		if core.cmp_window_border == "single" then
			local border_opt = {
				border = "single", -- single, rounded
				winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
			}
			return {
				completion = require("cmp.config.window").bordered(border_opt),
				documentation = require("cmp.config.window").bordered(border_opt),
			}
		end
		return {
			completion = require("cmp.config.window"),
			documentation = require("cmp.config.window"),
		}
	end

	-- find more here: https://www.nerdfonts.com/cheat-sheet
	cmp.setup({
		active = true,
		snippet = {
			expand = function(args)
				require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
			end,
		},
		mapping = cmp.mapping.preset.insert({
			["<C-k>"] = cmp.mapping.select_prev_item(),
			["<C-j>"] = cmp.mapping.select_next_item(),
			["<C-b>"] = cmp.mapping.scroll_docs(-4),
			["<C-f>"] = cmp.mapping.scroll_docs(4),
			["<C-p>"] = cmp.mapping.complete(),
			["<C-e>"] = cmp.mapping.abort(),
			["<Tab>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
		}),
		formatting = {
			fields = { "kind", "abbr", "menu" },
			source_names = {
				nvim_lsp = "(LSP)",
				emoji = "(Emoji)",
				path = "(Path)",
				calc = "(Calc)",
				cmp_tabnine = "(Tabnine)",
				vsnip = "(Snippet)",
				luasnip = "(Snippet)",
				buffer = "(Buffer)",
				tmux = "(TMUX)",
				copilot = "(Copilot)",
			},
			format = function(entry, item)
				-- Kind icons
				item.kind = string.format("%s %s", kind_icons[item.kind], core.cmp_kind_text and item.kind or "")

				if entry.completion_item.detail ~= nil and entry.completion_item ~= "" then
					item.menu = entry.completion_item.detail
				else
					item.menu = core.cmp_kind_text and ""
						or ({
							nvim_lsp = "(LSP)",
							luasnip = "(Snippet)",
							buffer = "(Buffer)",
							path = "(Path)",
						})[entry.source.name]
				end

				return require("tailwindcss-colorizer-cmp").formatter(entry, item)
			end,
		},
		sources = {
			{ name = "nvim_lsp" },
			{ name = "nvim_lua" },
			{ name = "luasnip" },
			{ name = "buffer" },
			{ name = "path" },
			{ name = "emoji" }, -- input ":" then the menu shows up
			{ name = "calc" },
		},
		confirm_opts = {
			-- behavior = cmp.ConfirmBehavior.Replace,
			select = false,
		},
		window = {
			completion = window_setup().completion,
			documentation = window_setup().documentation,
		},
		experimental = {
			ghost_text = false,
			native_menu = false,
		},
	})
	-- nvim dap-cmp
	cmp.setup({
		enabled = function()
			return vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt" or require("cmp_dap").is_dap_buffer()
		end,
	})

	cmp.setup.filetype({ "dap-repl", "dapui_watches", "dapui_hover" }, {
		sources = {
			{ name = "dap" },
		},
	})

	-- Add parentheses after selecting function or method
	local cmp_autopairs = require("nvim-autopairs.completion.cmp")
	cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
end

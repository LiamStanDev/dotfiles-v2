local M = {}

M.get_cs_dll = function()
	vim.fn.jobstart("dotnet build")
	return coroutine.create(function(dap_run_co)
		local items = vim.fn.globpath(vim.fn.getcwd(), "**/bin/Debug/**/*.dll", 0, 1)
		local opts = {
			format_item = function(path)
				return vim.fn.fnamemodify(path, ":t")
			end,
		}
		local function cont(choice)
			if choice == nil then
				return nil
			else
				coroutine.resume(dap_run_co, choice)
			end
		end

		vim.ui.select(items, opts, cont)
	end)
end

M.get_rust_bin = function()
	vim.fn.jobstart("cargo build")
	return coroutine.create(function(dap_run_co)
		local items = vim.fn.globpath(vim.fn.getcwd(), "**/target/debug/*", 0, 1)
		local opts = {
			format_item = function(path)
				return vim.fn.fnamemodify(path, ":t")
			end,
		}
		local function cont(choice)
			if choice == nil then
				return nil
			else
				coroutine.resume(dap_run_co, choice)
			end
		end

		vim.ui.select(items, opts, cont)
	end)
end

return M

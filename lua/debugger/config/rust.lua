local Path = require("plenary.path")
local dap = require("dap")

local function find_crate_dir()
	local filename = vim.api.nvim_buf_get_name(0)
	if filename == "" then
		return nil
	end
	local folder = Path:new(filename):parent()
	local result = folder:find_upwards("Cargo.toml")
	if result == "" then
		return nil
	end
	return result:parent()
end

local function get_crate_name()
	local crate_dir = find_crate_dir()
	if crate_dir == nil then return nil end

	local manifest_path = crate_dir:joinpath("Cargo.toml")
	local name_prog = io.popen("cargo read-manifest --manifest-path " .. manifest_path .. " | jq -r .name")
	if name_prog == nil then
		return nil
	end
	return name_prog:read("l")
end

local function build_crate(crate_name, args)
	local command =
		"cargo build " ..
		"	-q " ..
		"	--message-format=json " ..
		"	--package " .. crate_name .. " " ..
		"	" .. args .. " " ..
		"| jq " ..
		"	-r " ..
		"	'select(" ..
		[[		.reason == "compiler-artifact" ]] ..
		[[		and .target.name == "]] .. crate_name .. [["]] ..
		"	) | .filenames[0]'"
	local path_prog = io.popen(command)
	if path_prog == nil then
		return nil
	end
	local path = path_prog:read("l")
	print(path)
	return path
end

local function get_program(args)
	local crate_name = get_crate_name()
	if crate_name == nil then
		print("Failed to find name of current crate!")
		return dap.ABORT
	end

	local exec_path = build_crate(crate_name, args)
	if exec_path == nil then
		print("Failed to compile for debugging!")
		return dap.ABORT
	end

	return exec_path
end

return {
	{
		name = "Debug Application",
		type = "rust_gdb",
		request = "launch",
		program = function()
			return get_program("")
		end
	},
	{
		name = "Debug Application with Arguments",
		type = "rust_gdb",
		request = "launch",
		program = function()
			return get_program("")
		end,
		args = function()
			local args_str = vim.fn.input("Arguments: ")
			return vim.split(args_str, " +")
		end
	},
	{
		name = "Debug Tests",
		type = "rust_gdb",
		request = "launch",
		program = function()
			return get_program("--tests")
		end
	},
	{
		name = "Debug Specific Test",
		type = "rust_gdb",
		request = "launch",
		program = function()
			return get_program("--tests")
		end,
		args = function()
			local test_name = vim.fn.input("Test name: ")
			return test_name
		end
	},
	{
		name = "Debug Custom Executable",
		type = "rust_gdb",
		request = "launch",
		program = function()
			return vim.fn.input("Executable path: ", vim.fn.getcwd() .. "/", "file")
		end
	}
}

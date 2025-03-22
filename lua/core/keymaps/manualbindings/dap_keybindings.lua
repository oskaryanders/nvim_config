-- keybinding.lua

-- Define the DAP keybindings
local dap_keybindings = {
	{
		"<leader>db", -- space + db
		function()
			require("dap").toggle_breakpoint()
		end,
		desc = "Toggle Breakpoint",
	},
	{
		"<leader>dc", -- space + dc
		function()
			require("dap").continue()
		end,
		desc = "Continue",
	},
	{
		"<leader>dC", -- space + dC
		function()
			require("dap").run_to_cursor()
		end,
		desc = "Run to Cursor",
	},
	{
		"<leader>dT", --space + dT
		function()
			require("dap").terminate()
		end,
		desc = "Terminate",
	},
}

return dap_keybindings

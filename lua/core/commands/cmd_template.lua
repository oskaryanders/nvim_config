-- Define the custom command
vim.api.nvim_create_user_command("Theme", function(opts)
	-- Get the argument passed to the command
	local x = opts.args

	-- Trim any leading or trailing whitespace from the argument
	x = vim.trim(x)

	-- Print the argument
	print("Theme selected:", x)
end, { nargs = 1 }) -- Only accept 1 argument

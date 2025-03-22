vim.api.nvim_create_user_command('Prisma', function()
  -- Function to get the visually selected text
  local function get_visual_selection()
    local _, ls, cs = unpack(vim.fn.getpos "'<") -- Start position
    local _, le, ce = unpack(vim.fn.getpos "'>") -- End position
    local lines = vim.fn.getline(ls, le)

    -- Adjust the first and last lines to match selection
    if #lines == 1 then
      lines[1] = lines[1]:sub(cs, ce)
    else
      lines[1] = lines[1]:sub(cs)
      lines[#lines] = lines[#lines]:sub(1, ce)
    end

    return table.concat(lines, '\n'), ls, le
  end

  local selection, start_line, end_line = get_visual_selection()

  -- Ensure the selection is properly formatted and non-empty
  if selection == '' then
    print 'No text selected'
    return
  end

  -- Get the default shell from the environment
  local shell = os.getenv 'SHELL' or '/bin/bash' -- Fallback to bash if not set

  -- Prepare the command to call prisma with the selection passed as stdin
  local command = string.format('%s -l -c \'source ~/.zshrc && echo "%s" | prisma > /tmp/vim_prisma_output.txt\'', shell, selection)

  -- Run the command using os.execute
  local result = os.execute(command)
  if result then
    -- Read the output from the temporary output file
    local output_file = io.open('/tmp/vim_prisma_output.txt', 'r')
    if output_file then
      local output = output_file:read '*a'
      output_file:close()

      -- Replace selected text with the output from the script
      local new_lines = vim.split(output, '\n', { trimempty = true })
      vim.api.nvim_buf_set_lines(0, start_line - 1, end_line, false, new_lines)
    else
      print 'Error reading output file'
    end
  else
    print 'Error executing command'
  end
end, { range = true })

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

  -- Use Python script via stdin and capture output
  local handle = io.popen('python3 x.py', 'w+')
  if handle then
    handle:write(selection) -- Pass selection as input
    handle:close()

    -- Read output from x.py
    local output = io.popen('python3 x.py'):read '*a'

    -- Replace selected text with script output
    local new_lines = vim.split(output, '\n', { trimempty = true })
    vim.api.nvim_buf_set_lines(0, start_line - 1, end_line, false, new_lines)
  else
    print 'Error running x.py'
  end
end, { range = true })

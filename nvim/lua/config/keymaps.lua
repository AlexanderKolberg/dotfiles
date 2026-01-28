vim.keymap.set("n", "<leader>ox", function()
  local r, c = unpack(vim.api.nvim_win_get_cursor(0))
  vim.cmd("!cursor . && cursor -g " .. vim.fn.expand("%") .. ":" .. r .. ":" .. c)
end, { desc = "[O]pen E[x]ternal editor" })

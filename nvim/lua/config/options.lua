-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--
--

-- Eslint
-- Add command `Lint directory` that sets eslint as a complier, launches it for js,ts files in the "directory"
-- and opens Trouble quickfix window with errors
local memoDir = "" -- save directory name
local function eslint(dir)
  vim.cmd([[compiler eslint]])

  if memoDir ~= "" then
    dir = memoDir
  end
  if dir ~= "" then
    memoDir = dir
  end
  -- local files = "*.{ts,js,jsx,tsx,svelte,vue}"
  -- vim.cmd("make " .. dir .. files)
  vim.cmd("make " .. dir)
  vim.cmd([[Trouble quickfix]])
end

vim.api.nvim_create_user_command("Lint", function(opts)
  eslint(opts.args)
end, { nargs = "?", desc = "Use Eslint in the given directory and launch quickfix in Trouble" })

-------------------------------------------
-- Toggle diagnostics
vim.api.nvim_create_user_command("DiagnosticToggle", function()
  if vim.diagnostic.is_disabled() then
    vim.diagnostic.enable()
  else
    vim.diagnostic.disable()
  end
end, { desc = "Toggle diagnostics" })

-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
vim.cmd([[command! -nargs=0 GoToFile :Telescope smart_open]])

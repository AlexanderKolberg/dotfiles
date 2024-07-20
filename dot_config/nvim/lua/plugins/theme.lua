return {
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000,
  opts = {
    transparent_background = true,
    flavour = 'mocha',
    notify = true,
    noice = true,
    fidgit = true,
    navic = {
      enabled = true,
      custom_bg = 'NONE', -- "lualine" will set background to mantle
    },
    config = function()
      vim.cmd.colorscheme 'catppuccin'
    end,
  },
}

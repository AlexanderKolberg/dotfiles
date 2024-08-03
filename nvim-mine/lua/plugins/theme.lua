return {
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000,
  opts = {
    -- transparent_background = true,
    -- flavour = 'mocha',
    color_overrides = {
      mocha = {
        base = '#000000',
        mantle = '#000000',
        crust = '#000000',
      },
    },
    cmp = true,
    notify = true,
    noice = true,
    fidgit = true,
    navic = {
      enabled = true,
      custom_bg = 'NONE',
    },
    which_key = true,
    config = function()
      vim.cmd.colorscheme 'catppuccin-mocha'
    end,
  },
}

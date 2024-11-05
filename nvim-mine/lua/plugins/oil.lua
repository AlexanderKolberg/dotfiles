vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })

return {
  'stevearc/oil.nvim',
  opts = {},
  dependencies = { 'echasnovski/mini.icons', 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('oil').setup {
      default_file_explorer = true,
      delete_to_trash = true,
      skip_confirm_for_simple_edits = true,
      view_options = {
        show_hidden = true,
        natural_order = true,
        is_always_hidden = function(name, _)
          return name == '..' or name == '.git'
        end,
      },
      lsp_file_methods = {
        enabled = true,
        timeout_ms = 1000,
        autosave_changes = false,
      },
      -- C
      float = {
        padding = 2,
        max_width = 90,
        max_height = 0,
      },
      win_options = {
        winbar = "%{v:lua.require('oil').get_current_dir()}",
        wrap = true,
        winblend = 0,
      },
    }
  end,
}

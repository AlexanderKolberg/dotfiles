return {
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    dependencies = { 'hrsh7th/nvim-cmp' },
    config = function()
      require('nvim-autopairs').setup {}
      local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
      local cmp = require 'cmp'
      cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
    end,
  },
  {
    'windwp/nvim-ts-autotag',
    ft = { 'javascript', 'jsx', 'typescript', 'tsx', 'html', 'markdown' },
  },

  {
    'echasnovski/mini.nvim',
    config = function()
      -- Better Around/Inside textobjects
      --
      -- Examples:
      --  - va)  - [V]isually select [A]round [)]paren
      --  - yinq - [Y]ank [I]nside [N]ext [']quote
      --  - ci'  - [C]hange [I]nside [']quote
      require('mini.ai').setup { n_lines = 500 }

      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      --
      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotes
      -- - sr)'  - [S]urround [R]eplace [)] [']
      require('mini.surround').setup()
    end,
  },
  {
    'Wansmer/treesj',
    keys = { { '<leader>sj', '<cmd>TSJToggle<cr>', desc = 'Join Toggle' } },
    opts = { use_default_keymaps = false, max_join_length = 150 },
  },

  {
    'numToStr/Comment.nvim',
    dependencies = {
      'JoosepAlviste/nvim-ts-context-commentstring',
    },
    opts = function(_, opts)
      require('ts_context_commentstring').setup {
        enable_autocmd = false,
      }
      opts.ignore = '^$'
      opts.pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook()
    end,
    event = 'VeryLazy',
  },
}

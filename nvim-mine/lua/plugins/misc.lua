return {
  {
    'rmagatti/auto-session',
    opts = {},
  },
  {
    'axkirillov/easypick.nvim',
    dependencies = { 'nvim-telescope/telescope.nvim' },
    config = function()
      local easypick = require 'easypick'

      local function branch_name()
        local branch = vim.fn.system "git branch --show-current 2> /dev/null | tr -d '\n'"
        if branch ~= '' then
          return branch
        else
          return ''
        end
      end

      easypick.setup {
        pickers = {
          -- diff current branch with base_branch and show files that changed with respective diffs in preview
          {
            name = 'changed_files',
            command = 'git diff --name-only $(git merge-base HEAD ' .. branch_name() .. ' )',
            previewer = easypick.previewers.branch_diff { base_branch = branch_name() },
          },

          -- list files that have conflicts with diffs in preview
          {
            name = 'conflicts',
            command = 'git diff --name-only --diff-filter=U --relative',
            previewer = easypick.previewers.file_diff(),
          },
        },
      }
    end,
  },

  -- 'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
  { 'github/copilot.vim' },
  {
    'alexghergh/nvim-tmux-navigation',
    config = function()
      require('nvim-tmux-navigation').setup {
        disable_when_zoomed = true, -- defaults to false
        keybindings = {
          left = '<C-h>',
          down = '<C-j>',
          up = '<C-k>',
          right = '<C-l>',
          last_active = '<C-\\>',
          next = '<C-Space>',
        },
      }
    end,
  },
  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    opts = {},
    keys = {
      {
        '<leader>?',
        function()
          require('which-key').show { global = false }
        end,
        desc = 'Buffer Local Keymaps (which-key)',
      },
    },
  },
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = {
    'nvim-lua/plenary.nvim',
  }, opts = {
    signs = false,
  } },
}

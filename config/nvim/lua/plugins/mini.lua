return {
  { -- Collection of various small independent plugins/modules
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

      require('mini.notify').setup {
        window = {
          winblend = 0,
          border = vim.g.border,
        },
      }

      require('mini.files').setup {
        content = { prefix = function() end },
      }

      vim.keymap.set(
        'n',
        '<leader>mf',
        '<cmd>lua MiniFiles.open()<CR>',
        { desc = '[M]ini [F]iles' }
      )

      vim.keymap.set(
        'n',
        '-',
        '<cmd>lua MiniFiles.open()<CR>',
        { desc = '[M]ini [F]iles' }
      )

      -- vim.keymap.set('n', '-', require('oil').open, { desc = 'Open parent directory' })

      -- vim.api.nvim_create_autocmd('User', {
      --   pattern = 'MiniFilesWindowOpen',
      --   callback = function(args)
      --     local win_id = args.data.win_id
      --
      --     -- Customize window-local settings
      --     vim.wo[win_id].winblend = 0
      --     vim.api.nvim_win_set_config(win_id, { border = 'double' })
      --   end,
      -- })
    end,
  },
}

-- vim: ts=2 sts=2 sw=2 et

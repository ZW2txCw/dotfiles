return {
  {
    'numToStr/Comment.nvim',
    opts = {},
    dependencies = {
      {
        'JoosepAlviste/nvim-ts-context-commentstring',
        config = function()
          require('ts_context_commentstring').setup {
            enable_autocmd = false,
          }
        end,
      },
    },
    config = function()
      require('Comment').setup {
        padding = true,
        sticky = true,
        ignore = '^$',
        toggler = { line = 'gcc', block = 'gbc' },
        opleader = { line = 'gc', block = 'gb' },
        extra = { above = 'gcO', below = 'gco', eol = 'gcA' },
        mappings = { basic = true, extra = true },
        pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
        post_hook = function() end,
      }
    end,
  },
}

-- vim: ts=2 sts=2 sw=2 et

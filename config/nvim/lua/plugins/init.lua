return {
  {
    dir = '~/.config/nvim/colors',
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd 'colorscheme miasma'
    end,
  },
}

-- vim: ts=2 sts=2 sw=2 et

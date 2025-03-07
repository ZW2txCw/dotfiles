vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.border = 'single'
vim.g.telescope_border = { '─', '│', '─', '│', '┌', '┐', '┘', '└' }

require 'options'
require 'keymaps'

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

local opts = {
  ui = {
    -- border = 'double',
    border = vim.g.border,
    backdrop = 100,
  },
  change_detection = {
    enabled = true,
    notify = false,
  },
}
require('lazy').setup('plugins', opts)

-- vim: ts=2 sts=2 sw=2 et

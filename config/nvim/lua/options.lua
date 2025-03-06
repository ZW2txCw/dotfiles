-- [[ Setting options ]]
-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`
vim.opt.number = true
-- You can also add relative line numbers, to help with jumping.
--  Experiment for yourself to see if you like it!
-- vim.opt.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = true

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.opt.clipboard = 'unnamedplus'

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = false
vim.opt.listchars:prepend { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

vim.opt.shortmess = 'aScWFI'
vim.opt.fillchars:prepend { msgsep = '─', stl = '─', stlnc = '─' }

vim.opt.title = true
vim.opt.titlestring = 'Neovim - %t'
vim.opt.titleold = 'bash'
vim.opt.termguicolors = true
vim.opt.laststatus = 3
vim.opt.foldmethod = 'marker'
vim.opt.hlsearch = true
vim.opt.cmdheight = 1

local function tabline() -- {{{
  local s = ''
  local hl_index, hl_filename, hl_modified
  local aliases = {
    [''] = '[No Name]',
    ['minifiles'] = '[minifiles]',
    ['TelescopePrompt'] = '[tprompt]',
    ['help'] = '[help]',
    ['man'] = '[man]',
    ['lazy'] = '[lazy]',
    ['mason'] = '[mason]',
  }

  for index = 1, vim.fn.tabpagenr '$' do
    local winnr = vim.fn.tabpagewinnr(index)
    local buflist = vim.fn.tabpagebuflist(index)
    local bufnr = buflist[winnr]
    local bufname = vim.fn.bufname(bufnr)
    local bufmodified = vim.fn.getbufvar(bufnr, '&mod')
    local buffiletype = vim.fn.getbufvar(bufnr, '&ft')
    local name = ''
    local modified = ''
    local is_selected = index == vim.fn.tabpagenr()

    hl_index = is_selected and '%#TabLineIndexSel#' or '%#TabLineIndex#'
    hl_filename = is_selected and '%#TabLineSel#' or '%#TabLine#'
    hl_modified = is_selected and '%#TabLineModifiedSel#' or '%#TabLineModified#'

    name = aliases[buffiletype] or string.format(' %s ', vim.fn.pathshorten(bufname))
    -- name = bufname == '' and rename[buffiletype] or vim.fn.pathshorten(bufname)

    if bufmodified == 1 and buffiletype ~= 'TelescopePrompt' then
      modified = '[+]'
    end

    s = s .. '%' .. index .. 'T'
    s = s .. hl_index .. ' ' .. index .. ':'
    s = s .. hl_filename .. name
    s = s .. hl_modified .. modified .. ' '
  end
  s = s .. '%#TabLineFill#'
  return s
end -- }}}

function _G.nvim_tabline() -- {{{
  return tabline()
end -- }}}

vim.opt.showtabline = 1
vim.opt.tabline = '%!v:lua.nvim_tabline()'

-- vim: ts=2 sts=2 sw=2 et

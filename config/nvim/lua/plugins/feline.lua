return {
  {
    -- 'freddiehaddad/feline.nvim',
    dir = '~/.config/nvim/feline.nvim',
    opts = {},
    config = function()
      local lsp = require 'feline.providers.lsp'

      local function filename(hl) -- {{{
        return {
          provider = function()
            return vim.bo.filetype == '' and '[No Name]' or ' %t '
          end,
          hl = hl,
        }
      end -- }}}

      local function position() -- {{{
        return {
          provider = function()
            return string.format(' %4d,%-3d ', unpack(vim.api.nvim_win_get_cursor(0)))
          end,
          enabled = function()
            return vim.fn.getfsize(vim.fn.expand '%:p') > 0
          end,
          hl = 'FelinePosition',
        }
      end -- }}}

      local function search_count() -- {{{
        return {
          provider = 'search_count',
          hl = 'FelineSearchCount',
        }
      end -- }}}

      local function fill() -- {{{
        return {
          hl = 'FelineFill',
        }
      end -- }}}

      local function git(provider, icon, hl) -- {{{
        return {
          provider = string.format('git_diff_%s', provider),
          hl = hl,
          icon = {
            str = icon,
            hl = hl,
          },
          right_sep = {
            str = ' ',
            hl = 'FelineSeparator',
          },
        }
      end -- }}}

      local function diagnostic(provider, severity, icon, hl) -- {{{
        return {
          provider = string.format('diagnostic_%s', provider),
          enabled = function()
            return lsp.diagnostics_exist(vim.diagnostic.severity[severity])
          end,
          hl = hl,
          icon = {
            str = string.format('%s:', icon),
            hl = hl,
          },
          right_sep = {
            str = ' ',
            hl = 'FelineSeparator',
          },
        }
      end -- }}}

      local function modified() -- {{{
        return {
          provider = '%m',
          hl = 'FelineModified',
        }
      end -- }}}

      require('feline').setup {
        components = {
          active = { { fill() }, {} },
          inactive = { { fill() }, {} },
        },
      }

      local function winbar_active() -- {{{
        return {
          { -- left
            fill(),
          },
          { -- right
            diagnostic('errors', 'ERROR', 'E', 'FelineDiagnosticError'),
            diagnostic('warnings', 'WARN', 'W', 'FelineDiagnosticWarn'),
            diagnostic('info', 'INFO', 'I', 'FelineDiagnosticInfo'),
            diagnostic('hints', 'HINT', 'H', 'FelineDiagnosticHint'),
            git('added', '+', 'FelineGitAdd'),
            git('changed', '~', 'FelineGitChange'),
            git('removed', '-', 'FelineGitDelete'),
            search_count(),
            position(),
            modified(),
            filename 'FelineFileName',
          },
        }
      end -- }}}

      local function winbar_inactive() -- {{{
        return {
          { -- left
            fill(),
          },
          { -- right
            modified(),
            filename 'FelineFileNameNC',
          },
        }
      end -- }}}

      require('feline').winbar.setup {
        components = {
          active = winbar_active(),
          inactive = winbar_inactive(),
        },
      }
    end,
  },
}

-- vim: ts=2 sts=2 sw=2 et

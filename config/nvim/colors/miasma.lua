-- miasma.lua

vim.cmd 'hi clear'
vim.cmd 'syntax reset'
vim.g.colors_name = 'miasma'
vim.opt.background = 'dark'
vim.opt.termguicolors = true

local bg = '#222222'
local bg2 = '#1c1c1c'
local brown = '#685742'
local green = '#5f875f'
local green2 = '#78824b'
local green3 = '#a0a35d'
local grey = '#666666'
local grey2 = '#323232'
local orange = '#bb7744'
local orange2 = '#b36d43'
local red = '#bf616a'
local white = '#d7c483'
local yellow = '#c9a554'

local invisible = { fg = bg, bg = bg }
local error = { fg = '#ac5c5c', bg = '#392929' }
local warn = { fg = '#986c46', bg = '#352c24' }
local info = { fg = '#777777', bg = '#2e2e2e' }
local hint = { fg = '#597f7f', bg = '#283030' }

for index, value in ipairs {
  '#222222', -- black (bg)
  '#685742', -- red (brown)
  '#5f875f', -- green (green)
  '#b36d43', -- yellow (orange2)
  '#78824b', -- blue (green2)
  '#bb7744', -- magenta (orange)
  '#c9a554', -- cyan (yellow)
  '#d7c483', -- white (white)

  '#666666', -- bright black (grey)
  '#685742', -- bright red
  '#5f875f', -- bright green
  '#b36d43', -- bright yellow
  '#78824b', -- bright blue
  '#bb7744', -- bright magenta
  '#c9a554', -- bright cyan
  '#d7c483', -- bright white
} do
  vim.g['terminal_color_' .. index - 1] = value
end

for name, attrs in pairs {
  -- -------------------------------------------------------------------------------------------
  Normal = { fg = white, bg = bg },
  NormalNC = 'Normal',
  --
  NormalFloat = 'Normal',
  FloatBorder = 'Comment',
  FloatTitle = 'Title',
  --
  Search = { fg = bg, bg = green, bold = true },
  IncSearch = { fg = bg, bg = orange, bold = true },
  CurSearch = 'IncSearch',
  Substitute = 'Search',
  QuickFixLine = 'Search',
  Visual = { fg = bg, bg = green, bold = true },
  MatchParen = { fg = white, bold = true, underline = true },
  --
  Pmenu = { fg = white, bg = '#43492a' },
  PmenuSel = { fg = bg, bg = white, bold = true },
  PmenuKind = 'Pmenu',
  PmenuKindSel = 'PmenuSel',
  PmenuExtra = 'Pmenu',
  PmenuExtraSel = 'PmenuSel',
  PmenuSbar = { bg = grey },
  PmenuThumb = { fg = white, bg = white },
  --
  StatusLine = { fg = grey2, bg = bg },
  StatusLineNC = { fg = grey2, bg = bg, italic = true },
  WinSeparator = { fg = grey2 },
  --
  WinBar = { fg = bg, bg = green2, bold = true },
  WinBarNC = { fg = green3, bg = grey2 },
  --
  TabLine = 'WinBarNC',
  TabLineSel = 'WinBar',
  TabLineIndex = { fg = white, bg = bg },
  TabLineIndexSel = { fg = white, bg = bg },
  TabLineModified = { fg = orange, bg = bg },
  TabLineModifiedSel = { fg = orange, bg = bg },
  TabLineFill = { fg = grey2, bg = bg, underline = true },
  --
  LineNr = { fg = grey, bg = bg2 },
  LineNrAbove = 'LineNr',
  LineNrBelow = 'LineNr',
  SignColumn = 'LineNr',
  ColorColumn = {},
  --
  Cursor = { fg = bg, bg = brown },
  lCursor = { fg = bg, bg = white },
  CursorColumn = { bg = bg2 },
  CursorLine = { bg = '#282828' },
  CursorLineNr = { fg = orange2, bg = bg2, bold = true },
  CursorLineFold = 'FoldColumn',
  CursorLineSign = 'SignColumn',
  TermCursor = { reverse = true },
  --
  DiffAdd = { fg = bg, bg = green },
  DiffChange = { fg = bg, bg = brown },
  DiffDelete = { fg = bg, bg = orange2 },
  DiffText = { fg = bg, bg = yellow },
  --
  Folded = { fg = orange, bg = bg },
  FoldColumn = { fg = grey, bg = bg2 },
  --
  ErrorMsg = { fg = orange2 },
  WarningMsg = { fg = orange2 },
  ModeMsg = { fg = white, bold = true },
  MoreMsg = { fg = yellow },
  MsgArea = {},
  MsgSeparator = 'WinSeparator',
  --
  Conceal = 'Ignore',
  Directory = { fg = green2 },
  EndOfBuffer = 'NonText',
  NonText = { fg = grey, bold = true },
  Question = { fg = orange },
  SpecialKey = { fg = white },
  SpellBad = { fg = brown, sp = white, underline = true },
  SpellCap = { fg = green, sp = white, underline = true },
  SpellLocal = { fg = orange, sp = white, underline = true },
  SpellRare = { fg = orange2, sp = white, underline = true },
  Title = { fg = orange2, bold = true },
  Whitespace = 'NonText',
  WildMenu = { fg = 'black', bg = yellow },
  -- -------------------------------------------------------------------------------------------
  Comment = { fg = grey },
  --
  Constant = { fg = orange },
  String = { fg = brown },
  Character = 'Constant',
  Number = { fg = green2 },
  Boolean = { fg = green2 },
  Float = 'Number',
  --
  Identifier = { fg = white },
  Function = { fg = green2 },
  --
  Statement = { fg = green, bold = true },
  Conditional = 'Statement',
  Repeat = 'Statement',
  Label = 'Statement',
  Operator = 'Delimiter',
  Keyword = { fg = green },
  Exception = 'Statement',
  --
  PreProc = 'Keyword',
  Include = 'PreProc',
  Define = 'PreProc',
  Macro = 'PreProc',
  PreCondit = 'PreProc',
  --
  Type = { fg = green2, bold = true },
  StorageClass = 'Type',
  Structure = 'Type',
  Typedef = 'Type',
  --
  Special = { fg = orange },
  SpecialChar = 'Special',
  Tag = 'Special',
  Delimiter = { fg = white },
  SpecialComment = 'Special',
  Debug = 'Special',
  --
  Underlined = { fg = green2, underline = true },
  --
  Ignore = { fg = '#444444', underline = true },
  --
  Error = 'DiagnosticError',
  --
  Todo = { fg = white, bold = true, underline = true },
  -- -------------------------------------------------------------------------------------------
  LazySpecial = { fg = bg2 },
  LazyButton = { fg = bg2, bg = brown },
  LazyButtonActive = { fg = bg2, bg = green },
  -- -------------------------------------------------------------------------------------------
  FelineFileName = 'WinBar',
  FelineFileNameNC = 'WinBarNC',
  FelineFill = invisible,
  FelinePosition = { fg = white, bg = grey2 },
  FelineSearchCount = 'Folded',
  FelineModified = { fg = orange, bg = bg },
  FelineSeparator = invisible,
  FelineGitAdd = { fg = green, bg = bg },
  FelineGitChange = { fg = info.fg, bg = bg },
  FelineGitDelete = { fg = error.fg, bg = bg },
  FelineDiagnosticError = { fg = error.fg, bg = bg },
  FelineDiagnosticWarn = { fg = warn.fg, bg = bg },
  FelineDiagnosticInfo = { fg = info.fg, bg = bg },
  FelineDiagnosticHint = { fg = hint.fg, bg = bg },
  -- -------------------------------------------------------------------------------------------
  GitSignsAdd = { fg = green, bg = bg2 },
  GitSignsChange = { fg = brown, bg = bg2 },
  GitSignsDelete = { fg = orange2, bg = bg2 },
  -- -------------------------------------------------------------------------------------------
  CmpItemAbbr = { fg = white, bold = true },
  CmpItemAbbrMatch = { fg = red, bold = true },
  CmpItemAbbrMatchFuzzy = { fg = red, bold = true },
  -- -------------------------------------------------------------------------------------------
  DiagnosticError = error,
  DiagnosticWarn = warn,
  DiagnosticInfo = info,
  DiagnosticHint = hint,
  DiagnosticOk = { fg = green2 },
  --
  DiagnosticUnderlineError = { underline = true },
  DiagnosticUnderlineWarn = { underline = true },
  DiagnosticUnderlineInfo = { underline = true },
  DiagnosticUnderlineHint = { underline = true },
  DiagnosticUnderlineOk = { underline = true },
  --
  DiagnosticDeprecated = { sp = brown, strikethrough = true },
  DiagnosticUnnecessary = { fg = grey, underline = true },
  -- -------------------------------------------------------------------------------------------
  MiniNotifyNormal = { fg = grey, bg = bg },
  MiniNotifyBorder = { fg = grey, bg = bg },
  MiniNotifyTitle = 'Title',
  -- -------------------------------------------------------------------------------------------
  WhichKey = { fg = white, bg = bg },
  WhichKeyGroup = { fg = orange, bg = bg },
  WhichKeySeparator = { fg = grey, bg = bg },
  WhichKeyDesc = { fg = green, bg = bg },
  WhichKeyFloat = { bg = bg },
  WhichKeyBorder = 'FloatBorder',
  WhichKeyValue = { fg = brown, bg = bg },
  -- -------------------------------------------------------------------------------------------
  TelescopePromptBorder = 'FloatBorder',
  TelescopeResultsBorder = 'FloatBorder',
  TelescopePreviewBorder = 'FloatBorder',
  TelescopeNormal = { fg = grey, bold = true },
  TelescopeTitle = { fg = green, bold = true },
  TelescopeMatching = { fg = orange, bold = true },
  TelescopeSelection = { fg = '#bcbcbc', bold = true },
  TelescopeSelectionCaret = { fg = orange, bold = true },
  TelescopePromptNormal = { fg = '#bcbcbc' },
  TelescopePromptPrefix = { fg = green, bold = true },
  -- -------------------------------------------------------------------------------------------
  LspReferenceRead = { fg = green, sp = '#fd9720', bold = true, underline = true },
  LspReferenceText = {
    fg = white,
    bg = '#43492a',
    sp = '#fd9720',
    bold = true,
    underline = true,
  },
  LspReferenceWrite = { fg = green, sp = '#fd9720', bold = true, underline = true },
  LspCodeLens = 'Comment',
  LspSignatureActiveParameter = {
    sp = '#fbec9f',
    bold = true,
    italic = true,
    underline = true,
  },
  LspInfoBorder = 'FloatBorder',
  -- -------------------------------------------------------------------------------------------
  helpExample = 'String',
  helpHeadline = 'Title',
  helpHyperTextEntry = 'Statement',
  helpHyperTextJump = 'Underlined',
  helpSectionDelim = 'Comment',
  helpURL = 'Underlined',
  -- -------------------------------------------------------------------------------------------
  markdownCodeBlock = 'String',
  markdownCodeDelimiter = 'NonText',
  markdownHeadingRule = 'NonText',
  markdownLinkDelimiter = 'Delimiter',
  markdownURLDelimiter = 'Delimiter',
  markdownBold = { bold = true },
  markdownItalic = { underline = true },
  -- -------------------------------------------------------------------------------------------
  ['@boolean'] = 'Boolean',
  ['@comment'] = 'Comment',
  ['@constant.builtin'] = 'Special',
  ['@constant'] = 'Constant',
  ['@constructor'] = 'Special',
  ['@field'] = 'Identifier',
  ['@function.builtin'] = 'Special',
  ['@function'] = 'Function',
  ['@keyword'] = 'Keyword',
  ['@lsp.type.comment'] = 'Comment',
  ['@lsp.type.decorator'] = 'Function',
  ['@lsp.type.enumMember'] = 'Constant',
  ['@lsp.type.function'] = 'Function',
  ['@lsp.type.method'] = 'Function',
  ['@lsp.type.parameter'] = 'Type',
  ['@lsp.type.property'] = 'Identifier',
  ['@lsp.type.type'] = 'Type',
  ['@lsp.type.variable'] = 'Identifier',
  ['@method'] = 'Function',
  ['@namespace'] = 'Identifier',
  ['@parameter'] = 'Identifier',
  ['@preproc'] = 'PreProc',
  ['@property'] = 'Identifier',
  ['@punctuation'] = 'Delimiter',
  ['@number'] = 'Number',
  ['@string'] = 'String',
  ['@text.diff.add'] = 'DiffAdd',
  ['@text.diff.delete'] = 'DiffDelete',
  ['@text.literal'] = 'Comment',
  ['@text.reference'] = 'Identifier',
  ['@text.title'] = 'Title',
  ['@text.todo'] = 'Todo',
  ['@text.underline'] = 'Underlined',
  ['@text.uri'] = 'Underlined',
  ['@type'] = 'Type',
  ['@variable'] = 'Identifier',
  ['@variable.builtin'] = 'Constant',
  ['@variable.builtin.tmux'] = 'Identifier',
  ['@string.special.symbol'] = { fg = yellow },
  ['@string.escape'] = { fg = yellow },
  ['@string.special.path'] = 'Underlined',
  ['@string.special.url'] = 'Underlined',
  -- elixir
  ['@tag.heex'] = 'Function',
  ['@tag.attribute.heex'] = { fg = yellow },
  -- xml
  ['@tag.xml'] = 'Function',
  ['@tag.delimiter.xml'] = 'Special',
  ['@tag.attribute.xml'] = { fg = yellow },
  -- html
  ['@tag.html'] = 'Function',
  ['@tag.delimiter.html'] = 'Special',
  ['@tag.attribute.html'] = { fg = yellow },
  ['@markup.heading.html'] = 'Identifier',
  -- javascript
  ['@tag.attribute.javascript'] = { fg = yellow },
  ['@tag.builtin.javascript'] = 'Function',
  -- php
  ['@function.blade'] = { fg = green },
  ['@punctuation.bracket.php'] = 'Special',
} do
  if type(attrs) == 'table' then
    vim.api.nvim_set_hl(0, name, attrs)
  else
    vim.api.nvim_set_hl(0, name, { link = attrs })
  end
end

-- vim: ts=2 sts=2 sw=2 et

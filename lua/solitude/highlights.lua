local p = require("solitude.palette")
local h = {
  -- Traditional syntax groups are also fallbacks for plugin highlights.
  String = { fg = p.string },
  Character = { link = "String" },
  Constant = { fg = p.orange },
  Boolean = { link = "Constant" },
  Float = { link = "Number" },
  Keyword = { link = "Statement" },
  PreProc = { link = "Statement" },
  Type = { fg = p.fg_soft },
  Special = { fg = p.sand },
  Delimiter = { fg = p.fg_faint },
  SolitudePunctuation = { fg = p.sand },
  Operator = { fg = p.orange },
  SolitudeProperty = { fg = p.fg },
  Underlined = { fg = p.sand, underline = true },
  Todo = { fg = p.orange, bold = true },
  Error = { fg = p.red },

  -- Core interface.
  NormalNC = { link = "Normal" },
  NormalFloat = { fg = p.fg, bg = p.bg_surface },
  FloatBorder = { fg = p.border_focus, bg = p.bg_surface },
  FloatTitle = { fg = p.fg, bg = p.bg_surface, bold = true },
  WinSeparator = { fg = p.border },
  SignColumn = { fg = p.fg_faint, bg = p.bg },
  FoldColumn = { link = "SignColumn" },
  Folded = { fg = p.fg_muted, bg = p.bg_surface },
  LineNr = { fg = p.fg_faint },
  CursorLineNr = { fg = p.fg, bold = true },
  CursorLine = { bg = p.bg_hover },
  CursorColumn = { link = "CursorLine" },
  ColorColumn = { bg = p.bg_surface },
  EndOfBuffer = { fg = p.border },
  NonText = { fg = p.border_focus },
  Whitespace = { link = "NonText" },
  SpecialKey = { link = "NonText" },
  Pmenu = { fg = p.fg, bg = p.bg_surface },
  PmenuSel = { fg = p.fg, bg = p.selection },
  PmenuSbar = { bg = p.bg_active },
  PmenuThumb = { bg = p.border_focus },
  PmenuMatch = { fg = p.sand, bold = true },
  PmenuMatchSel = { fg = p.sand, bg = p.selection, bold = true },
  StatusLine = { fg = p.fg, bg = p.bg_active },
  StatusLineNC = { fg = p.fg_faint, bg = p.bg_surface },
  WinBar = { fg = p.fg_muted, bg = p.bg },
  WinBarNC = { fg = p.fg_faint, bg = p.bg },
  TabLine = { link = "StatusLineNC" },
  TabLineFill = { bg = p.bg_surface },
  TabLineSel = { fg = p.fg, bg = p.bg_active, bold = true },
  Search = { fg = p.yellow, bg = p.selection },
  IncSearch = { fg = p.bg, bg = p.orange },
  CurSearch = { link = "IncSearch" },
  Substitute = { link = "IncSearch" },
  MatchParen = { fg = p.orange, bg = p.selection, bold = true },
  VisualNOS = { link = "Visual" },
  Title = { fg = p.fg, bold = true },
  Question = { fg = p.green },
  MoreMsg = { fg = p.fg_muted },
  ModeMsg = { fg = p.fg_muted },
  ErrorMsg = { fg = p.red },
  WarningMsg = { fg = p.yellow },

  -- Blink completion: quiet labels with sand matches and grey selection.
  BlinkCmpMenu = { fg = p.fg_muted, bg = p.bg_surface },
  BlinkCmpMenuBorder = { fg = p.border_focus, bg = p.bg_surface },
  BlinkCmpMenuSelection = { bg = p.selection },
  BlinkCmpLabel = { fg = p.fg_muted },
  BlinkCmpLabelMatch = { fg = p.sand, bold = true },
  BlinkCmpLabelDeprecated = { fg = p.fg_faint, strikethrough = true },
  BlinkCmpLabelDetail = { fg = p.fg_dim },
  BlinkCmpLabelDescription = { fg = p.fg_dim },
  BlinkCmpSource = { fg = p.fg_dim },
  BlinkCmpKind = { fg = p.fg_secondary },
  BlinkCmpGhostText = { fg = p.fg_faint },

  -- Documentation and signature popups.
  BlinkCmpDoc = { fg = p.fg_muted, bg = p.bg_surface },
  BlinkCmpDocBorder = { link = "BlinkCmpMenuBorder" },
  BlinkCmpDocSeparator = { fg = p.border_focus, bg = p.bg_surface },
  BlinkCmpDocCursorLine = { bg = p.bg_hover },
  BlinkCmpSignatureHelp = { link = "BlinkCmpDoc" },
  BlinkCmpSignatureHelpBorder = { link = "BlinkCmpMenuBorder" },
  BlinkCmpSignatureHelpActiveParameter = { fg = p.sand, bold = true },

  -- Commit-message syntax is separate from Fugitive's status buffer.
  gitcommitComment = { link = "Comment" },
  gitcommitBranch = { fg = p.sand },
  gitcommitHash = { fg = p.fg_faint },
  gitcommitSummary = { fg = p.fg },
  gitcommitHeader = { fg = p.fg_muted, bold = true },
  gitcommitType = { fg = p.fg_muted },
  gitcommitFile = { fg = p.fg_muted },
  gitcommitSelectedFile = { fg = p.green },
  gitcommitDiscardedFile = { fg = p.orange },
  gitcommitUntrackedFile = { fg = p.fg_muted },
  gitcommitUnmergedFile = { fg = p.red },

  -- Gitsigns uses its own gutter groups and modern Added/Changed fallbacks.
  Added = { fg = p.green },
  Changed = { fg = p.orange },
  Removed = { fg = p.red },
  GitSignsAdd = { link = "Added" },
  GitSignsChange = { link = "Changed" },
  GitSignsDelete = { link = "Removed" },
  GitSignsChangedelete = { link = "GitSignsChange" },
  GitSignsTopdelete = { link = "GitSignsDelete" },
  GitSignsUntracked = { link = "GitSignsAdd" },
}

-- Each severity uses the same hue for text, signs, and underlines.
local diagnostics = {
  Error = p.red, Warn = p.yellow, Info = p.fg_muted,
  Hint = p.sand, Ok = p.green,
}
for severity, color in pairs(diagnostics) do
  h["Diagnostic" .. severity] = { fg = color }
  for _, kind in ipairs({ "Sign", "Floating", "VirtualText", "VirtualLines" }) do
    h["Diagnostic" .. kind .. severity] = { link = "Diagnostic" .. severity }
  end
  h["DiagnosticUnderline" .. severity] = { sp = color, undercurl = true }
end
h.DiagnosticDeprecated = { strikethrough = true }
h.DiagnosticUnnecessary = { fg = p.fg_faint }
for group, color in pairs({ SpellBad = p.red, SpellCap = p.yellow, SpellLocal = p.sand, SpellRare = p.fg_muted }) do
  h[group] = { sp = color, undercurl = true }
end

-- Capture links keep Treesitter colors tied to the traditional syntax roles.
local captures = {
  ["@variable"] = "Identifier",
  ["@variable.builtin"] = "Special",
  ["@variable.parameter"] = "Identifier",
  ["@variable.member"] = "SolitudeProperty",
  ["@constant"] = "Constant",
  ["@constant.builtin"] = "Constant",
  ["@module"] = "Type",
  ["@label"] = "Statement",
  ["@string"] = "String",
  ["@string.delimiter"] = "String",
  ["@string.escape"] = "String",
  ["@string.regexp"] = "String",
  ["@string.special"] = "String",
  ["@character"] = "Character",
  ["@boolean"] = "Boolean",
  ["@number"] = "Number",
  ["@type"] = "Type",
  ["@type.builtin"] = "Type",
  ["@attribute"] = "Special",
  ["@property"] = "SolitudeProperty",
  ["@function"] = "Function",
  ["@function.builtin"] = "Function",
  ["@function.method"] = "Function",
  ["@constructor"] = "Type",
  ["@operator"] = "Operator",
  ["@keyword"] = "Keyword",
  ["@keyword.operator"] = "Operator",
  ["@punctuation"] = "Delimiter",
  ["@punctuation.bracket"] = "Delimiter",
  ["@punctuation.delimiter"] = "SolitudePunctuation",
  ["@punctuation.special"] = "Special",
  ["@comment"] = "Comment",
  ["@comment.todo"] = "Todo",
  ["@comment.error"] = "DiagnosticError",
  ["@comment.warning"] = "DiagnosticWarn",
  ["@comment.note"] = "DiagnosticInfo",
  ["@tag"] = "Keyword",
  ["@tag.attribute"] = "Special",
  ["@tag.delimiter"] = "Delimiter",
  ["@markup.heading"] = "Title",
  ["@markup.raw"] = "Constant",
  ["@markup.link"] = "Underlined",
  ["@markup.link.url"] = "Underlined",
  ["@markup.list"] = "Delimiter",
  ["@diff.plus"] = "diffAdded",
  ["@diff.minus"] = "diffRemoved",
  ["@diff.delta"] = "diffChanged",
}
for capture, target in pairs(captures) do
  h[capture] = { link = target }
end
h["@markup.strong"] = { fg = p.red, bold = true }
h["@markup.italic"] = { fg = p.sand, italic = true }
h["@markup.strikethrough"] = { strikethrough = true }

-- LSP token types reuse the same roles as Treesitter.
local semantic_types = {
  class = "Type", comment = "Comment", decorator = "Special",
  enum = "Type", enumMember = "Constant", event = "Special",
  ["function"] = "Function", interface = "Type", keyword = "Keyword",
  macro = "PreProc", method = "Function", modifier = "Keyword",
  namespace = "Type", number = "Number", operator = "Operator",
  parameter = "Identifier", property = "SolitudeProperty", regexp = "String",
  string = "String", struct = "Type", type = "Type",
  typeParameter = "Type", variable = "Identifier",
}
for token, target in pairs(semantic_types) do
  h["@lsp.type." .. token] = { link = target }
end
h["@lsp.mod.deprecated"] = { strikethrough = true }
h.LspReferenceText = { bg = p.bg_active }
h.LspReferenceRead = { link = "LspReferenceText" }
h.LspReferenceWrite = { link = "LspReferenceText" }
h.LspSignatureActiveParameter = { fg = p.orange, bold = true }
h.LspInlayHint = { fg = p.fg_faint, bg = p.bg_subtle }

return h

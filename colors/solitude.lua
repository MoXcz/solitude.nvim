-- Solitude: neutral backgrounds with coral red and muted blue accents.
vim.opt.termguicolors = true
vim.opt.background = "dark"

-- Clear highlights from the previous theme before applying this one.
vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then
  vim.cmd("syntax reset")
end
vim.g.colors_name = "solitude"

-- Keep the starter palette here until lua/solitude/palette.lua is ready.
local palette = {
  bg = "#121212",
  bg_add = "#19251e",
  bg_change = "#1c242b",
  bg_change_text = "#2d3e4a",
  bg_delete = "#2b1b1b",
  blue = "#6991b7",
  blue_muted = "#8b9eae",
  fg = "#e5e5e5",
  fg_faint = "#737373",
  fg_muted = "#b4b4b4",
  green = "#629c7d",
  orange = "#e49a44",
  red = "#df6464",
  selection = "#323232",
  steel_muted = "#7e929f",
  teal = "#4a8b8b",
}

local highlights = {
  Normal = { fg = palette.fg, bg = palette.bg },
  Comment = { fg = palette.fg_faint },
  Statement = { fg = palette.red },
  Function = { fg = palette.blue },
  Identifier = { fg = palette.steel_muted },
  Visual = { bg = palette.selection },
  Number = { fg = palette.orange },
  Directory = { fg = palette.blue_muted },
  OilDir = { fg = palette.fg },
  OilFile = { fg = "#a7a7a7" },
  OilLink = { fg = "#b14242" },

  -- Fugitive: quiet headings, with color on meaningful status markers.
  fugitiveHeader = { fg = palette.fg_muted },
  fugitiveHeading = { fg = palette.fg, bold = true },
  fugitiveUntrackedHeading = { link = "fugitiveHeading" },
  fugitiveUnstagedHeading = { link = "fugitiveHeading" },
  fugitiveStagedHeading = { link = "fugitiveHeading" },
  fugitiveModifier = { fg = palette.fg_muted },
  fugitiveUntrackedModifier = { fg = palette.blue_muted },
  fugitiveUnstagedModifier = { fg = palette.orange },
  fugitiveStagedModifier = { fg = palette.green },
  fugitiveSymbolicRef = { fg = palette.blue_muted },
  fugitiveHash = { fg = palette.fg_faint },
  fugitiveCount = { fg = palette.fg_muted },
  fugitiveHelpHeader = { link = "fugitiveHeader" },
  fugitiveHelpTag = { fg = palette.teal },
  fugitiveInstruction = { fg = palette.orange },
  fugitiveDone = { fg = palette.fg_faint },
  fugitiveStop = { fg = palette.red, bold = true },

  -- Patch syntax, including expanded hunks in Fugitive's status buffer.
  diffAdded = { fg = palette.green },
  diffRemoved = { fg = palette.red },
  diffChanged = { fg = palette.orange },
  diffLine = { fg = palette.blue_muted },
  diffFile = { fg = palette.fg_muted },
  diffIndexLine = { fg = palette.fg_faint },
  diffNewFile = { fg = palette.green },
  diffOldFile = { fg = palette.red },

  -- Background-only highlights preserve syntax colors in diff mode.
  DiffAdd = { bg = palette.bg_add },
  DiffDelete = { fg = palette.fg_faint, bg = palette.bg_delete },
  DiffChange = { bg = palette.bg_change },
  DiffText = { bg = palette.bg_change_text },
}

for group, options in pairs(highlights) do
  vim.api.nvim_set_hl(0, group, options)
end

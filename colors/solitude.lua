-- Solitude: neutral text with restrained coral and warm accents.
vim.opt.termguicolors = true
vim.opt.background = "dark"

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then
  vim.cmd("syntax reset")
end
vim.g.colors_name = "solitude"

-- Reload modules so :colorscheme solitude also picks up palette edits.
for _, module in ipairs({ "palette", "terminal", "highlights" }) do
  package.loaded["solitude." .. module] = nil
end
local palette = require("solitude.palette")

local highlights = {
  Normal = { fg = palette.fg, bg = palette.bg },
  Comment = { fg = palette.fg_faint },
  Statement = { fg = palette.red },
  Function = { fg = palette.fg },
  Identifier = { fg = palette.fg_muted },
  Visual = { bg = palette.selection },
  Number = { fg = palette.orange },
  Directory = { fg = palette.fg_muted },
  OilDir = { fg = palette.fg_muted },
  OilFile = { fg = palette.blue_muted },
  OilLink = { fg = palette.red_muted },

  -- Fugitive: quiet headings, with color on meaningful status markers.
  fugitiveHeader = { fg = palette.fg_muted },
  fugitiveHeading = { fg = palette.fg, bold = true },
  fugitiveUntrackedHeading = { link = "fugitiveHeading" },
  fugitiveUnstagedHeading = { link = "fugitiveHeading" },
  fugitiveStagedHeading = { link = "fugitiveHeading" },
  fugitiveModifier = { fg = palette.fg_muted },
  fugitiveUntrackedModifier = { fg = palette.fg_muted },
  fugitiveUnstagedModifier = { fg = palette.orange },
  fugitiveStagedModifier = { fg = palette.green },
  fugitiveSymbolicRef = { fg = palette.sand },
  fugitiveHash = { fg = palette.fg_faint },
  fugitiveCount = { fg = palette.fg_muted },
  fugitiveHelpHeader = { link = "fugitiveHeader" },
  fugitiveHelpTag = { fg = palette.sand },
  fugitiveInstruction = { fg = palette.orange },
  fugitiveDone = { fg = palette.fg_faint },
  fugitiveStop = { fg = palette.red, bold = true },

  -- Patch syntax, including expanded hunks in Fugitive's status buffer.
  diffAdded = { fg = palette.green },
  diffRemoved = { fg = palette.red },
  diffChanged = { fg = palette.orange },
  diffLine = { fg = palette.fg_muted },
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

for group, options in pairs(require("solitude.highlights")) do
  vim.api.nvim_set_hl(0, group, options)
end

local terminal = require("solitude.terminal")
for slot = 0, 15 do
  vim.g["terminal_color_" .. slot] = terminal[slot]
end

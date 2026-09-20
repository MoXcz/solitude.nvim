local p = require("solitude.palette")
-- ANSI slots start at zero. Bright accents intentionally reuse normal accents.
return {
  [0] = p.border,
  p.red, p.green, p.yellow, p.blue, p.magenta, p.teal, p.fg_soft,
  p.fg_faint,
  p.red, p.green, p.yellow, p.blue, p.magenta, p.teal, p.white,
}

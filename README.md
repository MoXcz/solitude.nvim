# Solitude

A dark Neovim colorscheme with mostly neutral text, restrained coral and sand
accents, warm-grey strings, and background-only grey selection. Muted sage marks
Git additions and success. Includes matching Kitty and Obsidian palette exports.

## Load locally

```lua
vim.cmd.colorscheme("solitude")
vim.opt.runtimepath:prepend(vim.fn.expand("~/workspace/github.com/solitude.nvim"))
```

The repository can also be installed using a Neovim plugin manager. Load the
colorscheme after making the plugin available on `runtimepath`.

## Where to edit

| File                          | Responsibility                                              |
| ----------------------------- | ----------------------------------------------------------- |
| `lua/solitude/palette.lua`    | Alphabetized, shared hex colors                             |
| `colors/solitude.lua`         | Loader, original syntax, Oil, Fugitive, and diff highlights |
| `lua/solitude/highlights.lua` | Core UI, commit messages, diagnostics, Treesitter, and LSP  |
| `lua/solitude/terminal.lua`   | ANSI slots 0–15 for Neovim and Kitty                        |
| `scripts/export.lua`          | Maps the palette to Kitty settings and Obsidian CSS         |

## Generate exports

With Neovim 0.9 or newer, run from the repository root:

```sh
nvim --headless -u NONE -l scripts/export.lua
```

Edit the palette or exporter rather than the generated files.

### Kitty

Add an absolute include path to `~/.config/kitty/kitty.conf`:

```conf
include ~/<path_to_solitude.conf>
```

Place it after other theme includes, then reload Kitty's configuration. Selection
uses `selection_foreground none` to retain the selected text's existing colors.
Open a new Neovim terminal buffer when checking changes to its ANSI palette.

### Obsidian

This export is a palette snippet, not a standalone theme. It overrides syntax
colors and should be copied from `extras/obsidian/solitude-palette.css` to your
vault's `.obsidian/snippets/` directory. Then enable it in Settings -> Appearance -> CSS snippets.

### Starship

Standalone `starship.toml` file with theme changes and personal preferences.

> This one is not reloaded by `export.lua` and is meant to be that way.

## License

MIT. See `LICENSE`.

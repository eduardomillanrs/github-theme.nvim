# AGENTS.md — Guide for AI agents working on github-theme.nvim

This file documents the project structure, conventions, and design decisions
so that future AI-assisted work stays consistent with the original intent.

## Project summary

`github-theme.nvim` is a Neovim colorscheme port of the GitHub VSCode theme
(`primer/github-vscode-theme`), shipping only the **Dark Default** and
**Light Default** variants. It is intentionally simpler than the existing
`projekt0n/github-nvim-theme` port — no compile/cache layer, no 3-layer
palette -> spec -> groups indirection, no module-override system. The
architecture mirrors the author's other theme, `akatsuki.nvim`.

## Architecture

```
lua/github-theme/
├── init.lua            setup() merges user opts into defaults; load(style) builds
│                       palette, applies on_colors, builds groups, applies
│                       on_highlights, calls nvim_set_hl for each, sets
│                       vim.g.terminal_color_0..15 when terminal_colors=true.
├── defaults.lua        ThemeOptions + ThemeStyles type classes and defaults.
├── palette.lua         ThemeColors class + { dark=..., light=... }. Single
│                       source of truth for all colors. Alpha-bearing hex
│                       (#RRGGBBAA) values are pre-blended to solid #RRGGBB
│                       via the `solid()` helper because nvim_set_hl rejects
│                       alpha hex.
├── utils.lua           hex_to_rgb / rgb_to_hex / blend / darken / lighten.
└── groups/
    ├── init.lua        Deep-merges editor, syntax, treesitter, lsp,
    │                   integrations (in that order — later wins).
    ├── editor.lua      Normal, Pmenu, NormalFloat, Visual, Search, Statusline,
    │                   tabs, cursor, signs, spelling, etc. THIS file owns the
    │                   VSCode-faithful Pmenu/NormalFloat mapping (see below).
    ├── syntax.lua      Vim's legacy syntax highlight groups.
    ├── treesitter.lua  @variable, @keyword, @function, @markup.*, @tag.*, etc.
    ├── lsp.lua         LspReference*, Diagnostic* (blends diagnostic bg),
    │                   @lsp.type.* and @lsp.typemod.* semantic links.
    └── integrations/
        ├── init.lua    Merges git, blink, snacks.
        ├── git.lua     GitSigns* + Diff* + Added/Changed/Removed.
        ├── blink.lua   BlinkCmp* (completion menu + documentation).
        └── snacks.lua  SnacksIndent*, SnacksPicker*, SnacksDiff*.
colors/
├── github.lua          require('github-theme').load(vim.o.background) — auto.
├── github-dark.lua     require('github-theme').load('dark').
└── github-light.lua    require('github-theme').load('light').
```

## Color sourcing

All palette values are sourced from the GitHub VSCode theme's resolved colors
(`@primer/primitives` v7.10.0, with the per-theme overrides applied by
`src/colors.js`). The reference values were extracted from the upstream
`colors` (workbench UI) and `tokenColors` (TextMate syntax) objects. When
adding new palette keys, cross-check against the upstream theme — do NOT
invent new hex values. The mapping from GitHub Primer tokens to ThemeColors
keys is documented inline in the palette file headers (see the plan that
produced this theme for the full mapping table).

### The `solid()` helper

Neovim's `nvim_set_hl` rejects `#RRGGBBAA` (alpha) hex — only `#RRGGBB` is
accepted. The palette wraps any alpha-bearing color in `solid('#RRGGBBAA', bg)`,
which blends the color over the editor background using `utils.blend` to
produce the equivalent opaque hex. If you add a new alpha-bearing palette key,
wrap it in `solid(...)` or it will crash at load time.

Affected keys: `bg_cursorline`, `bg_selection`, `bg_visual`, `bg_search`,
`guide_active`, all `diff_*_bg`, all `diff_*`.

## The Pmenu / NormalFloat decision (important)

The user's explicit requirement: `Pmenu` and `NormalFloat` must use the GitHub
VSCode theme's popup/list colors, NOT the existing neovim port's choices.

| Neovim group | Palette key | GitHub VSCode source                     |
|---|---|---|
| `NormalFloat`  | `bg_float`   | `editorHoverWidget.background` (= `editorWidget.background` = `canvas.overlay`) |
| `Pmenu`        | `bg_float`   | `suggestWidget.background` / `dropdown.listBackground` (same value = `canvas.overlay`) |
| `PmenuSel`     | `bg_selection` | `list.activeSelectionBackground` = `neutral.muted` |
| `PmenuThumb`   | `fg_gutter`    | `editorSuggestWidget.scrollbarSlider` family |
| `FloatBorder`  | `border`       | `editorHoverWidget.border` = `border.default` |
| `PmenuKind*`   | `purple`       | kind-icon color (the existing port omits these entirely — we define them) |
| `PmenuExtra*`  | `fg_dim`       | metadata text (`pickerGroup.foreground` = `fg.muted`) |

Critical consequence: in **Dark Default**, the popup background (`#161b22` =
`canvas.overlay`) is **one shade lighter** than the editor background
(`#0d1117` = `canvas.default`). This is intentional and faithful to VSCode.
The existing `projekt0n` port inverts this (uses `#21262d` as editor bg and
`#0d1117`-ish as popup bg) — that is a bug relative to the upstream theme,
and we deliberately diverge.

`PmenuSel` (list selection = `neutral.muted`) and `Visual` (editor text
selection = `accent` at 0.2 alpha) are **distinct colors**. The existing port
reuses one `sel0`/`sel1` blend for both; we split them per VSCode.

Do NOT collapse `bg_float` back to `bg`, do NOT link `PmenuSel` to `Visual`,
and do NOT remove the `PmenuKind`/`PmenuExtra` definitions — these are the
core divergences that motivated this theme's existence.

## Syntax token mapping (key values)

Mirrors GitHub's `tokenColors` textmate scopes. Most important tokens:

| ThemeColors key | Dark           | Light          | GitHub scope                                |
|---|---|---|---|
| `keyword`  | `#ff7b72` | `#cf222e` | `keyword`, `storage`, `storage.type`                            |
| `func`     | `#d2a8ff` | `#8250df` | `entity.name.function`, `entity.name.method`, `support.function` |
| `string`   | `#a5d6ff` | `#0a3069` | `string`, `string.regexp`                                        |
| `type`     | `#ffa657` | `#953800` | `entity.name` (+ `entity.name.type`), `variable` (orange)        |
| `constant` | `#79c0ff` | `#0550ae` | `constant`, `entity.name.constant`, `variable.other.constant`   |
| `tag`      | `#7ee787` | `#116329` | `entity.name.tag`, `markup.quote`, regexp escapes               |
| `operator` | `#a5d6ff` | `#0a3069` | operator symbol-icon blue                                         |
| `comment`  | `#8b949e` | `#6e7781` | `comment` (+ `@comment.*`) — italic by default                    |

Note: VSCode itself sets NO fontStyle on comments; this theme defaults to
italic (the author's other theme `akatsuki.nvim` also does). Changing
comment style requires editing `defaults.lua` and the `Comment` /
`@comment` entries in `syntax.lua` / `treesitter.lua`.

## Conventions

- **Lua quote style**: single quotes (enforced by `.editorconfig`).
- **Indent**: 4 spaces, no tabs. Max line length 120.
- **No comments in code** unless the user explicitly requests them. The only
  exceptions are the `solid()` helper explanation in `palette.lua` (kept
  because it documents a non-obvious nvim constraint) and the AGENTS/README
  files you are reading now.
- **Module name**: `github-theme` (with hyphen). The repo folder is
  `lua/github-theme/` so `require('github-theme')` works.
- **colors_name**: set to `'github'` (no variant suffix) so the shim
  `colors/github.lua` can auto-switch via `vim.o.background`; the
  `github-dark`/`github-light` shims call `load('dark'/'light')` directly and
  still set `colors_name = 'github'`.
- **Group file pattern**: every group module exports `M.get(colors, opts)`
  returning a `table<string, vim.api.keyset.highlight>`. Use `link = 'X'`
  for linked groups rather than re-specifying colors, so user overrides
  cascade naturally.
- **Diagnostics backgrounds** are blended at 0.12 in `lsp.lua` using
  `utils.blend(diag, bg, 0.12)` — keep this ratio unless the user asks.
- **Integrations list** in `groups/integrations/init.lua` and the groups list
  in `groups/init.lua` must be updated when adding/removing a module.

## Verification

There is no test suite (matching `akatsuki.nvim`). To sanity-check the theme
loads and the popup colors are VSCode-faithful, run from the repo root:

```sh
nvim --headless --clean -u NONE -c "luafile <(cat <<'LUA'
vim.o.runtimepath = vim.fn.getcwd() .. ',' .. vim.o.runtimepath
require('github-theme').load('dark')
local h = vim.api.nvim_get_hl(0, { name = 'NormalFloat' })
print(string.format('NormalFloat bg: #%06x', h.bg))  -- expect #161b22
local p = vim.api.nvim_get_hl(0, { name = 'Pmenu' })
print(string.format('Pmenu bg: #%06x', p.bg))        -- expect #161b22
LUA
)" -c "qa"
```

Expected dark values: `Normal #0d1117`, `NormalFloat/Pmenu #161b22`,
`PmenuSel` (neutral.muted blended) ~`#333941`, `Visual` (accent 0.2 blended)
~`#132743` (distinct from PmenuSel).

Expected light values: `Normal #ffffff`, `NormalFloat/Pmenu #ffffff`,
`PmenuSel` ~`#eff0f2`, `Visual` ~`#cde1f7`.

If `nvim_set_hl` errors with "Invalid highlight color", you have introduced
an `#RRGGBBAA` value that was not wrapped in `solid(...)`.

## Common edits

- **Add a palette key**: add the field to `ThemeColors` in `palette.lua`,
  set the value in both `dark` and `light` tables (wrap alpha hex in
  `solid(...)`), then reference it from group files via `c.<key>`.
- **Add a highlight group**: add the entry in the appropriate `groups/*.lua`
  file (`editor.lua` for UI, `syntax.lua`/`treesitter.lua` for code tokens,
  `lsp.lua` for LSP, `integrations/<plugin>.lua` for plugin-specific groups).
  Prefer `link = 'ExistingGroup'` over re-specifying colors.
- **Add an integration**: create `groups/integrations/<name>.lua` exporting
  `M.get(colors, opts)`, and add the name string to the `integrations` table
  in `groups/integrations/init.lua`.
- **Change a style default** (comment italic, keyword bold, etc.): edit
  `defaults.lua` `styles.<category>` only. The group files in
  `syntax.lua` / `treesitter.lua` read each style flag from `opts.styles`
  via `utils.style()`, so `defaults.lua` is the single source of truth.
  Categories: `comments`, `keywords`, `functions`, `variables`, `operators`,
  `conditionals`. Semantic italics/bolds on `.builtin` subtypes,
  `@markup.*`, `@type.definition`, `@constructor`, `@function.macro`,
  `Macro`/`Structure`, `SpecialComment`, `Underlined`, `Todo` are
  intentional disambiguation and are NOT driven by `opts.styles` — edit
  them in place if you want to change them.
- **Add a variant** (e.g. dark dimmed): add a new key to the palette return
  table, a `colors/github-<variant>.lua` shim, and a section in the README.
  Do not add it to `ThemePalette`'s typed keys without updating the type
  class.

## References

- Upstream VSCode theme: https://github.com/primer/github-vscode-theme
- Existing nvim port (reference for what to diverge from):
  https://github.com/projekt0n/github-nvim-theme
- Sister theme with identical architecture: `akatsuki.nvim`
  (https://github.com/eduardomillanrs/akatsuki.nvim)
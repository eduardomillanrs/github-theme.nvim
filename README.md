# github-theme.nvim

Neovim colorscheme port of the GitHub VSCode theme (Dark Default, Dark Dimmed, and Light Default variants).

## Features

- Dark, dimmed, and light styles:
  - `github-dark`
  - `github-dark-dimmed`
  - `github-light`
- Treesitter highlight groups
- LSP semantic highlight groups
- Terminal color export (`vim.g.terminal_color_*`)
- VSCode-faithful popup/float colors (`Pmenu`, `NormalFloat`)

## Requirements

- Neovim `0.9+`

## Installation

`lazy.nvim`:

```lua
{
    'eduardomillanrs/github-theme.nvim',
    lazy = false,
    priority = 1000,
}
```

`packer.nvim`:

```lua
use {
    'eduardomillanrs/github-theme.nvim'
}
```

## Usage

Set the active variant:

```vim
colorscheme github-dark
```

GitHub Dark Dimmed:

```vim
colorscheme github-dark-dimmed
```

GitHub Light:

```vim
colorscheme github-light
```

Auto-follow Neovim background option:

```vim
colorscheme github
```

`github` loads based on `vim.o.background` (`dark` or `light`). For a dark
background, it uses the configured `dark` option (`'default'` by default).

The dimmed variant can also be selected explicitly with `github-dark-dimmed`.

## Setup

```lua
require('github-theme').setup({
    dark           = 'default',
    terminal_colors = true,
    styles = {
        comments     = { italic = true },
        keywords     = {},
        functions    = {},
        variables    = {},
        operators    = {},
        conditionals = {},
    },
})
```

Set `dark = 'dimmed'` to use GitHub Dark Dimmed when loading `github` or
`github-dark`:

```lua
require('github-theme').setup({ dark = 'dimmed' })
vim.cmd.colorscheme('github')
```

Then apply one variant:

```lua
vim.cmd.colorscheme('github-dark')
-- or
vim.cmd.colorscheme('github-light')
```

## Customization

You can override palette values and highlights:

```lua
require('github-theme').setup({
    on_colors = function(colors)
        colors.bg = '#ffffff'
    end,
    on_highlights = function(highlights, colors)
        highlights.Comment = { fg = colors.fg_comment, italic = true }
    end,
})
```

## Popup & Float Colors

`Pmenu` and `NormalFloat` use the GitHub VSCode theme's popup/list colors
(`canvas.overlay` / `editorWidget.background`) instead of the editor background:

| Group          | Dark       | Light     | VSCode source                          |
|----------------|------------|-----------|----------------------------------------|
| `Pmenu`        | `#161b22`  | `#ffffff` | `suggestWidget.background`            |
| `PmenuSel`     | `#6e768166`| `#afb8c133` | `list.activeSelectionBackground`     |
| `NormalFloat`  | `#161b22`  | `#ffffff` | `editorHoverWidget.background`         |
| `FloatBorder`  | `#30363d`  | `#d0d7de` | `editorHoverWidget.border`             |

In Dark Default the popup background (`#161b22`) is one shade lighter than the
editor background (`#0d1117`), matching VSCode behavior.

Dark Dimmed uses `#22272e` for the editor background and `#2d333b` for popup
and elevated surfaces, with `#adbac7` as the primary foreground.

## Credits

Based on the [GitHub VSCode theme](https://github.com/primer/github-vscode-theme)
by GitHub/Primer. Color values sourced from `@primer/primitives`.

local M = {}

---@param colors ThemeColors
---@param opts   ThemeOptions
---@return table<string, vim.api.keyset.highlight>
function M.get(colors, opts)
    local c = colors

    return {
        BlinkCmpMenu                         = { fg = c.fg, bg = c.bg_float },
        BlinkCmpMenuBorder                   = { fg = c.border, bg = c.bg_float },
        BlinkCmpMenuSelection                = { bg = c.bg_selection },
        BlinkCmpLabel                        = { fg = c.fg },
        BlinkCmpLabelMatch                   = { fg = c.accent, bold = true },
        BlinkCmpLabelDeprecated              = { fg = c.fg_gutter, strikethrough = true },
        BlinkCmpLabelDetail                  = { fg = c.fg_comment },
        BlinkCmpLabelDescription             = { fg = c.fg_comment },
        BlinkCmpSource                       = { fg = c.fg_comment },
        BlinkCmpKind                         = { fg = c.fg_dim },
        BlinkCmpKindText                     = { fg = c.fg },
        BlinkCmpKindMethod                   = { fg = c.func },
        BlinkCmpKindFunction                 = { fg = c.func },
        BlinkCmpKindConstructor              = { fg = c.type },
        BlinkCmpKindField                    = { fg = c.gold },
        BlinkCmpKindVariable                 = { fg = c.variable },
        BlinkCmpKindClass                    = { fg = c.type },
        BlinkCmpKindInterface                = { fg = c.type },
        BlinkCmpKindModule                   = { fg = c.fg_dim },
        BlinkCmpKindProperty                 = { fg = c.gold },
        BlinkCmpKindUnit                     = { fg = c.constant },
        BlinkCmpKindValue                    = { fg = c.constant },
        BlinkCmpKindEnum                     = { fg = c.type },
        BlinkCmpKindKeyword                  = { fg = c.keyword },
        BlinkCmpKindSnippet                  = { fg = c.teal },
        BlinkCmpKindColor                     = { fg = c.teal },
        BlinkCmpKindFile                     = { fg = c.fg },
        BlinkCmpKindReference                = { fg = c.variable },
        BlinkCmpKindFolder                   = { fg = c.accent },
        BlinkCmpKindEnumMember               = { fg = c.constant },
        BlinkCmpKindConstant                 = { fg = c.constant },
        BlinkCmpKindStruct                   = { fg = c.type },
        BlinkCmpKindEvent                    = { fg = c.keyword },
        BlinkCmpKindOperator                 = { fg = c.operator },
        BlinkCmpKindTypeParameter            = { fg = c.type },
        BlinkCmpScrollBarThumb               = { link = 'PmenuThumb' },
        BlinkCmpScrollBarGutter              = { link = 'PmenuSbar' },
        BlinkCmpGhostText                    = { link = 'NonText' },
        BlinkCmpDoc                          = { fg = c.fg, bg = c.bg_float },
        BlinkCmpDocBorder                    = { fg = c.border, bg = c.bg_float },
        BlinkCmpDocSeparator                 = { fg = c.border, bg = c.bg_float },
        BlinkCmpDocCursorLine                = { link = 'Visual' },
        BlinkCmpSignatureHelp                = { fg = c.fg, bg = c.bg_float },
        BlinkCmpSignatureHelpBorder          = { fg = c.border, bg = c.bg_float },
        BlinkCmpSignatureHelpActiveParameter = { link = 'LspSignatureActiveParameter' },
    }
end

return M
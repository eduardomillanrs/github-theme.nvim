local M = {}

local u = require('github-theme.utils')

---@param colors ThemeColors
---@param opts   ThemeOptions
---@return table<string, vim.api.keyset.highlight>
function M.get(colors, opts)
    local c = colors
    local s = opts.styles
    local function hl(fg, style)
        return vim.tbl_extend('force', { fg = fg }, u.style(style))
    end

    return {
        Comment        = hl(c.fg_comment, s.comments),
        String         = { fg = c.string },
        Character      = { fg = c.string },
        Number         = { fg = c.constant },
        Float          = { link = 'Number' },
        Boolean        = hl(c.keyword, s.keywords),
        Identifier     = hl(c.variable, s.variables),
        Function       = hl(c.func, s.functions),
        Statement      = hl(c.keyword, s.keywords),
        Conditional    = hl(c.keyword, s.conditionals),
        Repeat         = hl(c.keyword, s.conditionals),
        Label          = { fg = c.type },
        Operator       = hl(c.operator, s.operators),
        Keyword        = hl(c.keyword, s.keywords),
        Exception      = hl(c.keyword, s.keywords),
        PreProc        = hl(c.keyword, s.keywords),
        Include        = hl(c.keyword, s.keywords),
        Define         = hl(c.keyword, s.keywords),
        Macro          = { fg = c.type, bold = true },
        PreCondit      = hl(c.keyword, s.keywords),
        Type           = { fg = c.type },
        StorageClass   = hl(c.keyword, s.keywords),
        Structure      = { fg = c.type, bold = true },
        Typedef        = { fg = c.type },
        Constant       = { fg = c.constant },
        Special        = { fg = c.tag },
        SpecialChar    = { fg = c.tag },
        Tag            = { fg = c.tag },
        Delimiter      = { fg = c.fg_dim },
        SpecialComment = { fg = c.constant },
        Debug          = { fg = c.keyword },
        Underlined     = { fg = c.accent, underline = true },
        Bold           = { bold = true },
        Italic         = {},
        Ignore         = { fg = c.nontext },
        Error          = { fg = c.error },
        Todo           = { fg = c.bg, bg = c.gold, bold = true },
    }
end

return M
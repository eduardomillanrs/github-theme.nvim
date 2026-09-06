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
        ['@variable']                    = hl(c.variable, s.variables),
        ['@variable.builtin']            = { fg = c.peach },
        ['@variable.parameter']          = hl(c.fg, s.variables),
        ['@variable.parameter.builtin']  = { fg = c.peach },
        ['@variable.member']             = hl(c.fg, s.variables),

        ['@constant']                    = { fg = c.constant },
        ['@constant.builtin']            = { fg = c.constant, bold = true },
        ['@constant.macro']              = { fg = c.type, bold = true },

        ['@module']                      = { fg = c.constant },
        ['@module.builtin']              = { fg = c.constant },

        ['@label']                       = { fg = c.type },

        ['@string']                      = { fg = c.string },
        ['@string.documentation']        = { fg = c.string },
        ['@string.escape']               = { fg = c.teal, bold = true },
        ['@string.regexp']               = { fg = c.regex },
        ['@string.special']              = { fg = c.teal },
        ['@string.special.symbol']       = { fg = c.constant },
        ['@string.special.url']          = { fg = c.accent, underline = true },
        ['@string.special.path']         = { fg = c.accent },

        ['@character']                   = { fg = c.string },
        ['@character.special']           = { fg = c.teal },

        ['@number']                      = { fg = c.constant },
        ['@number.float']                = { fg = c.constant },
        ['@boolean']                     = hl(c.keyword, s.keywords),

        ['@type']                        = { fg = c.type },
        ['@type.builtin']                = { fg = c.type },
        ['@type.definition']             = { fg = c.type, bold = true },
        ['@type.qualifier']              = hl(c.keyword, s.keywords),

        ['@attribute']                   = { fg = c.type },
        ['@attribute.builtin']           = { fg = c.type },

        ['@function']                    = { fg = c.func },
        ['@function.builtin']            = hl(c.func, s.functions),
        ['@function.call']               = hl(c.func, s.functions),
        ['@function.macro']              = { fg = c.type, bold = true },
        ['@function.method']             = { fg = c.func },
        ['@function.method.call']        = hl(c.func, s.functions),

        ['@constructor']                 = { fg = c.type, bold = true },

        ['@operator']                    = hl(c.operator, s.operators),

        ['@keyword']                     = hl(c.keyword, s.keywords),
        ['@keyword.coroutine']           = hl(c.keyword, s.keywords),
        ['@keyword.function']            = hl(c.keyword, s.keywords),
        ['@keyword.operator']            = hl(c.operator, s.operators),
        ['@keyword.import']              = hl(c.keyword, s.keywords),
        ['@keyword.type']                = hl(c.keyword, s.keywords),
        ['@keyword.modifier']            = hl(c.keyword, s.keywords),
        ['@keyword.repeat']              = hl(c.keyword, s.conditionals),
        ['@keyword.return']              = hl(c.keyword, s.keywords),
        ['@keyword.debug']               = hl(c.keyword, s.keywords),
        ['@keyword.exception']           = hl(c.keyword, s.keywords),
        ['@keyword.conditional']         = hl(c.keyword, s.conditionals),
        ['@keyword.conditional.ternary'] = hl(c.operator, s.operators),
        ['@keyword.directive']           = hl(c.keyword, s.keywords),
        ['@keyword.directive.define']    = hl(c.keyword, s.keywords),

        ['@punctuation.bracket']         = { fg = c.fg_dim },
        ['@punctuation.delimiter']       = { fg = c.fg_dim },
        ['@punctuation.special']         = { fg = c.operator },

        ['@comment']                     = hl(c.fg_comment, s.comments),
        ['@comment.documentation']       = hl(c.fg_comment, s.comments),
        ['@comment.error']               = { fg = c.error, bold = true },
        ['@comment.warning']             = { fg = c.warning, bold = true },
        ['@comment.todo']                = { fg = c.bg, bg = c.gold, bold = true },
        ['@comment.note']                = { fg = c.bg, bg = c.info, bold = true },

        ['@markup.strong']               = { fg = c.fg_bright, bold = true },
        ['@markup.italic']               = { fg = c.fg_bright },
        ['@markup.strikethrough']        = { fg = c.fg_dim, strikethrough = true },
        ['@markup.underline']            = { underline = true },
        ['@markup.heading']              = { fg = c.accent, bold = true },
        ['@markup.heading.1']            = { fg = c.accent, bold = true },
        ['@markup.heading.2']            = { fg = c.purple, bold = true },
        ['@markup.heading.3']            = { fg = c.type, bold = true },
        ['@markup.heading.4']            = { fg = c.sage, bold = true },
        ['@markup.heading.5']            = { fg = c.constant, bold = true },
        ['@markup.heading.6']            = { fg = c.keyword, bold = true },
        ['@markup.quote']                = { fg = c.fg_dim },
        ['@markup.math']                 = { fg = c.constant },
        ['@markup.environment']          = { fg = c.keyword },
        ['@markup.link']                 = { fg = c.accent, underline = true },
        ['@markup.link.label']           = { fg = c.accent },
        ['@markup.link.url']             = { fg = c.accent, underline = true },
        ['@markup.raw']                  = { fg = c.constant },
        ['@markup.raw.block']            = { fg = c.fg },
        ['@markup.list']                 = { fg = c.keyword },
        ['@markup.list.checked']         = { fg = c.ok },
        ['@markup.list.unchecked']       = { fg = c.fg_dim },

        ['@tag']                         = { fg = c.tag },
        ['@tag.builtin']                 = { fg = c.tag },
        ['@tag.attribute']               = { fg = c.type },
        ['@tag.delimiter']               = { fg = c.fg_dim },

        ['@diff.plus']                   = { fg = c.git_add },
        ['@diff.minus']                  = { fg = c.git_delete },
        ['@diff.delta']                  = { fg = c.git_change },
    }
end

return M

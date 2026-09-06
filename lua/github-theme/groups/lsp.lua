local M = {}
local utils = require('github-theme.utils')

---@param colors ThemeColors
---@param opts   ThemeOptions
---@return table<string, vim.api.keyset.highlight>
function M.get(colors, opts)
    local c = colors
    local diagnostic_bg = {
        error = utils.blend(c.error, c.bg, 0.12),
        warning = utils.blend(c.warning, c.bg, 0.12),
        info = utils.blend(c.info, c.bg, 0.12),
        hint = utils.blend(c.hint, c.bg, 0.12),
        ok = utils.blend(c.ok, c.bg, 0.12),
    }

    return {
        LspReferenceText                           = { bg = c.bg_visual },
        LspReferenceRead                           = { bg = c.bg_visual },
        LspReferenceWrite                          = { bg = c.bg_visual, bold = true },

        LspCodeLens                                = { fg = c.fg_comment },
        LspCodeLensSeparator                       = { fg = c.fg_gutter },
        LspSignatureActiveParameter                = { fg = c.accent, bold = true },
        LspInlayHint                               = { fg = c.fg_gutter, bg = c.bg_elevated },

        DiagnosticError                            = { fg = c.error },
        DiagnosticWarn                             = { fg = c.warning },
        DiagnosticInfo                             = { fg = c.info },
        DiagnosticHint                             = { fg = c.hint },
        DiagnosticOk                               = { fg = c.ok },

        DiagnosticSignError                        = { fg = c.error },
        DiagnosticSignWarn                         = { fg = c.warning },
        DiagnosticSignInfo                         = { fg = c.info },
        DiagnosticSignHint                         = { fg = c.hint },
        DiagnosticSignOk                           = { fg = c.ok },

        DiagnosticVirtualTextError                 = { fg = c.error, bg = diagnostic_bg.error },
        DiagnosticVirtualTextWarn                  = { fg = c.warning, bg = diagnostic_bg.warning },
        DiagnosticVirtualTextInfo                  = { fg = c.info, bg = diagnostic_bg.info },
        DiagnosticVirtualTextHint                  = { fg = c.hint, bg = diagnostic_bg.hint },
        DiagnosticVirtualTextOk                    = { fg = c.ok, bg = diagnostic_bg.ok },

        DiagnosticVirtualLinesError                = { fg = c.error, bg = diagnostic_bg.error },
        DiagnosticVirtualLinesWarn                 = { fg = c.warning, bg = diagnostic_bg.warning },
        DiagnosticVirtualLinesInfo                 = { fg = c.info, bg = diagnostic_bg.info },
        DiagnosticVirtualLinesHint                 = { fg = c.hint, bg = diagnostic_bg.hint },
        DiagnosticVirtualLinesOk                   = { fg = c.ok, bg = diagnostic_bg.ok },

        DiagnosticUnderlineError                   = { sp = c.error, undercurl = true },
        DiagnosticUnderlineWarn                    = { sp = c.warning, undercurl = true },
        DiagnosticUnderlineInfo                    = { sp = c.info, undercurl = true },
        DiagnosticUnderlineHint                    = { sp = c.hint, undercurl = true },
        DiagnosticUnderlineOk                      = { sp = c.ok, undercurl = true },

        DiagnosticFloatingError                    = { fg = c.error },
        DiagnosticFloatingWarn                     = { fg = c.warning },
        DiagnosticFloatingInfo                     = { fg = c.info },
        DiagnosticFloatingHint                     = { fg = c.hint },
        DiagnosticFloatingOk                       = { fg = c.ok },

        ['@lsp.type.boolean']                      = { link = '@boolean' },
        ['@lsp.type.builtinType']                  = { link = '@type.builtin' },
        ['@lsp.type.comment']                      = { link = '@comment' },
        ['@lsp.type.decorator']                    = { link = '@attribute' },
        ['@lsp.type.deriveHelper']                 = { link = '@attribute' },
        ['@lsp.type.enum']                         = { link = '@type' },
        ['@lsp.type.enumMember']                   = { link = '@constant' },
        ['@lsp.type.escapeSequence']               = { link = '@string.escape' },
        ['@lsp.type.formatSpecifier']              = { link = '@punctuation.special' },
        ['@lsp.type.function']                     = { link = '@function' },
        ['@lsp.type.generic']                      = { link = '@variable' },
        ['@lsp.type.interface']                    = { fg = c.type },
        ['@lsp.type.keyword']                      = { link = '@keyword' },
        ['@lsp.type.lifetime']                     = { link = '@keyword.modifier' },
        ['@lsp.type.macro']                        = { link = '@function.macro' },
        ['@lsp.type.method']                       = { link = '@function.method' },
        ['@lsp.type.namespace']                    = { link = '@module' },
        ['@lsp.type.number']                       = { link = '@number' },
        ['@lsp.type.operator']                     = { link = '@operator' },
        ['@lsp.type.parameter']                    = { link = '@variable.parameter' },
        ['@lsp.type.property']                     = { link = '@variable.member' },
        ['@lsp.type.selfKeyword']                  = { link = '@variable.builtin' },
        ['@lsp.type.selfTypeKeyword']              = { link = '@variable.builtin' },
        ['@lsp.type.string']                       = { link = '@string' },
        ['@lsp.type.struct']                       = { link = '@type' },
        ['@lsp.type.type']                         = { link = '@type' },
        ['@lsp.type.typeAlias']                    = { link = '@type.definition' },
        ['@lsp.type.typeParameter']                = { link = '@type' },
        ['@lsp.type.unresolvedReference']          = { sp = c.error, undercurl = true },
        ['@lsp.type.variable']                     = {},

        ['@lsp.typemod.class.defaultLibrary']      = { link = '@type.builtin' },
        ['@lsp.typemod.enum.defaultLibrary']       = { link = '@type.builtin' },
        ['@lsp.typemod.enumMember.defaultLibrary'] = { link = '@constant.builtin' },
        ['@lsp.typemod.function.defaultLibrary']   = { link = '@function.builtin' },
        ['@lsp.typemod.keyword.async']             = { link = '@keyword.coroutine' },
        ['@lsp.typemod.keyword.injected']          = { link = '@keyword' },
        ['@lsp.typemod.macro.defaultLibrary']      = { link = '@function.builtin' },
        ['@lsp.typemod.method.defaultLibrary']     = { link = '@function.builtin' },
        ['@lsp.typemod.operator.injected']         = { link = '@operator' },
        ['@lsp.typemod.string.injected']           = { link = '@string' },
        ['@lsp.typemod.struct.defaultLibrary']     = { link = '@type.builtin' },
        ['@lsp.typemod.type.defaultLibrary']       = { link = '@type.builtin' },
        ['@lsp.typemod.typeAlias.defaultLibrary']  = { link = '@type.builtin' },
        ['@lsp.typemod.variable.callable']         = { link = '@function' },
        ['@lsp.typemod.variable.defaultLibrary']   = { link = '@variable.builtin' },
        ['@lsp.typemod.variable.injected']         = { link = '@variable' },
        ['@lsp.typemod.variable.static']           = { link = '@constant' },
    }
end

return M
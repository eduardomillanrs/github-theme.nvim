local M = {}

---@param colors ThemeColors
---@param opts   ThemeOptions
---@return table<string, vim.api.keyset.highlight>
function M.get(colors, opts)
    local c = colors

    return {
        FzfLuaNormal = { fg = c.fg, bg = c.bg },
        FzfLuaBorder = { fg = c.border, bg = c.bg_float },
        FzfLuaTitle = { fg = c.accent, bg = c.bg_float, bold = true },
        FzfLuaPreviewNormal = { fg = c.fg, bg = c.bg_float },
        FzfLuaPreviewBorder = { fg = c.border, bg = c.bg_float },
        FzfLuaPreviewTitle = { fg = c.accent, bg = c.bg_float, bold = true },
        FzfLuaCursor = { link = 'IncSearch' },
        FzfLuaCursorLine = { fg = c.fg, bg = c.bg_selection },
        FzfLuaCursorLineSign = { fg = c.accent, bg = c.bg_selection },
        FzfLuaSearch = { fg = c.fg, bg = c.bg_search },
        FzfLuaScrollBorder = { fg = c.border, bg = c.bg_float },
        FzfLuaScrollFloat = { link = 'PmenuThumb' },
        FzfLuaScrollBG = { link = 'PmenuSbar' },
        FzfLuaHelpNormal = { fg = c.fg, bg = c.bg_float },
        FzfLuaHelpBorder = { fg = c.border, bg = c.bg_float },
        FzfLuaHeaderBind = { fg = c.accent },
        FzfLuaHeaderText = { fg = c.fg_comment },
        FzfLuaPathColNr = { fg = c.fg_gutter },
        FzfLuaDirPart = { fg = c.fg_comment },
        FzfLuaFilePart = { fg = c.fg },
    }
end

return M

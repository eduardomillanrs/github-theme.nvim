local M = {}

---@param colors ThemeColors
---@param opts   ThemeOptions
---@return table<string, vim.api.keyset.highlight>
function M.get(colors, opts)
    local highlights = {}
    local integrations = { 'git', 'blink', 'snacks', 'fzf' }

    for _, integration in ipairs(integrations) do
        highlights = vim.tbl_deep_extend(
            'force',
            highlights,
            require('github-theme.groups.integrations.' .. integration).get(colors, opts)
        )
    end

    return highlights
end

return M
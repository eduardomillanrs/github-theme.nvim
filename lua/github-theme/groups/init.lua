local M = {}

---@param colors ThemeColors
---@param opts   ThemeOptions
---@return table<string, vim.api.keyset.highlight>
function M.setup(colors, opts)
    local highlights = {}
    local groups = { 'editor', 'syntax', 'treesitter', 'lsp', 'integrations' }

    for _, group in ipairs(groups) do
        highlights = vim.tbl_deep_extend(
            'force',
            highlights,
            require('github-theme.groups.' .. group).get(colors, opts)
        )
    end

    return highlights
end

return M;
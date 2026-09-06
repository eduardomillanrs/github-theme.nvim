local utils = require('github-theme.utils')

local M = {}

---@param colors ThemeColors
---@param opts   ThemeOptions
---@return table<string, vim.api.keyset.highlight>
function M.get(colors, opts)
    local c = colors

    return {
        GitSignsAdd                = { fg = c.git_add },
        GitSignsChange             = { fg = c.git_change },
        GitSignsDelete             = { fg = c.git_delete },
        GitSignsTopdelete          = { fg = c.git_delete },
        GitSignsChangedelete       = { fg = c.git_change },
        GitSignsUntracked          = { fg = c.git_add },
        GitSignsCurrentLineBlame   = { fg = c.fg_comment },

        GitSignsStagedAdd          = { fg = utils.blend(c.git_add, c.bg, 0.5) },
        GitSignsStagedChange       = { fg = utils.blend(c.git_change, c.bg, 0.5) },
        GitSignsStagedDelete       = { fg = utils.blend(c.git_delete, c.bg, 0.5) },
        GitSignsStagedTopdelete    = { fg = utils.blend(c.git_delete, c.bg, 0.5) },
        GitSignsStagedChangedelete = { fg = utils.blend(c.git_change, c.bg, 0.5) },
        GitSignsStagedUntracked    = { fg = utils.blend(c.git_add, c.bg, 0.5) },

        DiffAdd                    = { bg = c.diff_add_bg },
        DiffChange                 = { bg = c.diff_change_bg },
        DiffDelete                 = { bg = c.diff_delete_bg },
        DiffText                   = { bg = c.diff_text_bg },
        Added                      = { fg = c.git_add },
        Changed                    = { fg = c.git_change },
        Removed                    = { fg = c.git_delete },
    }
end

return M
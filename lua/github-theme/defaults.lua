---@class ThemeStyle
---@field bold? boolean
---@field italic? boolean
---@field underline? boolean
---@field undercurl? boolean
---@field strikethrough? boolean

---@class ThemeStyles
---@field comments ThemeStyle
---@field keywords ThemeStyle
---@field functions ThemeStyle
---@field variables ThemeStyle
---@field operators ThemeStyle
---@field conditionals ThemeStyle

---@class ThemeOptions
---@field dark 'default' | 'dimmed'
---@field terminal_colors boolean
---@field styles ThemeStyles
---@field on_colors fun(colors: table<string, string>)
---@field on_highlights fun(highlights: table<string, table>, colors: table<string, string>)
return {
    dark            = 'default',
    terminal_colors = true,
    styles          = {
        comments     = { italic = true },
        keywords     = {},
        functions    = {},
        variables    = {},
        operators    = {},
        conditionals = {},
    },
    on_colors       = function(colors) end,
    on_highlights   = function(highlights, colors) end,
};

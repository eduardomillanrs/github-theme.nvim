local utils = require('github-theme.utils')

---@class ThemeColors
---@field none string
---@field bg string
---@field bg_dark string
---@field bg_float string
---@field bg_elevated string
---@field bg_cursorline string
---@field bg_selection string
---@field bg_visual string
---@field bg_search string
---@field bg_search_current string
---@field bg_statusline string
---@field fg string
---@field fg_dim string
---@field fg_bright string
---@field fg_comment string
---@field fg_dark string
---@field fg_gutter string
---@field fg_gutter_active string
---@field comment string
---@field black string
---@field red string
---@field orange string
---@field yellow string
---@field green string
---@field cyan string
---@field blue string
---@field purple string
---@field magenta string
---@field sage string
---@field rose string
---@field gold string
---@field peach string
---@field teal string
---@field steel string
---@field keyword string
---@field func string
---@field string string
---@field type string
---@field constant string
---@field variable string
---@field operator string
---@field special string
---@field tag string
---@field regex string
---@field accent string
---@field match_paren string
---@field guide string
---@field guide_active string
---@field nontext string
---@field terminal_black string
---@field terminal_red string
---@field terminal_green string
---@field terminal_yellow string
---@field terminal_blue string
---@field terminal_magenta string
---@field terminal_cyan string
---@field terminal_white string
---@field terminal_bright_black string
---@field terminal_bright_red string
---@field terminal_bright_green string
---@field terminal_bright_yellow string
---@field terminal_bright_blue string
---@field terminal_bright_magenta string
---@field terminal_bright_cyan string
---@field terminal_bright_white string
---@field border string
---@field error string
---@field warning string
---@field info string
---@field hint string
---@field ok string
---@field git_add string
---@field git_change string
---@field git_delete string
---@field git_ignore string
---@field diff_add_bg string
---@field diff_change_bg string
---@field diff_delete_bg string
---@field diff_text_bg string
---@field diff_add string
---@field diff_change string
---@field diff_delete string
---@field diff_text string

-- Neovim's nvim_set_hl does not accept #RRGGBBAA (alpha). Convert an
-- alpha-bearing hex into the equivalent solid color blended over `bg`.
local function solid(hex_alpha, bg)
    local a     = tonumber(hex_alpha:sub(8, 9), 16) / 255
    local color = '#' .. hex_alpha:sub(2, 7)
    return utils.blend(color, bg, a)
end

---@class ThemePalette
---@field dark ThemeColors
---@field dark_dimmed ThemeColors
---@field light ThemeColors
return {
    dark  = (function()
        local bg = '#0d1117'
        return {
            none                    = 'NONE',

            bg                      = bg,
            bg_dark                 = '#010409',
            bg_float                = '#161b22',
            bg_elevated             = '#161b22',
            bg_cursorline           = solid('#6e76811a', bg),
            bg_selection            = solid('#6e768166', bg),
            bg_visual               = solid('#2f81f733', bg),
            bg_search               = solid('#f2cc607f', bg),
            bg_search_current       = '#9e6a03',
            bg_statusline           = '#010409',

            fg                      = '#e6edf3',
            fg_dim                  = '#7d8590',
            fg_bright               = '#f0f6fc',
            fg_comment              = '#8b949e',
            fg_dark                 = '#6e7681',
            fg_gutter               = '#6e7681',
            fg_gutter_active        = '#e6edf3',
            comment                 = '#8b949e',

            black                   = '#0d1117',
            red                     = '#f85149',
            orange                  = '#db6d28',
            yellow                  = '#d29922',
            green                   = '#3fb950',
            cyan                    = '#39c5cf',
            blue                    = '#2f81f7',
            purple                  = '#d2a8ff',
            magenta                 = '#d2a8ff',

            sage                    = '#3fb950',
            rose                    = '#da3633',
            gold                    = '#9e6a03',
            peach                   = '#ffa657',
            teal                    = '#39c5cf',
            steel                   = '#a5d6ff',

            keyword                 = '#ff7b72',
            func                    = '#d2a8ff',
            string                  = '#a5d6ff',
            type                    = '#ffa657',
            constant                = '#79c0ff',
            variable                = '#e6edf3',
            operator                = '#a5d6ff',
            special                 = '#d2a8ff',
            tag                     = '#7ee787',
            regex                   = '#a5d6ff',

            accent                  = '#2f81f7',
            border                  = '#30363d',
            match_paren             = '#3fb950',
            guide                   = '#21262d',
            guide_active            = solid('#6e768133', bg),
            nontext                 = '#484f58',

            terminal_black          = '#484f58',
            terminal_red            = '#ff7b72',
            terminal_green          = '#3fb950',
            terminal_yellow         = '#d29922',
            terminal_blue           = '#58a6ff',
            terminal_magenta        = '#bc8cff',
            terminal_cyan           = '#39c5cf',
            terminal_white          = '#b1bac4',

            terminal_bright_black   = '#6e7681',
            terminal_bright_red     = '#ffa198',
            terminal_bright_green   = '#56d364',
            terminal_bright_yellow  = '#e3b341',
            terminal_bright_blue    = '#79c0ff',
            terminal_bright_magenta = '#d2a8ff',
            terminal_bright_cyan    = '#56d4dd',
            terminal_bright_white   = '#ffffff',

            error                   = '#f85149',
            warning                 = '#d29922',
            info                    = '#2f81f7',
            hint                    = '#39c5cf',
            ok                      = '#3fb950',

            git_add                 = '#3fb950',
            git_change              = '#d29922',
            git_delete              = '#f85149',
            git_ignore              = '#6e7681',

            diff_add_bg             = solid('#23863626', bg),
            diff_change_bg          = solid('#bb800966', bg),
            diff_delete_bg          = solid('#da363326', bg),
            diff_text_bg            = solid('#3fb9504d', bg),

            diff_add                = solid('#3fb9504d', bg),
            diff_change             = solid('#bb800966', bg),
            diff_delete             = solid('#ff7b7266', bg),
            diff_text               = solid('#3fb95040', bg),
        }
    end)(),
    dark_dimmed = (function()
        local bg = '#22272e'
        return {
            none                    = 'NONE',

            bg                      = bg,
            bg_dark                 = '#1c2128',
            bg_float                = '#2d333b',
            bg_elevated             = '#2d333b',
            bg_cursorline           = solid('#636e7b1a', bg),
            bg_selection            = solid('#636e7b66', bg),
            bg_visual               = solid('#3392ff44', bg),
            bg_search               = solid('#ffd33d44', bg),
            bg_search_current       = '#c69026',
            bg_statusline           = '#22272e',

            fg                      = '#adbac7',
            fg_dim                  = '#768390',
            fg_bright               = '#cdd9e5',
            fg_comment              = '#768390',
            fg_dark                 = '#636e7b',
            fg_gutter               = '#768390',
            fg_gutter_active        = '#adbac7',
            comment                 = '#768390',

            black                   = '#22272e',
            red                     = '#f47067',
            orange                  = '#cc6b2c',
            yellow                  = '#c69026',
            green                   = '#57ab5a',
            cyan                    = '#39c5cf',
            blue                    = '#539bf5',
            purple                  = '#dcbdfb',
            magenta                 = '#dcbdfb',

            sage                    = '#8ddb8c',
            rose                    = '#e5534b',
            gold                    = '#c69026',
            peach                   = '#f69d50',
            teal                    = '#39c5cf',
            steel                   = '#96d0ff',

            keyword                 = '#f47067',
            func                    = '#dcbdfb',
            string                  = '#96d0ff',
            type                    = '#f69d50',
            constant                = '#6cb6ff',
            variable                = '#adbac7',
            operator                = '#96d0ff',
            special                 = '#dcbdfb',
            tag                     = '#8ddb8c',
            regex                   = '#96d0ff',

            accent                  = '#539bf5',
            border                  = '#444c56',
            match_paren             = '#57ab5a',
            guide                   = '#373e47',
            guide_active            = '#444c56',
            nontext                 = '#545d68',

            terminal_black          = '#545d68',
            terminal_red            = '#f47067',
            terminal_green          = '#57ab5a',
            terminal_yellow         = '#c69026',
            terminal_blue           = '#539bf5',
            terminal_magenta        = '#b083f0',
            terminal_cyan           = '#39c5cf',
            terminal_white          = '#909dab',

            terminal_bright_black   = '#636e7b',
            terminal_bright_red     = '#ff938a',
            terminal_bright_green   = '#6bc46d',
            terminal_bright_yellow  = '#daaa3f',
            terminal_bright_blue    = '#6cb6ff',
            terminal_bright_magenta = '#dcbdfb',
            terminal_bright_cyan    = '#56d4dd',
            terminal_bright_white   = '#cdd9e5',

            error                   = '#e5534b',
            warning                 = '#c69026',
            info                    = '#539bf5',
            hint                    = '#39c5cf',
            ok                      = '#57ab5a',

            git_add                 = '#57ab5a',
            git_change             = '#c69026',
            git_delete             = '#e5534b',
            git_ignore             = '#545d68',

            diff_add_bg             = solid('#46954a26', bg),
            diff_change_bg          = solid('#ae7c1426', bg),
            diff_delete_bg          = solid('#e5534b26', bg),
            diff_text_bg            = solid('#57ab5a4d', bg),

            diff_add                = solid('#46954a66', bg),
            diff_change             = solid('#ae7c1466', bg),
            diff_delete             = solid('#e5534b66', bg),
            diff_text               = solid('#57ab5a40', bg),
        }
    end)(),
    light = (function()
        local bg = '#ffffff'
        return {
            none                    = 'NONE',

            bg                      = bg,
            bg_dark                 = '#f6f8fa',
            bg_float                = '#ffffff',
            bg_elevated             = '#f6f8fa',
            bg_cursorline           = solid('#eaeef27f', bg),
            bg_selection            = solid('#afb8c133', bg),
            bg_visual               = solid('#0969da33', bg),
            bg_search               = solid('#fae17d7f', bg),
            bg_search_current       = '#bf8700',
            bg_statusline           = '#f6f8fa',

            fg                      = '#1f2328',
            fg_dim                  = '#656d76',
            fg_bright               = '#1b1f24',
            fg_comment              = '#6e7781',
            fg_dark                 = '#6e7781',
            fg_gutter               = '#8c959f',
            fg_gutter_active        = '#1f2328',
            comment                 = '#6e7781',

            black                   = '#1f2328',
            red                     = '#cf222e',
            orange                  = '#bc4c00',
            yellow                  = '#9a6700',
            green                   = '#1a7f37',
            cyan                    = '#1b7c83',
            blue                    = '#0969da',
            purple                  = '#8250df',
            magenta                 = '#8250df',

            sage                    = '#116329',
            rose                    = '#cf222e',
            gold                    = '#bf8700',
            peach                   = '#953800',
            teal                    = '#1b7c83',
            steel                   = '#0a3069',

            keyword                 = '#cf222e',
            func                    = '#8250df',
            string                  = '#0a3069',
            type                    = '#953800',
            constant                = '#0550ae',
            variable                = '#1f2328',
            operator                = '#0a3069',
            special                 = '#8250df',
            tag                     = '#116329',
            regex                   = '#0a3069',

            accent                  = '#0969da',
            border                  = '#d0d7de',
            match_paren             = '#116329',
            guide                   = '#d8dee4',
            guide_active            = solid('#1f23283d', bg),
            nontext                 = '#afb8c1',

            terminal_black          = '#24292f',
            terminal_red            = '#cf222e',
            terminal_green          = '#116329',
            terminal_yellow         = '#4d2d00',
            terminal_blue           = '#0969da',
            terminal_magenta        = '#8250df',
            terminal_cyan           = '#1b7c83',
            terminal_white          = '#6e7781',

            terminal_bright_black   = '#57606a',
            terminal_bright_red     = '#a40e26',
            terminal_bright_green   = '#1a7f37',
            terminal_bright_yellow  = '#633c01',
            terminal_bright_blue    = '#218bff',
            terminal_bright_magenta = '#a475f9',
            terminal_bright_cyan    = '#3192aa',
            terminal_bright_white   = '#8c959f',

            error                   = '#cf222e',
            warning                 = '#9a6700',
            info                    = '#0969da',
            hint                    = '#1b7c83',
            ok                      = '#1a7f37',

            git_add                 = '#1a7f37',
            git_change              = '#9a6700',
            git_delete              = '#cf222e',
            git_ignore              = '#6e7781',

            diff_add_bg             = solid('#aceebb4d', bg),
            diff_change_bg          = solid('#d4a72c66', bg),
            diff_delete_bg          = solid('#ffcecb4d', bg),
            diff_text_bg            = solid('#6fdd8b7f', bg),

            diff_add                = solid('#6fdd8b7f', bg),
            diff_change             = solid('#d4a72c66', bg),
            diff_delete             = solid('#ffaba84d', bg),
            diff_text               = solid('#4ac26b40', bg),
        }
    end)(),
}

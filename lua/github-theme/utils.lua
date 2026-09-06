local M = {}

function M.is_pkg_installed(pkg_name)
    return pcall(require, pkg_name)
end

function M.style(s)
    local r = {}
    if s then
        if s.bold then r.bold = true end
        if s.italic then r.italic = true end
        if s.underline then r.underline = true end
        if s.undercurl then r.undercurl = true end
        if s.strikethrough then r.strikethrough = true end
    end
    return r
end

function M.hex_to_rgb(hex)
    hex = hex:gsub('#', '')
    return {
        r = tonumber(hex:sub(1, 2), 16),
        g = tonumber(hex:sub(3, 4), 16),
        b = tonumber(hex:sub(5, 6), 16),
    }
end

function M.rgb_to_hex(rgb)
    return string.format('#%02x%02x%02x', rgb.r, rgb.g, rgb.b)
end

function M.blend(hex1, hex2, ratio)
    local rgb1 = M.hex_to_rgb(hex1)
    local rgb2 = M.hex_to_rgb(hex2)

    local blended = {
        r = math.floor(rgb1.r * ratio + rgb2.r * (1 - ratio)),
        g = math.floor(rgb1.g * ratio + rgb2.g * (1 - ratio)),
        b = math.floor(rgb1.b * ratio + rgb2.b * (1 - ratio)),
    }

    return M.rgb_to_hex(blended)
end

function M.darken(hex, percent)
    local rgb = M.hex_to_rgb(hex)

    rgb.r = math.floor(rgb.r * (1 - percent))
    rgb.g = math.floor(rgb.g * (1 - percent))
    rgb.b = math.floor(rgb.b * (1 - percent))

    return M.rgb_to_hex(rgb)
end

function M.lighten(hex, percent)
    local rgb = M.hex_to_rgb(hex)

    rgb.r = math.min(255, math.floor(rgb.r + (255 - rgb.r) * percent))
    rgb.g = math.min(255, math.floor(rgb.g + (255 - rgb.g) * percent))
    rgb.b = math.min(255, math.floor(rgb.b + (255 - rgb.b) * percent))

    return M.rgb_to_hex(rgb)
end

return M
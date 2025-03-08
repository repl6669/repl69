-- https://github.com/EmmanuelOga/columns/blob/master/utils/color.lua
-- https://github.com/craftzdog/solarized-osaka.nvim/blob/e96ec4bb1a622d969d77bb0b4ffd525ccc44b73a/lua/solarized-osaka/hsl.lua#L65

local M = {}

local me = debug.getinfo(1, "S").source:sub(2)
me = vim.fn.fnamemodify(me, ":h:h")

function M.mod(modname)
  if package.loaded[modname] then
    return package.loaded[modname]
  end
  local ret = loadfile(me .. "/" .. modname:gsub("%.", "/") .. ".lua")()
  package.loaded[modname] = ret
  return ret
end

--- Converts an HSL color value to RGB. Conversion formula
--- adapted from http://en.wikipedia.org/wiki/HSL_color_space.
--- Assumes h, s, and l are contained in the set [0, 1] and
--- returns r, g, and b in the set [0, 255].
---
--- @param h number      The hue
--- @param s number      The saturation
--- @param l number      The lightness
--- @return number, number, number     # The RGB representation
function M.hslToRgb(h, s, l)
  --- @type number, number, number
  local r, g, b

  if s == 0 then
    r, g, b = l, l, l -- achromatic
  else
    --- @param p number
    --- @param q number
    --- @param t number
    local function hue2rgb(p, q, t)
      if t < 0 then
        t = t + 1
      end
      if t > 1 then
        t = t - 1
      end
      if t < 1 / 6 then
        return p + (q - p) * 6 * t
      end
      if t < 1 / 2 then
        return q
      end
      if t < 2 / 3 then
        return p + (q - p) * (2 / 3 - t) * 6
      end
      return p
    end

    --- @type number
    local q
    if l < 0.5 then
      q = l * (1 + s)
    else
      q = l + s - l * s
    end
    local p = 2 * l - q

    r = hue2rgb(p, q, h + 1 / 3)
    g = hue2rgb(p, q, h)
    b = hue2rgb(p, q, h - 1 / 3)
  end

  return r * 255, g * 255, b * 255
end

--- Converts an HSL color value to RGB in Hex representation.
--- @param  h number   The hue
--- @param  s number   The saturation
--- @param  l number   The lightness
--- @return   string   # The hex representation
function M.hslToHex(h, s, l)
  local r, g, b = M.hslToRgb(h / 360, s / 100, l / 100)

  return string.format("#%02x%02x%02x", r, g, b)
end

---@param color string
local function color_to_rgb(color)
  local function byte(value, offset)
    return bit.band(bit.rshift(value, offset), 0xFF)
  end

  local new_color = vim.api.nvim_get_color_by_name(color)
  if new_color == -1 then
    new_color = vim.opt.background:get() == "dark" and 000 or 255255255
  end

  return { byte(new_color, 16), byte(new_color, 8), byte(new_color, 0) }
end

local color_cache = {}

---@param color string Palette key or hex value
function M.parse_color(color)
  if color_cache[color] then
    return color_cache[color]
  end

  if color == nil then
    print("Invalid color: " .. color)
    return nil
  end

  color = color:lower()

  if not color:find("#") and color ~= "NONE" then
    color = require("repl69.palette")[color] or vim.api.nvim_get_color_by_name(color)
  end

  color_cache[color] = color
  return color
end

local blend_cache = {}

---@param fg string foreground color
---@param bg string background color
---@param alpha number|string number between 0 and 1. 0 results in bg, 1 results in fg
function M.blend(fg, alpha, bg)
  local cache_key = fg .. alpha .. bg
  if blend_cache[cache_key] then
    return blend_cache[cache_key]
  end

  local fg_rgb = color_to_rgb(fg)
  local bg_rgb = color_to_rgb(bg)

  local function blend_channel(i)
    local ret = (alpha * fg_rgb[i] + ((1 - alpha) * bg_rgb[i]))
    return math.floor(math.min(math.max(0, ret), 255) + 0.5)
  end

  local result = string.format("#%02X%02X%02X", blend_channel(1), blend_channel(2), blend_channel(3))

  blend_cache[cache_key] = result
  return result
end

function M.blend_bg(hex, amount, bg)
  return M.blend(hex, amount, bg or M.bg)
end

function M.blend_fg(hex, amount, fg)
  return M.blend(hex, amount, fg or M.fg)
end

return M

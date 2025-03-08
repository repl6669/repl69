local util = require("repl69.util")

local M = {}

---@type table<string, Palette|fun(opts:repl69.Config):Palette>
M.styles = setmetatable({}, {
  __index = function(_, style)
    return vim.deepcopy("repl69.colors." .. style)
  end,
})

---@param opts? repl69.Config
function M.setup(opts)
  opts = require("repl69.config").extend(opts)

  local palette = M.styles[opts.variant]
  if type(palette) == "function" then
    palette = palette(opts) --[[@as Palette]]
  end

  -- Color Palette
  ---@class ColorScheme: Palette
  local colors = palette

  colors.none = "NONE"

  colors.bg = colors.black
  colors.fg = colors.gray100

  colors.diff = {
    add = util.blend(colors.green700, 20),
    delete = util.blend(colors.red700, 20),
    change = util.blend(colors.yellow700, 20),
    text = colors.gray100,
  }

  colors.git.ignore = colors.gray600
  colors.black = util.blend(colors.bg, 0.8, "#000000")
  colors.border_highlight = util.blend(colors.black, 0.8)
  colors.border = colors.black

  -- Popups and statusline always get a dark background
  colors.bg_popup = colors.bg_dark
  colors.bg_statusline = colors.bg_dark

  -- Sidebar and Floats are configurable
  colors.bg_sidebar = opts.styles.sidebars == "transparent" and colors.none
    or opts.styles.sidebars == "dark" and colors.bg_dark
    or colors.bg

  colors.bg_float = opts.styles.floats == "transparent" and colors.none
    or opts.styles.floats == "dark" and colors.bg_dark
    or colors.bg

  colors.bg_visual = util.blend(colors.blue0, 0.4)
  colors.bg_search = colors.blue0
  colors.fg_sidebar = colors.fg_dark
  colors.fg_float = colors.fg

  colors.error = colors.red1
  colors.todo = colors.blue
  colors.warning = colors.yellow
  colors.info = colors.blue2
  colors.hint = colors.teal

  colors.rainbow = {
    colors.blue,
    colors.yellow,
    colors.green,
    colors.teal,
    colors.magenta,
    colors.purple,
    colors.orange,
    colors.red,
  }

  --- @class TerminalColors
  colors.terminal = {
    black = colors.gray750,
    black_bright = colors.gray700,
    red = colors.gray650,
    red_bright = colors.gray600,
    green = colors.gray550,
    green_bright = colors.gray500,
    yellow = colors.gray450,
    yellow_bright = colors.gray400,
    blue = colors.gray250,
    blue_bright = colors.gray200,
    magenta = colors.gray350,
    magenta_bright = colors.gray300,
    cyan = colors.gray100,
    cyan_bright = colors.gray50,
    white = colors.gray25,
    white_bright = colors.white,
  }

  opts.on_colors(colors)

  return colors, opts
end

return M

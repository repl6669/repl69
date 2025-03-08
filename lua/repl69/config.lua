local M = {}

M.defaults = {
  variant = "monochrome",
  dark_variant = "monochrome",
  light_variant = nil,
}

---@class repl69.Config
---@field on_colors fun(colors: ColorScheme)
---@field on_highlights fun(highlights: repl69.Highlights, colors: ColorScheme)
M.options = {
  variant = "monochrome",
  dark_variant = "monochrome",
  light_variant = nil,
  terminal_colors = true,
  styles = {
    bold = true,
    italic = true,
    transparency = false,
  },

  --- You can override specific color groups to use other groups or a hex color
  --- function will be called with a ColorScheme table
  ---@param colors ColorScheme
  on_colors = function(colors) end,

  --- You can override specific highlights to use other groups or a hex color
  --- function will be called with a Highlights and ColorScheme table
  ---@param highlights repl69.Highlights
  ---@param colors ColorScheme
  on_highlights = function(highlights, colors) end,

  cache = true, -- When set to true, the theme will be cached for better performance

  ---@type table<string, boolean|{enabled:boolean}>
  plugins = {
    -- enable all plugins when not using lazy.nvim
    -- set to false to manually enable/disable plugins
    all = package.loaded.lazy == nil,
    -- uses your plugin manager to automatically enable needed plugins
    -- currently only lazy.nvim is supported
    auto = true,
    -- add any plugins here that you want to enable
    -- for all possible plugins, see:
    --   * https://github.com/repl6669/repl69.nvim/tree/main/lua/repl69/groups
    -- telescope = true,
  },

  ---@type table<string, string | PaletteColor>
  groups = {
    base = "black",
    ink = "gray300",
    border = "gray900",
    panel = "gray950",

    error = "red700",
    hint = "green700",
    info = "cyan700",
    ok = "green700",
    warn = "orange700",
    note = "blue700",
    todo = "cyan700",

    git_add = "green700",
    git_change = "yellow700",
    git_delete = "red700",
    git_dirty = "gray300",
    git_ignore = "gray600",
    git_merge = "gray200",
    git_rename = "gray500",
    git_stage = "gray300",
    git_text = "gray100",
    git_untracked = "orange700",

    ---@type string | PaletteColor
    h1 = "gray400",
    h2 = "gray450",
    h3 = "gray500",
    h4 = "gray550",
    h5 = "gray600",
    h6 = "gray650",
  },
}

---@type repl69.Config
M.options = nil

---@param options? repl69.Config
function M.setup(options)
  M.options = vim.tbl_deep_extend("force", {}, M.defaults, options or {})
end

---@param opts? repl69.Config
function M.extend(opts)
  return opts and vim.tbl_deep_extend("force", {}, M.options, opts) or M.options
end

setmetatable(M, {
  __index = function(_, k)
    if k == "options" then
      return M.defaults
    end
  end,
})

return M

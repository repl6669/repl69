local config = require("repl69.config")

local M = {}
---@type {light?: string, dark?: string}
M.variants = {}

---@param opts? repl69.Config
function M.load(opts)
  opts = require("repl69.config").extend(opts)
  local bg = vim.o.background
  local style_bg = opts.variant == "monochrome" and "light" or "dark"

  if bg ~= style_bg then
    if vim.g.colors_name == "repl69-" .. opts.variant then
      opts.variant = bg == "light" and (M.variants.light or "monochrome") or (M.variants.dark or "monochrome")
    else
      vim.o.background = style_bg
    end
  end
  M.variants[vim.o.background] = opts.variant
  return require("repl69.theme").setup(opts)
end

M.setup = config.setup

return M

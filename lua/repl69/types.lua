---@class repl69.Highlight: vim.api.keyset.highlight
---@field style? vim.api.keyset.highlight

---@alias repl69.Highlights table<string,repl69.Highlight|string>

---@alias repl69.HighlightsFn fun(colors: ColorScheme, opts:repl69.Config):repl69.Highlights

---@class repl69.Cache
---@field groups repl69.Highlights
---@field inputs table

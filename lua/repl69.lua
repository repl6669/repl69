local M = {}
local config = require("repl69.config")

local function set_highlights()
	local colors = require("repl69.utils.colors")
	local palette = require("repl69.palette")
	local styles = config.options.styles

	local groups = {}

	for group, color in pairs(config.options.groups) do
		groups[group] = colors.parse_color(color)
	end

	local function make_border(fg)
		fg = fg or groups.border
		return {
			fg = fg,
			bg = palette.none,
		}
	end

	local highlights = {}

	local default_highlights = {
		ColorColumn = { bg = palette.gray12 },
		Conceal = { bg = "NONE" },
		CurSearch = { fg = palette.black, bg = palette.green, blend = 60 },
		Cursor = { fg = palette.gray84, bg = palette.gray28 },
		CursorColumn = { bg = palette.gray24 },
		-- CursorIM = {},
		CursorLine = { bg = palette.gray12 },
		CursorLineNr = { fg = palette.gray48, bold = styles.bold },
		-- DarkenedPanel = { },
		-- DarkenedStatusline = {},
		DiffAdd = { bg = groups.git_add, blend = 20 },
		DiffChange = { bg = groups.git_change, blend = 20 },
		DiffDelete = { bg = groups.git_delete, blend = 20 },
		DiffText = { bg = groups.git_text, blend = 40 },
		diffAdded = { link = "DiffAdd" },
		diffChanged = { link = "DiffChange" },
		diffRemoved = { link = "DiffDelete" },
		Directory = { fg = palette.gray68, bold = styles.bold },
		-- EndOfBuffer = {},
		ErrorMsg = { fg = groups.error, bold = styles.bold },
		FloatBorder = make_border(),
		FloatTitle = { fg = palette.gray68, bg = groups.panel, bold = styles.bold },
		FoldColumn = { fg = palette.gray16 },
		Folded = { fg = palette.gray84, bg = groups.panel },
		IncSearch = { link = "CurSearch" },
		LineNr = { fg = palette.gray16 },
		MatchParen = { fg = palette.gray44, bg = palette.gray44, blend = 25 },
		ModeMsg = { fg = palette.gray44 },
		MoreMsg = { fg = palette.gray60 },
		NonText = { fg = palette.gray16 },
		Normal = { fg = palette.gray76, bg = palette.black },
		NormalFloat = { bg = groups.panel },
		NormalNC = { fg = palette.gray84, bg = palette.black },
		NvimInternalError = { link = "ErrorMsg" },
		Pmenu = { fg = palette.gray44, bg = groups.panel },
		PmenuExtra = { fg = palette.gray16, bg = groups.panel },
		PmenuExtraSel = { fg = palette.gray44, bg = palette.gray24 },
		PmenuKind = { fg = palette.gray68, bg = groups.panel },
		PmenuKindSel = { fg = palette.gray44, bg = palette.gray24 },
		PmenuSbar = { bg = groups.panel },
		PmenuSel = { fg = palette.gray84, bg = palette.gray24 },
		PmenuThumb = { bg = palette.gray16 },
		Question = { fg = palette.gray52 },
		-- QuickFixLink = {},
		-- RedrawDebugNormal = {},
		RedrawDebugClear = { fg = palette.black, bg = palette.gray52 },
		RedrawDebugComposed = { fg = palette.black, bg = palette.gray44 },
		RedrawDebugRecompose = { fg = palette.black, bg = palette.gray36 },
		Search = { fg = palette.gray84, bg = palette.gray52, blend = 20 },
		SignColumn = { fg = palette.gray84, bg = "NONE" },
		SpecialKey = { fg = palette.gray68 },
		SpellBad = { sp = palette.gray44, undercurl = true },
		SpellCap = { sp = palette.gray44, undercurl = true },
		SpellLocal = { sp = palette.gray44, undercurl = true },
		SpellRare = { sp = palette.gray44, undercurl = true },
		StatusLine = { fg = palette.gray44, bg = groups.panel },
		StatusLineNC = { fg = palette.gray16, bg = groups.panel, blend = 60 },
		StatusLineTerm = { fg = palette.black, bg = palette.gray44 },
		StatusLineTermNC = { fg = palette.black, bg = palette.gray44, blend = 60 },
		Substitute = { link = "IncSearch" },
		TabLine = { fg = palette.gray44, bg = groups.panel },
		TabLineFill = { bg = groups.panel },
		TabLineSel = { fg = palette.gray84, bg = palette.gray24, bold = styles.bold },
		Title = { fg = palette.gray68, bold = styles.bold },
		VertSplit = { fg = groups.border },
		Visual = { bg = palette.gray60, blend = 20 },
		-- VisualNOS = {},
		WarningMsg = { fg = groups.warn, bold = styles.bold },
		-- Whitespace = {},
		WildMenu = { link = "IncSearch" },
		WinBar = { fg = palette.gray44, bg = groups.panel },
		WinBarNC = { fg = palette.gray16, bg = groups.panel, blend = 60 },
		WinSeparator = { fg = groups.border },

		DiagnosticError = { fg = groups.error },
		DiagnosticHint = { fg = groups.hint },
		DiagnosticInfo = { fg = groups.info },
		DiagnosticOk = { fg = groups.ok },
		DiagnosticWarn = { fg = groups.warn },
		DiagnosticDefaultError = { link = "DiagnosticError" },
		DiagnosticDefaultHint = { link = "DiagnosticHint" },
		DiagnosticDefaultInfo = { link = "DiagnosticInfo" },
		DiagnosticDefaultOk = { link = "DiagnosticOk" },
		DiagnosticDefaultWarn = { link = "DiagnosticWarn" },
		DiagnosticFloatingError = { link = "DiagnosticError" },
		DiagnosticFloatingHint = { link = "DiagnosticHint" },
		DiagnosticFloatingInfo = { link = "DiagnosticInfo" },
		DiagnosticFloatingOk = { link = "DiagnosticOk" },
		DiagnosticFloatingWarn = { link = "DiagnosticWarn" },
		DiagnosticSignError = { link = "DiagnosticError" },
		DiagnosticSignHint = { link = "DiagnosticHint" },
		DiagnosticSignInfo = { link = "DiagnosticInfo" },
		DiagnosticSignOk = { link = "DiagnosticOk" },
		DiagnosticSignWarn = { link = "DiagnosticWarn" },
		DiagnosticUnderlineError = { sp = groups.error, undercurl = true },
		DiagnosticUnderlineHint = { sp = groups.hint, undercurl = true },
		DiagnosticUnderlineInfo = { sp = groups.info, undercurl = true },
		DiagnosticUnderlineOk = { sp = groups.ok, undercurl = true },
		DiagnosticUnderlineWarn = { sp = groups.warn, undercurl = true },
		DiagnosticVirtualTextError = { fg = groups.error, bg = groups.error, blend = 10 },
		DiagnosticVirtualTextHint = { fg = groups.hint, bg = groups.hint, blend = 10 },
		DiagnosticVirtualTextInfo = { fg = groups.info, bg = groups.info, blend = 10 },
		DiagnosticVirtualTextOk = { fg = groups.ok, bg = groups.ok, blend = 10 },
		DiagnosticVirtualTextWarn = { fg = groups.warn, bg = groups.warn, blend = 10 },

		Boolean = { fg = palette.gray36, bold = styles.bold },
		Character = { fg = palette.gray36, bold = styles.bold },
		Comment = { fg = palette.gray28, italic = styles.italic },
		Conditional = { fg = palette.white, bold = styles.bold },
		Constant = { fg = palette.gray36, bold = styles.bold },
		Debug = { fg = palette.white },
		Define = { fg = palette.white, bold = styles.bold },
		Delimiter = { fg = palette.white },
		Error = { fg = palette.red, bold = styles.bold },
		Exception = { fg = palette.white },
		Float = { fg = palette.gray36, bold = styles.bold },
		Function = { fg = palette.white, bold = styles.bold },
		Identifier = { fg = palette.white, bold = styles.bold },
		Include = { fg = palette.white, bold = styles.bold },
		Keyword = { fg = palette.gray84, bold = styles.bold },
		Label = { fg = palette.white },
		LspCodeLens = { fg = palette.gray36 },
		LspCodeLensSeparator = { fg = palette.gray24 },
		LspInlayHint = { link = "Comment" },
		LspReferenceRead = { bg = palette.gray24 },
		LspReferenceText = { bg = palette.gray24 },
		LspReferenceWrite = { bg = palette.gray24 },
		Macro = { fg = palette.white, bold = styles.bold },
		Number = { fg = palette.gray36, bold = styles.bold },
		Operator = { fg = palette.gray60, bold = styles.bold },
		PreCondit = { fg = palette.white, bold = styles.bold },
		PreProc = { link = "PreCondit" },
		Repeat = { fg = palette.white },
		Special = { fg = palette.white },
		SpecialChar = { link = "Special" },
		SpecialComment = { fg = palette.gray36, bold = styles.bold },
		Statement = { fg = palette.white, bold = styles.bold },
		StorageClass = { fg = palette.white, bold = styles.bold },
		String = { fg = palette.gray48 },
		Structure = { fg = palette.white, bold = styles.bold },
		Tag = { fg = palette.white },
		Todo = { fg = palette.cyan500, bg = palette.cyan500, blend = 20, bold = styles.bold },
		Type = { fg = palette.gray84, bold = styles.bold },
		TypeDef = { link = "Type" },
		Underlined = { fg = palette.gray48, underline = true },

		healthError = { fg = groups.error },
		healthSuccess = { fg = groups.info },
		healthWarning = { fg = groups.warn },

		htmlArg = { fg = palette.gray60 },
		htmlBold = { bold = styles.bold },
		htmlEndTag = { fg = palette.gray44 },
		htmlH1 = { link = "markdownH1" },
		htmlH2 = { link = "markdownH2" },
		htmlH3 = { link = "markdownH3" },
		htmlH4 = { link = "markdownH4" },
		htmlH5 = { link = "markdownH5" },
		htmlItalic = { italic = styles.italic },
		htmlLink = { link = "markdownUrl" },
		htmlTag = { fg = palette.gray44 },
		htmlTagN = { fg = palette.gray84 },
		htmlTagName = { fg = palette.gray68 },

		markdownDelimiter = { fg = palette.gray44 },
		markdownH1 = { fg = groups.h1, bold = styles.bold },
		markdownH1Delimiter = { link = "markdownH1" },
		markdownH2 = { fg = groups.h2, bold = styles.bold },
		markdownH2Delimiter = { link = "markdownH2" },
		markdownH3 = { fg = groups.h3, bold = styles.bold },
		markdownH3Delimiter = { link = "markdownH3" },
		markdownH4 = { fg = groups.h4, bold = styles.bold },
		markdownH4Delimiter = { link = "markdownH4" },
		markdownH5 = { fg = groups.h5, bold = styles.bold },
		markdownH5Delimiter = { link = "markdownH5" },
		markdownH6 = { fg = groups.h6, bold = styles.bold },
		markdownH6Delimiter = { link = "markdownH6" },
		markdownLinkText = { link = "markdownUrl" },
		markdownUrl = { fg = groups.link, sp = groups.link, underline = true },

		mkdCode = { fg = palette.gray68, italic = styles.italic },
		mkdCodeDelimiter = { fg = palette.gray76 },
		mkdCodeEnd = { fg = palette.gray68 },
		mkdCodeStart = { fg = palette.gray68 },
		mkdFootnotes = { fg = palette.gray68 },
		mkdID = { fg = palette.gray68, underline = true },
		mkdInlineURL = { link = "markdownUrl" },
		mkdLink = { link = "markdownUrl" },
		mkdLinkDef = { link = "markdownUrl" },
		mkdListItemLine = { fg = palette.gray84 },
		mkdRule = { fg = palette.gray44 },
		mkdURL = { link = "markdownUrl" },

		--- Treesitter
		--- |:help treesitter-highlight-groups|
		["@variable"] = { fg = palette.gray84, italic = styles.italic },
		["@variable.builtin"] = { fg = palette.gray36, italic = styles.italic, bold = styles.bold },
		["@variable.parameter"] = { fg = palette.gray60, italic = styles.italic },
		["@variable.parameter.builtin"] = { fg = palette.gray60, italic = styles.italic, bold = styles.bold },
		["@variable.member"] = { fg = palette.gray68 },

		["@constant"] = { fg = palette.gray52 },
		["@constant.builtin"] = { fg = palette.gray52, bold = styles.bold },
		["@constant.macro"] = { fg = palette.gray52 },

		["@module"] = { fg = palette.gray52 },
		["@module.builtin"] = { fg = palette.gray52, bold = styles.bold },
		["@label"] = { link = "Label" },

		["@string"] = { link = "String" },
		-- ["@string.documentation"] = {},
		["@string.regexp"] = { fg = palette.gray60 },
		["@string.escape"] = { fg = palette.gray44 },
		["@string.special"] = { link = "String" },
		["@string.special.symbol"] = { link = "Identifier" },
		["@string.special.url"] = { fg = groups.link },
		-- ["@string.special.path"] = {},

		["@character"] = { link = "Character" },
		["@character.special"] = { link = "Character" },

		["@boolean"] = { link = "Boolean" },
		["@number"] = { link = "Number" },
		["@number.float"] = { link = "Number" },
		["@float"] = { link = "Number" },

		["@type"] = { fg = palette.gray76 },
		["@type.builtin"] = { fg = palette.gray76, bold = styles.bold },
		-- ["@type.definition"] = {},

		["@attribute"] = { fg = palette.gray60 },
		["@attribute.builtin"] = { fg = palette.gray60, bold = styles.bold },
		["@property"] = { fg = palette.gray68, italic = styles.italic },

		["@function"] = { fg = palette.gray76 },
		["@function.builtin"] = { fg = palette.gray76, bold = styles.bold },
		-- ["@function.call"] = {},
		["@function.macro"] = { link = "Function" },
		["@function.method"] = { fg = palette.gray76 },
		["@function.method.call"] = { fg = palette.gray60 },
		["@function.method.php"] = { link = "Function" },
		["@function.method.call.php"] = { link = "Function" },

		["@method.php"] = { link = "@function.method.php" },
		["@method.call.php"] = { link = "@function.method.call.php" },

		["@constructor"] = { fg = palette.gray68 },
		["@operator"] = { link = "Operator" },

		["@keyword"] = { link = "Keyword" },
		-- ["@keyword.coroutine"] = {},
		-- ["@keyword.function"] = {},
		["@keyword.operator"] = { fg = palette.gray68 },
		["@keyword.import"] = { fg = palette.gray68 },
		["@keyword.storage"] = { fg = palette.gray68 },
		["@keyword.repeat"] = { fg = palette.gray68 },
		["@keyword.return"] = { fg = palette.gray68 },
		["@keyword.debug"] = { fg = palette.gray68 },
		["@keyword.exception"] = { fg = palette.gray68 },

		["@keyword.conditional"] = { fg = palette.gray68 },
		["@keyword.conditional.ternary"] = { fg = palette.gray68 },

		["@keyword.directive"] = { fg = palette.gray68 },
		["@keyword.directive.define"] = { fg = palette.gray68 },

		--- Punctuation
		["@punctuation.delimiter"] = { fg = palette.gray44 },
		["@punctuation.bracket"] = { fg = palette.gray44 },
		["@punctuation.special"] = { fg = palette.gray44 },

		--- Comments
		["@comment"] = { link = "Comment" },
		-- ["@comment.documentation"] = {},

		["@comment.error"] = { fg = groups.error },
		["@comment.warning"] = { fg = groups.warn },
		["@comment.todo"] = { fg = groups.todo, bg = groups.todo, blend = 15 },
		["@comment.hint"] = { fg = groups.hint, bg = groups.hint, blend = 15 },
		["@comment.info"] = { fg = groups.info, bg = groups.info, blend = 15 },
		["@comment.note"] = { fg = groups.note, bg = groups.note, blend = 15 },

		--- Markup
		["@markup.strong"] = { bold = styles.bold },
		["@markup.italic"] = { italic = styles.italic },
		["@markup.strikethrough"] = { strikethrough = true },
		["@markup.underline"] = { underline = true },

		["@markup.heading"] = { fg = palette.gray68, bold = styles.bold },

		["@markup.quote"] = { fg = palette.gray84 },
		["@markup.math"] = { link = "Special" },
		["@markup.environment"] = { link = "Macro" },
		["@markup.environment.name"] = { link = "@type" },

		-- ["@markup.link"] = {},
		["@markup.link.markdown_inline"] = { fg = palette.gray44 },
		["@markup.link.label.markdown_inline"] = { fg = palette.gray68 },
		["@markup.link.url"] = { fg = groups.link },

		-- ["@markup.raw"] = { bg = palette.gray12 },
		-- ["@markup.raw.block"] = { bg = palette.gray12 },
		["@markup.raw.delimiter.markdown"] = { fg = palette.gray44 },

		["@markup.list"] = { fg = palette.gray44 },
		["@markup.list.checked"] = { fg = palette.gray68, bg = palette.gray68, blend = 10 },
		["@markup.list.unchecked"] = { fg = palette.gray84 },

		-- Markdown headings
		["@markup.heading.1.markdown"] = { link = "markdownH1" },
		["@markup.heading.2.markdown"] = { link = "markdownH2" },
		["@markup.heading.3.markdown"] = { link = "markdownH3" },
		["@markup.heading.4.markdown"] = { link = "markdownH4" },
		["@markup.heading.5.markdown"] = { link = "markdownH5" },
		["@markup.heading.6.markdown"] = { link = "markdownH6" },
		["@markup.heading.1.marker.markdown"] = { link = "markdownH1Delimiter" },
		["@markup.heading.2.marker.markdown"] = { link = "markdownH2Delimiter" },
		["@markup.heading.3.marker.markdown"] = { link = "markdownH3Delimiter" },
		["@markup.heading.4.marker.markdown"] = { link = "markdownH4Delimiter" },
		["@markup.heading.5.marker.markdown"] = { link = "markdownH5Delimiter" },
		["@markup.heading.6.marker.markdown"] = { link = "markdownH6Delimiter" },

		["@diff.plus"] = { fg = groups.git_add, bg = groups.git_add, blend = 20 },
		["@diff.minus"] = { fg = groups.git_delete, bg = groups.git_delete, blend = 20 },
		["@diff.delta"] = { bg = groups.git_change, blend = 20 },

		["@tag"] = { link = "Tag" },
		["@tag.attribute"] = { fg = palette.gray60 },
		["@tag.delimiter"] = { fg = palette.gray44 },

		--- Non-highlighting captures
		-- ["@none"] = {},
		["@conceal"] = { link = "Conceal" },
		["@conceal.markdown"] = { fg = palette.gray44 },

		-- ["@spell"] = {},
		-- ["@nospell"] = {},

		--- Semantic
		["@lsp.type.comment"] = {},
		["@lsp.type.comment.c"] = { link = "@comment" },
		["@lsp.type.comment.cpp"] = { link = "@comment" },
		["@lsp.type.enum"] = { link = "@type" },
		["@lsp.type.interface"] = { link = "@interface" },
		["@lsp.type.keyword"] = { link = "@keyword" },
		["@lsp.type.namespace"] = { link = "@namespace" },
		["@lsp.type.namespace.python"] = { link = "@variable" },
		["@lsp.type.parameter"] = { link = "@parameter" },
		["@lsp.type.property"] = { link = "@property" },
		["@lsp.type.variable"] = {}, -- defer to treesitter for regular variables
		["@lsp.type.variable.svelte"] = { link = "@variable" },
		["@lsp.typemod.function.defaultLibrary"] = { link = "@function.builtin" },
		["@lsp.typemod.operator.injected"] = { link = "@operator" },
		["@lsp.typemod.string.injected"] = { link = "@string" },
		["@lsp.typemod.variable.constant"] = { link = "@constant" },
		["@lsp.typemod.variable.defaultLibrary"] = { link = "@variable.builtin" },
		["@lsp.typemod.variable.injected"] = { link = "@variable" },

		--- Plugins
		-- romgrk/barbar.nvim
		BufferCurrent = { fg = palette.gray84, bg = palette.gray24 },
		BufferCurrentIndex = { fg = palette.gray84, bg = palette.gray24 },
		BufferCurrentMod = { fg = palette.gray68, bg = palette.gray24 },
		BufferCurrentSign = { fg = palette.gray44, bg = palette.gray24 },
		BufferCurrentTarget = { fg = palette.gray52, bg = palette.gray24 },
		BufferInactive = { fg = palette.gray44 },
		BufferInactiveIndex = { fg = palette.gray44 },
		BufferInactiveMod = { fg = palette.gray68 },
		BufferInactiveSign = { fg = palette.gray16 },
		BufferInactiveTarget = { fg = palette.gray52 },
		BufferTabpageFill = { fg = "NONE", bg = "NONE" },
		BufferVisible = { fg = palette.gray44 },
		BufferVisibleIndex = { fg = palette.gray44 },
		BufferVisibleMod = { fg = palette.gray68 },
		BufferVisibleSign = { fg = palette.gray16 },
		BufferVisibleTarget = { fg = palette.gray52 },

		-- lewis6991/gitsigns.nvim
		GitSignsAdd = { fg = groups.git_add, bg = "NONE" },
		GitSignsChange = { fg = groups.git_change, bg = "NONE" },
		GitSignsDelete = { fg = groups.git_delete, bg = "NONE" },
		SignAdd = { fg = groups.git_add, bg = "NONE" },
		SignChange = { fg = groups.git_change, bg = "NONE" },
		SignDelete = { fg = groups.git_delete, bg = "NONE" },

		-- mvllow/modes.nvim
		ModesCopy = { bg = palette.gray52 },
		ModesDelete = { bg = palette.gray36 },
		ModesInsert = { bg = palette.gray68 },
		ModesReplace = { bg = palette.gray44 },
		ModesVisual = { bg = palette.gray60 },

		-- kyazdani42/nvim-tree.lua
		NvimTreeEmptyFolderName = { fg = palette.gray16 },
		NvimTreeFileDeleted = { fg = groups.git_delete },
		NvimTreeFileDirty = { fg = groups.git_dirty },
		NvimTreeFileMerge = { fg = groups.git_merge },
		NvimTreeFileNew = { fg = palette.gray68 },
		NvimTreeFileRenamed = { fg = groups.git_rename },
		NvimTreeFileStaged = { fg = groups.git_stage },
		NvimTreeFolderIcon = { fg = palette.gray44 },
		NvimTreeFolderName = { fg = palette.gray68 },
		NvimTreeGitDeleted = { fg = groups.git_delete },
		NvimTreeGitDirty = { fg = groups.git_dirty },
		NvimTreeGitIgnored = { fg = groups.git_ignore },
		NvimTreeGitMerge = { fg = groups.git_merge },
		NvimTreeGitNew = { fg = groups.git_add },
		NvimTreeGitRenamed = { fg = groups.git_rename },
		NvimTreeGitStaged = { fg = groups.git_stage },
		NvimTreeImageFile = { fg = palette.gray84 },
		NvimTreeNormal = { link = "Normal" },
		NvimTreeOpenedFile = { fg = palette.gray84, bg = palette.gray24 },
		NvimTreeOpenedFolderName = { link = "NvimTreeFolderName" },
		NvimTreeRootFolder = { fg = palette.gray68, bold = styles.bold },
		NvimTreeSpecialFile = { link = "NvimTreeNormal" },
		NvimTreeWindowPicker = { link = "StatusLineTerm" },

		-- nvim-neotest/neotest
		NeotestAdapterName = { fg = palette.gray60 },
		NeotestBorder = { fg = palette.gray20 },
		NeotestDir = { fg = palette.gray68 },
		NeotestExpandMarker = { fg = palette.gray20 },
		NeotestFailed = { fg = palette.gray36 },
		NeotestFile = { fg = palette.gray84 },
		NeotestFocused = { fg = palette.gray52, bg = palette.gray20 },
		NeotestIndent = { fg = palette.gray20 },
		NeotestMarked = { fg = palette.gray76, bold = styles.bold },
		NeotestNamespace = { fg = palette.gray52 },
		NeotestPassed = { fg = palette.gray44 },
		NeotestRunning = { fg = palette.gray52 },
		NeotestWinSelect = { fg = palette.gray16 },
		NeotestSkipped = { fg = palette.gray44 },
		NeotestTarget = { fg = palette.gray36 },
		NeotestTest = { fg = palette.gray52 },
		NeotestUnknown = { fg = palette.gray44 },
		NeotestWatching = { fg = palette.gray60 },

		-- nvim-neo-tree/neo-tree.nvim
		NeoTreeGitAdded = { fg = groups.git_add },
		NeoTreeGitConflict = { fg = groups.git_merge },
		NeoTreeGitDeleted = { fg = groups.git_delete },
		NeoTreeGitIgnored = { fg = groups.git_ignore },
		NeoTreeGitModified = { fg = groups.git_dirty },
		NeoTreeGitRenamed = { fg = groups.git_rename },
		NeoTreeGitUntracked = { fg = groups.git_untracked },
		NeoTreeTabActive = { fg = palette.gray84, bg = palette.gray24 },
		NeoTreeTabInactive = { fg = palette.gray44 },
		NeoTreeTabSeparatorActive = { link = "WinSeparator" },
		NeoTreeTabSeparatorInactive = { link = "WinSeparator" },
		NeoTreeTitleBar = { link = "StatusLineTerm" },

		-- folke/flash.nvim
		FlashLabel = { fg = palette.black, bg = palette.gray36 },

		-- folke/which-key.nvim
		WhichKey = { fg = palette.gray60 },
		WhichKeyBorder = make_border(),
		WhichKeyDesc = { fg = palette.gray52 },
		WhichKeyFloat = { bg = groups.panel },
		WhichKeyGroup = { fg = palette.gray68 },
		WhichKeyIcon = { fg = palette.gray68 },
		WhichKeyIconAzure = { fg = palette.gray68 },
		WhichKeyIconBlue = { fg = palette.gray68 },
		WhichKeyIconCyan = { fg = palette.gray68 },
		WhichKeyIconGreen = { fg = palette.gray68 },
		WhichKeyIconGrey = { fg = palette.gray68 },
		WhichKeyIconOrange = { fg = palette.gray68 },
		WhichKeyIconPurple = { fg = palette.gray68 },
		WhichKeyIconRed = { fg = palette.gray68 },
		WhichKeyIconYellow = { fg = palette.gray68 },
		WhichKeyNormal = { link = "NormalFloat" },
		WhichKeySeparator = { fg = palette.gray44 },
		WhichKeyTitle = { link = "FloatTitle" },
		WhichKeyValue = { fg = palette.gray76 },

		-- lukas-reineke/indent-blankline.nvim
		IblIndent = { fg = palette.gray24 },
		IblScope = { fg = palette.gray68 },
		IblWhitespace = { fg = palette.gray24 },

		-- hrsh7th/nvim-cmp
		CmpItemAbbr = { fg = palette.gray44 },
		CmpItemAbbrDeprecated = { fg = palette.gray44, strikethrough = true },
		CmpItemAbbrMatch = { fg = palette.gray84, bold = styles.bold },
		CmpItemAbbrMatchFuzzy = { fg = palette.gray84, bold = styles.bold },
		CmpItemKind = { fg = palette.gray44 },
		CmpItemKindClass = { link = "StorageClass" },
		CmpItemKindFunction = { link = "Function" },
		CmpItemKindInterface = { link = "Type" },
		CmpItemKindMethod = { link = "PreProc" },
		CmpItemKindSnippet = { link = "String" },
		CmpItemKindVariable = { link = "Identifier" },

		-- NeogitOrg/neogit
		-- https://github.com/NeogitOrg/neogit/blob/master/lua/neogit/lib/hl.lua#L109-L198
		NeogitChangeAdded = { fg = groups.git_add, bold = styles.bold, italic = styles.italic },
		NeogitChangeBothModified = { fg = groups.git_change, bold = styles.bold, italic = styles.italic },
		NeogitChangeCopied = { fg = groups.git_untracked, bold = styles.bold, italic = styles.italic },
		NeogitChangeDeleted = { fg = groups.git_delete, bold = styles.bold, italic = styles.italic },
		NeogitChangeModified = { fg = groups.git_change, bold = styles.bold, italic = styles.italic },
		NeogitChangeNewFile = { fg = groups.git_stage, bold = styles.bold, italic = styles.italic },
		NeogitChangeRenamed = { fg = groups.git_rename, bold = styles.bold, italic = styles.italic },
		NeogitChangeUpdated = { fg = groups.git_change, bold = styles.bold, italic = styles.italic },
		NeogitDiffAddHighlight = { link = "DiffAdd" },
		NeogitDiffContextHighlight = { bg = palette.gray12 },
		NeogitDiffDeleteHighlight = { link = "DiffDelete" },
		NeogitFilePath = { fg = palette.gray68, italic = styles.italic },
		NeogitHunkHeader = { bg = groups.panel },
		NeogitHunkHeaderHighlight = { bg = groups.panel },

		-- vimwiki/vimwiki
		VimwikiHR = { fg = palette.gray44 },
		VimwikiHeader1 = { link = "markdownH1" },
		VimwikiHeader2 = { link = "markdownH2" },
		VimwikiHeader3 = { link = "markdownH3" },
		VimwikiHeader4 = { link = "markdownH4" },
		VimwikiHeader5 = { link = "markdownH5" },
		VimwikiHeader6 = { link = "markdownH6" },
		VimwikiHeaderChar = { fg = palette.gray44 },
		VimwikiLink = { link = "markdownUrl" },
		VimwikiList = { fg = palette.gray60 },
		VimwikiNoExistsLink = { fg = palette.gray36 },

		-- nvim-neorg/neorg
		NeorgHeading1Prefix = { link = "markdownH1Delimiter" },
		NeorgHeading1Title = { link = "markdownH1" },
		NeorgHeading2Prefix = { link = "markdownH2Delimiter" },
		NeorgHeading2Title = { link = "markdownH2" },
		NeorgHeading3Prefix = { link = "markdownH3Delimiter" },
		NeorgHeading3Title = { link = "markdownH3" },
		NeorgHeading4Prefix = { link = "markdownH4Delimiter" },
		NeorgHeading4Title = { link = "markdownH4" },
		NeorgHeading5Prefix = { link = "markdownH5Delimiter" },
		NeorgHeading5Title = { link = "markdownH5" },
		NeorgHeading6Prefix = { link = "markdownH6Delimiter" },
		NeorgHeading6Title = { link = "markdownH6" },
		NeorgMarkerTitle = { fg = palette.gray68, bold = styles.bold },

		-- tami5/lspsaga.nvim (fork of glepnir/lspsaga.nvim)
		DefinitionCount = { fg = palette.gray76 },
		DefinitionIcon = { fg = palette.gray76 },
		DefinitionPreviewTitle = { fg = palette.gray76, bold = styles.bold },
		LspFloatWinBorder = make_border(),
		LspFloatWinNormal = { bg = groups.panel },
		LspSagaAutoPreview = { fg = palette.gray44 },
		LspSagaCodeActionBorder = make_border(palette.gray76),
		LspSagaCodeActionContent = { fg = palette.gray68 },
		LspSagaCodeActionTitle = { fg = palette.gray52, bold = styles.bold },
		LspSagaCodeActionTruncateLine = { link = "LspSagaCodeActionBorder" },
		LspSagaDefPreviewBorder = make_border(),
		LspSagaDiagnosticBorder = make_border(palette.gray52),
		LspSagaDiagnosticHeader = { fg = palette.gray68, bold = styles.bold },
		LspSagaDiagnosticTruncateLine = { link = "LspSagaDiagnosticBorder" },
		LspSagaDocTruncateLine = { link = "LspSagaHoverBorder" },
		LspSagaFinderSelection = { fg = palette.gray52 },
		LspSagaHoverBorder = { link = "LspFloatWinBorder" },
		LspSagaLspFinderBorder = { link = "LspFloatWinBorder" },
		LspSagaRenameBorder = make_border(palette.gray44),
		LspSagaRenamePromptPrefix = { fg = palette.gray36 },
		LspSagaShTruncateLine = { link = "LspSagaSignatureHelpBorder" },
		LspSagaSignatureHelpBorder = make_border(palette.gray68),
		ReferencesCount = { fg = palette.gray76 },
		ReferencesIcon = { fg = palette.gray76 },
		SagaShadow = { bg = palette.gray24 },
		TargetWord = { fg = palette.gray60 },

		-- ray-x/lsp_signature.nvim
		LspSignatureActiveParameter = { bg = palette.gray24 },

		-- rlane/pounce.nvim
		PounceAccept = { fg = palette.gray36, bg = palette.gray36, blend = 20 },
		PounceAcceptBest = { fg = palette.gray52, bg = palette.gray52, blend = 20 },
		PounceGap = { link = "Search" },
		PounceMatch = { link = "Search" },

		-- ggandor/leap.nvim
		LeapLabelPrimary = { link = "IncSearch" },
		LeapLabelSecondary = { link = "StatusLineTerm" },
		LeapMatch = { link = "MatchParen" },

		-- phaazon/hop.nvim
		-- smoka7/hop.nvim
		HopNextKey = { fg = palette.gray36, bg = palette.gray36, blend = 20 },
		HopNextKey1 = { fg = palette.gray68, bg = palette.gray68, blend = 20 },
		HopNextKey2 = { fg = palette.gray44, bg = palette.gray44, blend = 20 },
		HopUnmatched = { fg = palette.gray16 },

		-- nvim-telescope/telescope.nvim
		TelescopeBorder = make_border(),
		TelescopeMatching = { fg = palette.gray76 },
		TelescopeNormal = { link = "NormalFloat" },
		TelescopePromptNormal = { link = "TelescopeNormal" },
		TelescopePromptPrefix = { fg = palette.gray44 },
		TelescopeSelection = { fg = palette.gray84, bg = palette.gray24 },
		TelescopeSelectionCaret = { fg = palette.gray76, bg = palette.gray24 },
		TelescopeTitle = { fg = palette.gray68, bold = styles.bold },

		-- ibhagwan/fzf-lua
		FzfLuaBorder = make_border(),
		FzfLuaBufFlagAlt = { fg = palette.gray44 },
		FzfLuaBufFlagCur = { fg = palette.gray44 },
		FzfLuaCursorLine = { fg = palette.gray84, bg = palette.gray12 },
		FzfLuaFilePart = { fg = palette.gray48 },
		FzfLuaHeaderBind = { fg = palette.gray76 },
		FzfLuaHeaderText = { fg = palette.gray36 },
		FzfLuaNormal = { link = "NormalFloat" },
		FzfLuaTitle = { link = "FloatTitle" },

		-- rcarriga/nvim-notify
		NotifyBackground = { link = "NormalFloat" },
		NotifyDEBUGBody = { link = "NormalFloat" },
		NotifyDEBUGBorder = make_border(),
		NotifyDEBUGIcon = { link = "NotifyDEBUGTitle" },
		NotifyDEBUGTitle = { fg = palette.gray16 },
		NotifyERRORBody = { link = "NormalFloat" },
		NotifyERRORBorder = make_border(groups.error),
		NotifyERRORIcon = { link = "NotifyERRORTitle" },
		NotifyERRORTitle = { fg = groups.error },
		NotifyINFOBody = { link = "NormalFloat" },
		NotifyINFOBorder = make_border(groups.info),
		NotifyINFOIcon = { link = "NotifyINFOTitle" },
		NotifyINFOTitle = { fg = groups.info },
		NotifyTRACEBody = { link = "NormalFloat" },
		NotifyTRACEBorder = make_border(palette.gray60),
		NotifyTRACEIcon = { link = "NotifyTRACETitle" },
		NotifyTRACETitle = { fg = palette.gray60 },
		NotifyWARNBody = { link = "NormalFloat" },
		NotifyWARNBorder = make_border(groups.warn),
		NotifyWARNIcon = { link = "NotifyWARNTitle" },
		NotifyWARNTitle = { fg = groups.warn },

		-- rcarriga/nvim-dap-ui
		DapUIBreakpointsCurrentLine = { fg = palette.gray52, bold = styles.bold },
		DapUIBreakpointsDisabledLine = { fg = palette.gray16 },
		DapUIBreakpointsInfo = { link = "DapUIThread" },
		DapUIBreakpointsLine = { link = "DapUIBreakpointsPath" },
		DapUIBreakpointsPath = { fg = palette.gray68 },
		DapUIDecoration = { link = "DapUIBreakpointsPath" },
		DapUIFloatBorder = make_border(),
		DapUIFrameName = { fg = palette.gray84 },
		DapUILineNumber = { link = "DapUIBreakpointsPath" },
		DapUIModifiedValue = { fg = palette.gray68, bold = styles.bold },
		DapUIScope = { link = "DapUIBreakpointsPath" },
		DapUISource = { fg = palette.gray60 },
		DapUIStoppedThread = { link = "DapUIBreakpointsPath" },
		DapUIThread = { fg = palette.gray52 },
		DapUIValue = { fg = palette.gray84 },
		DapUIVariable = { fg = palette.gray84 },
		DapUIWatchesEmpty = { fg = palette.gray36 },
		DapUIWatchesError = { link = "DapUIWatchesEmpty" },
		DapUIWatchesValue = { link = "DapUIThread" },

		-- glepnir/dashboard-nvim
		DashboardCenter = { fg = palette.gray52 },
		DashboardFooter = { fg = palette.gray60 },
		DashboardHeader = { fg = palette.gray44 },
		DashboardShortcut = { fg = palette.gray36 },

		-- SmiteshP/nvim-navic
		NavicIconsArray = { fg = palette.gray52 },
		NavicIconsBoolean = { fg = palette.gray76 },
		NavicIconsClass = { fg = palette.gray68 },
		NavicIconsConstant = { fg = palette.gray52 },
		NavicIconsConstructor = { fg = palette.gray52 },
		NavicIconsEnum = { fg = palette.gray52 },
		NavicIconsEnumMember = { fg = palette.gray68 },
		NavicIconsEvent = { fg = palette.gray52 },
		NavicIconsField = { fg = palette.gray68 },
		NavicIconsFile = { fg = palette.gray16 },
		NavicIconsFunction = { fg = palette.gray44 },
		NavicIconsInterface = { fg = palette.gray68 },
		NavicIconsKey = { fg = palette.gray60 },
		NavicIconsKeyword = { fg = palette.gray44 },
		NavicIconsMethod = { fg = palette.gray60 },
		NavicIconsModule = { fg = palette.gray76 },
		NavicIconsNamespace = { fg = palette.gray16 },
		NavicIconsNull = { fg = palette.gray36 },
		NavicIconsNumber = { fg = palette.gray52 },
		NavicIconsObject = { fg = palette.gray52 },
		NavicIconsOperator = { fg = palette.gray44 },
		NavicIconsPackage = { fg = palette.gray16 },
		NavicIconsProperty = { fg = palette.gray68 },
		NavicIconsString = { fg = palette.gray52 },
		NavicIconsStruct = { fg = palette.gray68 },
		NavicIconsTypeParameter = { fg = palette.gray68 },
		NavicIconsVariable = { fg = palette.gray84 },
		NavicSeparator = { fg = palette.gray44 },
		NavicText = { fg = palette.gray44 },

		-- folke/noice.nvim
		NoiceCursor = { fg = palette.gray28, bg = palette.gray84 },

		-- folke/trouble.nvim
		TroubleText = { fg = palette.gray44 },
		TroubleCount = { fg = palette.gray60, bg = palette.gray12 },
		TroubleNormal = { fg = palette.gray84, bg = groups.panel },

		-- echasnovski/mini.nvim
		MiniAnimateCursor = { reverse = true, nocombine = true },
		MiniAnimateNormalFloat = { link = "NormalFloat" },

		MiniClueBorder = { link = "FloatBorder" },
		MiniClueDescGroup = { link = "DiagnosticFloatingWarn" },
		MiniClueDescSingle = { link = "NormalFloat" },
		MiniClueNextKey = { link = "DiagnosticFloatingHint" },
		MiniClueNextKeyWithPostkeys = { link = "DiagnosticFloatingError" },
		MiniClueSeparator = { link = "DiagnosticFloatingInfo" },
		MiniClueTitle = { bg = groups.panel, bold = styles.bold },

		MiniCompletionActiveParameter = { underline = true },

		MiniCursorword = { underline = true },
		MiniCursorwordCurrent = { underline = true },

		MiniDepsChangeAdded = { fg = groups.git_add },
		MiniDepsChangeRemoved = { fg = groups.git_delete },
		MiniDepsHint = { link = "DiagnosticHint" },
		MiniDepsInfo = { link = "DiagnosticInfo" },
		MiniDepsMsgBreaking = { link = "DiagnosticWarn" },
		MiniDepsPlaceholder = { link = "Comment" },
		MiniDepsTitle = { link = "Title" },
		MiniDepsTitleError = { link = "DiffDelete" },
		MiniDepsTitleSame = { link = "DiffText" },
		MiniDepsTitleUpdate = { link = "DiffAdd" },

		MiniDiffOverAdd = { fg = groups.git_add, bg = groups.git_add, blend = 20 },
		MiniDiffOverChange = { fg = groups.git_change, bg = groups.git_change, blend = 20 },
		MiniDiffOverContext = { bg = palette.gray12 },
		MiniDiffOverDelete = { fg = groups.git_delete, bg = groups.git_delete, blend = 20 },
		MiniDiffSignAdd = { fg = groups.git_add },
		MiniDiffSignChange = { fg = groups.git_change },
		MiniDiffSignDelete = { fg = groups.git_delete },

		MiniFilesBorder = { link = "FloatBorder" },
		MiniFilesBorderModified = { link = "DiagnosticFloatingWarn" },
		MiniFilesCursorLine = { link = "CursorLine" },
		MiniFilesDirectory = { link = "Directory" },
		MiniFilesFile = { fg = palette.gray84 },
		MiniFilesNormal = { link = "NormalFloat" },
		MiniFilesTitle = { link = "FloatTitle" },
		MiniFilesTitleFocused = { fg = palette.gray76, bg = groups.panel, bold = styles.bold },

		MiniHipatternsFixme = { fg = palette.black, bg = groups.error, bold = styles.bold },
		MiniHipatternsHack = { fg = palette.black, bg = groups.warn, bold = styles.bold },
		MiniHipatternsNote = { fg = palette.black, bg = groups.info, bold = styles.bold },
		MiniHipatternsTodo = { fg = palette.black, bg = groups.hint, bold = styles.bold },

		MiniIconsAzure = { fg = palette.gray68 },
		MiniIconsBlue = { fg = palette.gray68 },
		MiniIconsCyan = { fg = palette.gray68 },
		MiniIconsGreen = { fg = palette.gray68 },
		MiniIconsGrey = { fg = palette.gray68 },
		MiniIconsOrange = { fg = palette.gray68 },
		MiniIconsPurple = { fg = palette.gray68 },
		MiniIconsRed = { fg = palette.gray68 },
		MiniIconsYellow = { fg = palette.gray68 },

		MiniIndentscopeSymbol = { fg = palette.gray16 },
		MiniIndentscopeSymbolOff = { fg = palette.gray52 },

		MiniJump = { sp = palette.gray52, undercurl = true },

		MiniJump2dDim = { fg = palette.gray44 },
		MiniJump2dSpot = { fg = palette.gray52, bold = styles.bold, nocombine = true },
		MiniJump2dSpotAhead = { fg = palette.gray68, bg = palette.gray12, nocombine = true },
		MiniJump2dSpotUnique = { fg = palette.gray76, bold = styles.bold, nocombine = true },

		MiniMapNormal = { link = "NormalFloat" },
		MiniMapSymbolCount = { link = "Special" },
		MiniMapSymbolLine = { link = "Title" },
		MiniMapSymbolView = { link = "Delimiter" },

		MiniNotifyBorder = { link = "FloatBorder" },
		MiniNotifyNormal = { link = "NormalFloat" },
		MiniNotifyTitle = { link = "FloatTitle" },

		MiniOperatorsExchangeFrom = { link = "IncSearch" },

		MiniPickBorder = { link = "FloatBorder" },
		MiniPickBorderBusy = { link = "DiagnosticFloatingWarn" },
		MiniPickBorderText = { bg = groups.panel },
		MiniPickIconDirectory = { link = "Directory" },
		MiniPickIconFile = { link = "MiniPickNormal" },
		MiniPickHeader = { link = "DiagnosticFloatingHint" },
		MiniPickMatchCurrent = { link = "CursorLine" },
		MiniPickMatchMarked = { link = "Visual" },
		MiniPickMatchRanges = { fg = palette.gray68 },
		MiniPickNormal = { link = "NormalFloat" },
		MiniPickPreviewLine = { link = "CursorLine" },
		MiniPickPreviewRegion = { link = "IncSearch" },
		MiniPickPrompt = { bg = groups.panel, bold = styles.bold },

		MiniStarterCurrent = { nocombine = true },
		MiniStarterFooter = { fg = palette.gray44 },
		MiniStarterHeader = { link = "Title" },
		MiniStarterInactive = { link = "Comment" },
		MiniStarterItem = { link = "Normal" },
		MiniStarterItemBullet = { link = "Delimiter" },
		MiniStarterItemPrefix = { link = "WarningMsg" },
		MiniStarterSection = { fg = palette.gray76 },
		MiniStarterQuery = { link = "MoreMsg" },

		MiniStatuslineDevinfo = { fg = palette.gray44, bg = palette.gray24 },
		MiniStatuslineFileinfo = { link = "MiniStatuslineDevinfo" },
		MiniStatuslineFilename = { fg = palette.gray16, bg = palette.gray12 },
		MiniStatuslineInactive = { link = "MiniStatuslineFilename" },
		MiniStatuslineModeCommand = { fg = palette.black, bg = palette.gray36, bold = styles.bold },
		MiniStatuslineModeInsert = { fg = palette.black, bg = palette.gray68, bold = styles.bold },
		MiniStatuslineModeNormal = { fg = palette.black, bg = palette.gray76, bold = styles.bold },
		MiniStatuslineModeOther = { fg = palette.black, bg = palette.gray76, bold = styles.bold },
		MiniStatuslineModeReplace = { fg = palette.black, bg = palette.gray44, bold = styles.bold },
		MiniStatuslineModeVisual = { fg = palette.black, bg = palette.gray60, bold = styles.bold },

		MiniSurround = { link = "IncSearch" },

		MiniTablineCurrent = { fg = palette.gray84, bg = palette.gray24, bold = styles.bold },
		MiniTablineFill = { link = "TabLineFill" },
		MiniTablineHidden = { fg = palette.gray44, bg = groups.panel },
		MiniTablineModifiedCurrent = { fg = palette.gray24, bg = palette.gray84, bold = styles.bold },
		MiniTablineModifiedHidden = { fg = groups.panel, bg = palette.gray44 },
		MiniTablineModifiedVisible = { fg = groups.panel, bg = palette.gray84 },
		MiniTablineTabpagesection = { link = "Search" },
		MiniTablineVisible = { fg = palette.gray84, bg = groups.panel },

		MiniTestEmphasis = { bold = styles.bold },
		MiniTestFail = { fg = palette.gray36, bold = styles.bold },
		MiniTestPass = { fg = palette.gray68, bold = styles.bold },

		MiniTrailspace = { bg = palette.gray36 },

		-- goolord/alpha-nvim
		AlphaButtons = { fg = palette.gray68 },
		AlphaFooter = { fg = palette.gray52 },
		AlphaHeader = { fg = palette.gray44 },
		AlphaShortcut = { fg = palette.gray76 },

		-- github/copilot.vim
		CopilotSuggestion = { fg = palette.gray36, italic = styles.italic },

		-- nvim-treesitter/nvim-treesitter-context
		TreesitterContext = { bg = palette.gray04 },
		TreesitterContextLineNumber = { fg = palette.gray48, bg = palette.gray04 },

		-- RRethy/vim-illuminate
		IlluminatedWordRead = { link = "LspReferenceRead" },
		IlluminatedWordText = { link = "LspReferenceText" },
		IlluminatedWordWrite = { link = "LspReferenceWrite" },

		-- HiPhish/rainbow-delimiters.nvim
		RainbowDelimiterBlue = { fg = palette.blue700 },
		RainbowDelimiterCyan = { fg = palette.cyan700 },
		RainbowDelimiterGreen = { fg = palette.green700 },
		RainbowDelimiterOrange = { fg = palette.orange700 },
		RainbowDelimiterRed = { fg = palette.red700 },
		RainbowDelimiterViolet = { fg = palette.purple700 },
		RainbowDelimiterYellow = { fg = palette.yellow700 },

		-- MeanderingProgrammer/render-markdown.nvim
		RenderMarkdownBullet = { fg = palette.gray76 },
		RenderMarkdownChecked = { fg = palette.gray68 },
		RenderMarkdownCode = { bg = palette.gray24 },
		RenderMarkdownCodeInline = { fg = palette.gray84, bg = palette.gray24 },
		RenderMarkdownDash = { fg = palette.gray16 },
		RenderMarkdownH1Bg = { bg = groups.h1, blend = 20 },
		RenderMarkdownH2Bg = { bg = groups.h2, blend = 20 },
		RenderMarkdownH3Bg = { bg = groups.h3, blend = 20 },
		RenderMarkdownH4Bg = { bg = groups.h4, blend = 20 },
		RenderMarkdownH5Bg = { bg = groups.h5, blend = 20 },
		RenderMarkdownH6Bg = { bg = groups.h6, blend = 20 },
		RenderMarkdownQuote = { fg = palette.gray44 },
		RenderMarkdownTableFill = { link = "Conceal" },
		RenderMarkdownTableHead = { fg = palette.gray44 },
		RenderMarkdownTableRow = { fg = palette.gray44 },
		RenderMarkdownUnchecked = { fg = palette.gray44 },

		-- MagicDuck/grug-far.nvim
		GrugFarHelpHeader = { fg = palette.gray44 },
		GrugFarHelpHeaderKey = { fg = palette.gray52 },
		GrugFarHelpWinActionKey = { fg = palette.gray52 },
		GrugFarHelpWinActionPrefix = { fg = palette.gray68 },
		GrugFarHelpWinActionText = { fg = palette.gray44 },
		GrugFarHelpWinHeader = { link = "FloatTitle" },
		GrugFarInputLabel = { fg = palette.gray68 },
		GrugFarInputPlaceholder = { link = "Comment" },
		GrugFarResultsActionMessage = { fg = palette.gray68 },
		GrugFarResultsChangeIndicator = { fg = groups.git_change },
		GrugFarResultsHeader = { fg = palette.gray44 },
		GrugFarResultsLineNo = { fg = palette.gray60 },
		GrugFarResultsLineColumn = { link = "GrugFarResultsLineNo" },
		GrugFarResultsMatch = { link = "CurSearch" },
		GrugFarResultsPath = { fg = palette.gray68 },
		GrugFarResultsStats = { fg = palette.gray60 },

		-- yetone/avante.nvim
		AvanteTitle = { fg = palette.gray28, bg = palette.gray76 },
		AvanteReversedTitle = { fg = palette.gray76 },
		AvanteSubtitle = { fg = palette.gray20, bg = palette.gray68 },
		AvanteReversedSubtitle = { fg = palette.gray68 },
		AvanteThirdTitle = { fg = palette.gray20, bg = palette.gray60 },
		AvanteReversedThirdTitle = { fg = palette.gray60 },
		AvanteConflictCurrent = { fg = palette.black, bg = palette.orange },
		AvanteConflictIncoming = { fg = palette.black, bg = palette.green },
		AvanteConflictCurrentLabel = { fg = palette.gray12, bg = palette.orange, blend = 80 },
		AvanteConflictIncomingLabel = { fg = palette.gray12, bg = palette.green, blend = 80 },

		-- Saghen/blink.cmp
		BlinkCmpDoc = { fg = palette.gray84 },
		BlinkCmpDocBorder = { fg = palette.gray28 },
		BlinkCmpGhostText = { fg = palette.gray16 },

		BlinkCmpLabel = { fg = palette.gray16 },
		BlinkCmpLabelDeprecated = { fg = palette.gray16, strikethrough = true },
		BlinkCmpLabelMatch = { fg = palette.gray84, bold = styles.bold },

		BlinkCmpDefault = { fg = palette.gray20 },
		BlinkCmpKindText = { fg = palette.gray44 },
		BlinkCmpKindMethod = { fg = palette.gray68 },
		BlinkCmpKindFunction = { fg = palette.gray68 },
		BlinkCmpKindConstructor = { fg = palette.gray68 },
		BlinkCmpKindField = { fg = palette.gray44 },
		BlinkCmpKindVariable = { fg = palette.gray76 },
		BlinkCmpKindClass = { fg = palette.gray52 },
		BlinkCmpKindInterface = { fg = palette.gray52 },
		BlinkCmpKindModule = { fg = palette.gray68 },
		BlinkCmpKindProperty = { fg = palette.gray68 },
		BlinkCmpKindUnit = { fg = palette.gray44 },
		BlinkCmpKindValue = { fg = palette.gray36 },
		BlinkCmpKindKeyword = { fg = palette.gray60 },
		BlinkCmpKindSnippet = { fg = palette.gray76 },
		BlinkCmpKindColor = { fg = palette.gray36 },
		BlinkCmpKindFile = { fg = palette.gray68 },
		BlinkCmpKindReference = { fg = palette.gray36 },
		BlinkCmpKindFolder = { fg = palette.gray68 },
		BlinkCmpKindEnum = { fg = palette.gray68 },
		BlinkCmpKindEnumMember = { fg = palette.gray68 },
		BlinkCmpKindConstant = { fg = palette.gray52 },
		BlinkCmpKindStruct = { fg = palette.gray68 },
		BlinkCmpKindEvent = { fg = palette.gray68 },
		BlinkCmpKindOperator = { fg = palette.gray68 },
		BlinkCmpKindTypeParameter = { fg = palette.gray60 },
		BlinkCmpKindCodeium = { fg = palette.gray68 },
		BlinkCmpKindCopilot = { fg = palette.gray68 },
		BlinkCmpKindSupermaven = { fg = palette.gray68 },
		BlinkCmpKindTabNine = { fg = palette.gray68 },

		-- folke/snacks.nvim
		SnacksIndent = { fg = palette.gray24 },
		SnacksIndentChunk = { fg = palette.gray24 },
		SnacksIndentBlank = { fg = palette.gray24 },
		SnacksIndentScope = { fg = palette.gray68 },

		SnacksPickerMatch = { fg = palette.gray76, bold = styles.bold },

		-- justinmk/vim-sneak
		Sneak = { fg = palette.black, bg = palette.gray36 },
		SneakCurrent = { link = "StatusLineTerm" },
		SneakScope = { link = "IncSearch" },
	}

	local transparency_highlights = {
		DiagnosticVirtualTextError = { fg = groups.error },
		DiagnosticVirtualTextHint = { fg = groups.hint },
		DiagnosticVirtualTextInfo = { fg = groups.info },
		DiagnosticVirtualTextOk = { fg = groups.ok },
		DiagnosticVirtualTextWarn = { fg = groups.warn },

		FloatBorder = { fg = palette.gray16, bg = "NONE" },
		FloatTitle = { fg = palette.gray68, bg = "NONE", bold = styles.bold },
		Folded = { fg = palette.gray84, bg = "NONE" },
		NormalFloat = { bg = "NONE" },
		Normal = { fg = palette.gray76, bg = "NONE" },
		NormalNC = { fg = palette.gray84, bg = "NONE" },
		Pmenu = { fg = palette.gray44, bg = "NONE" },
		PmenuKind = { fg = palette.gray68, bg = "NONE" },
		SignColumn = { fg = palette.gray84, bg = "NONE" },
		StatusLine = { fg = palette.gray44, bg = "NONE" },
		StatusLineNC = { fg = palette.gray16, bg = "NONE" },
		TabLine = { bg = "NONE", fg = palette.gray44 },
		TabLineFill = { bg = "NONE" },
		TabLineSel = { fg = palette.gray84, bg = "NONE", bold = styles.bold },

		-- ["@markup.raw"] = { bg = "none" },
		["@markup.raw.markdown_inline"] = { fg = palette.gray52 },
		-- ["@markup.raw.block"] = { bg = "none" },

		TelescopeNormal = { fg = palette.gray44, bg = "NONE" },
		TelescopePromptNormal = { fg = palette.gray84, bg = "NONE" },
		TelescopeSelection = { fg = palette.gray84, bg = "NONE", bold = styles.bold },
		TelescopeSelectionCaret = { fg = palette.gray76 },

		TroubleNormal = { bg = "NONE" },

		WhichKeyFloat = { bg = "NONE" },
		WhichKeyNormal = { bg = "NONE" },

		IblIndent = { fg = palette.gray24, bg = "NONE" },
		IblScope = { fg = palette.gray68, bg = "NONE" },
		IblWhitespace = { fg = palette.gray24, bg = "NONE" },

		TreesitterContext = { bg = "NONE" },
		TreesitterContextLineNumber = { fg = palette.gray76, bg = "NONE" },

		MiniFilesTitleFocused = { fg = palette.gray76, bg = "NONE", bold = styles.bold },

		MiniPickPrompt = { bg = "NONE", bold = styles.bold },
		MiniPickBorderText = { bg = "NONE" },
	}

	for group, highlight in pairs(default_highlights) do
		highlights[group] = highlight
	end

	if styles.transparency then
		for group, highlight in pairs(transparency_highlights) do
			highlights[group] = highlight
		end
	end

	if config.options.highlight_groups ~= nil and next(config.options.highlight_groups) ~= nil then
		for group, highlight in pairs(config.options.highlight_groups) do
			local existing = highlights[group] or {}
			-- Traverse link due to
			-- "If link is used in combination with other attributes; only the link will take effect"
			-- see: https://neovim.io/doc/user/api.html#nvim_set_hl()
			while existing.link ~= nil do
				existing = highlights[existing.link] or {}
			end

			local parsed = vim.tbl_extend("force", {}, highlight)

			if highlight.fg ~= nil then
				parsed.fg = colors.parse_color(highlight.fg) or highlight.fg
			end
			if highlight.bg ~= nil then
				parsed.bg = colors.parse_color(highlight.bg) or highlight.bg
			end
			if highlight.sp ~= nil then
				parsed.sp = colors.parse_color(highlight.sp) or highlight.sp
			end

			if (highlight.inherit == nil or highlight.inherit) and existing ~= nil then
				parsed.inherit = nil
				highlights[group] = vim.tbl_extend("force", existing, parsed)
			else
				parsed.inherit = nil
				highlights[group] = parsed
			end
		end
	end

	for group, highlight in pairs(highlights) do
		if config.options.before_highlight ~= nil then
			config.options.before_highlight(group, highlight, palette)
		end

		if highlight.blend ~= nil and (highlight.blend >= 0 and highlight.blend <= 100) and highlight.bg ~= nil then
			highlight.bg = colors.blend(highlight.bg, highlight.blend_on or palette.black, highlight.blend / 100)
		end

		highlight.blend = nil
		highlight.blend_on = nil

		vim.api.nvim_set_hl(0, group, highlight)
	end

	--- Terminal
	if config.options.enable.terminal then
		vim.g.terminal_color_0 = palette.gray24 -- overlay
		vim.g.terminal_color_1 = palette.gray32 -- love
		vim.g.terminal_color_2 = palette.gray40 -- pine
		vim.g.terminal_color_3 = palette.gray48 -- gold
		vim.g.terminal_color_4 = palette.gray64 -- foam
		vim.g.terminal_color_5 = palette.gray56 -- iris
		vim.g.terminal_color_6 = palette.gray76 -- rose
		vim.g.terminal_color_7 = palette.gray84 -- text
		vim.g.terminal_color_8 = palette.gray28 -- subtle
		vim.g.terminal_color_9 = palette.gray36 -- love
		vim.g.terminal_color_10 = palette.gray44 -- pine
		vim.g.terminal_color_11 = palette.gray52 -- gold
		vim.g.terminal_color_12 = palette.gray68 -- foam
		vim.g.terminal_color_13 = palette.gray60 -- iris
		vim.g.terminal_color_14 = palette.gray80 -- rose
		vim.g.terminal_color_15 = palette.white -- text

		-- Support StatusLineTerm & StatusLineTermNC from vim
		vim.cmd([[
		augroup rose-pine
			autocmd!
			autocmd TermOpen * if &buftype=='terminal'
				\|setlocal winhighlight=StatusLine:StatusLineTerm,StatusLineNC:StatusLineTermNC
				\|else|setlocal winhighlight=|endif
			autocmd ColorSchemePre * autocmd! rose-pine
		augroup END
		]])
	end
end

---@param variant Variant | nil
function M.colorscheme(variant)
	config.extend_options({ variant = variant })

	vim.opt.termguicolors = true
	if vim.g.colors_name then
		vim.cmd("hi clear")
		vim.cmd("syntax reset")
	end
	vim.g.colors_name = "repl69"

	set_highlights()
end

---@param options Options
function M.setup(options)
	config.extend_options(options or {})
end

return M

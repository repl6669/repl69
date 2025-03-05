local options = require("repl69.config").options
local hsl = require("repl69.utils.hsl").hslToHex

---@type table<string, string>
local grayscale = {
	black = hsl(0, 0, 0),
	gray04 = hsl(0, 0, 4),
	gray08 = hsl(0, 0, 8),
	gray12 = hsl(0, 0, 12),
	gray16 = hsl(0, 0, 16),
	gray20 = hsl(0, 0, 20),
	gray24 = hsl(0, 0, 24),
	gray28 = hsl(0, 0, 28),
	gray32 = hsl(0, 0, 32),
	gray36 = hsl(0, 0, 36),
	gray40 = hsl(0, 0, 40),
	gray44 = hsl(0, 0, 44),
	gray48 = hsl(0, 0, 48),
	gray52 = hsl(0, 0, 52),
	gray56 = hsl(0, 0, 56),
	gray60 = hsl(0, 0, 60),
	gray64 = hsl(0, 0, 64),
	gray68 = hsl(0, 0, 68),
	gray72 = hsl(0, 0, 72),
	gray76 = hsl(0, 0, 76),
	gray80 = hsl(0, 0, 80),
	gray84 = hsl(0, 0, 84),
	white = hsl(0, 0, 88),
}

grayscale = vim.tbl_extend("keep", grayscale, {
	gray25 = grayscale.gray84, -- #d6d6d6
	gray50 = grayscale.gray80, -- #cccccc
	gray100 = grayscale.gray76, -- #c2c2c2
	gray150 = grayscale.gray72, -- #b8b8b8
	gray200 = grayscale.gray68, -- #adadad
	gray250 = grayscale.gray64, -- #a3a3a3
	gray300 = grayscale.gray60, -- #999999
	gray350 = grayscale.gray56, -- #8f8f8f
	gray400 = grayscale.gray52, -- #858585
	gray450 = grayscale.gray48, -- #7a7a7a
	gray500 = grayscale.gray44, -- #707070
	gray550 = grayscale.gray40, -- #666666
	gray600 = grayscale.gray36, -- #5c5c5c
	gray650 = grayscale.gray32, -- #525252
	gray700 = grayscale.gray28, -- #474747
	gray750 = grayscale.gray24, -- #3d3d3d
	gray800 = grayscale.gray20, -- #333333
	gray850 = grayscale.gray16, -- #292929
	gray900 = grayscale.gray12, -- #1f1f1f
	gray925 = grayscale.gray08, -- #141414
	gray950 = grayscale.gray04, -- #0a0a0a
})

---@type table<string, string>
local colors = {
	cyan = hsl(180, 90, 24), -- #067474
	cyan100 = hsl(180, 90, 70), -- #00fbf9
	cyan300 = hsl(180, 90, 50), -- #0df2f2
	cyan500 = hsl(180, 90, 35), -- #09aaaa
	cyan700 = hsl(180, 90, 20), -- #056161
	cyan900 = hsl(180, 90, 10), -- #033030

	green = hsl(158, 90, 42), -- #0bcb85
	green100 = hsl(158, 90, 70), -- #00fbc0
	green300 = hsl(158, 90, 50), -- #0df29e
	green500 = hsl(158, 90, 35), -- #09aa6f
	green700 = hsl(158, 90, 20), -- #00623c
	green900 = hsl(158, 90, 10), -- #033020

	blue = hsl(240, 90, 42), -- #0b0bcb
	blue100 = hsl(240, 90, 60), -- #3d3df5
	blue300 = hsl(240, 90, 50), -- #0d0df2
	blue500 = hsl(240, 90, 35), -- #0909aa
	blue700 = hsl(240, 90, 20), -- #050561
	blue900 = hsl(240, 90, 15), -- #040449

	purple = hsl(282, 90, 40), -- #8b0ac2
	purple100 = hsl(282, 90, 70), -- #dd66ff
	purple300 = hsl(282, 90, 50), -- #bd00fb
	purple500 = hsl(282, 90, 35), -- #8500b0
	purple700 = hsl(282, 90, 20), -- #4c0064
	purple900 = hsl(282, 90, 15), -- #3a004b

	orange = hsl(25, 100, 40), -- #dc4a00
	orange100 = hsl(25, 100, 70), -- #ffa056
	orange300 = hsl(25, 100, 50), -- #ff5c00
	orange500 = hsl(25, 100, 35), -- #c04100
	orange700 = hsl(25, 100, 20), -- #6f2500
	orange900 = hsl(25, 100, 15), -- #531b00

	red = hsl(0, 100, 60), -- #ff001e
	red100 = hsl(0, 100, 70), -- #ff565e
	red300 = hsl(0, 100, 50), -- ##f00000
	red500 = hsl(0, 100, 35), -- #c30000
	red700 = hsl(0, 100, 20), -- #700000
	red900 = hsl(0, 100, 15), -- #540000

	yellow = hsl(60, 100, 75), -- #feff67
	yellow100 = hsl(60, 100, 80), -- #feff89
	yellow300 = hsl(60, 100, 50), -- #feff00
	yellow500 = hsl(60, 100, 40), -- #cbcc00
	yellow700 = hsl(60, 100, 25), -- #7f7f00
	yellow900 = hsl(60, 100, 15), -- #4c4c00
}

local variants = {
	main = vim.tbl_extend("keep", grayscale, colors, {
		background = grayscale.black, -- #000000
		foreground = grayscale.white, -- #e0e0e0

		none = "NONE",
	}),
}

if options.palette ~= nil and next(options.palette) then
	-- handle variant specific overrides
	for variant_name, override_palette in pairs(options.palette) do
		if variants[variant_name] then
			variants[variant_name] = vim.tbl_extend("force", variants[variant_name], override_palette or {})
		end
	end
end

if variants[options.variant] ~= nil then
	return variants[options.variant]
end

return vim.o.background == "light" and variants.light or variants[options.dark_variant or "main"]

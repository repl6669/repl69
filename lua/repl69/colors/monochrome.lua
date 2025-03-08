local hsl = require("repl69.utils.hsl").hslToHex

---@type Palette
return {
  black = hsl(0, 0, 0), -- #000000
  gray25 = hsl(0, 0, 84), -- #d6d6d6
  gray50 = hsl(0, 0, 80), -- #cccccc
  gray100 = hsl(0, 0, 76), -- #c2c2c2
  gray150 = hsl(0, 0, 72), -- #b8b8b8
  gray200 = hsl(0, 0, 68), -- #adadad
  gray250 = hsl(0, 0, 64), -- #a3a3a3
  gray300 = hsl(0, 0, 60), -- #999999
  gray350 = hsl(0, 0, 56), -- #8f8f8f
  gray400 = hsl(0, 0, 52), -- #858585
  gray450 = hsl(0, 0, 48), -- #7a7a7a
  gray500 = hsl(0, 0, 44), -- #707070
  gray550 = hsl(0, 0, 40), -- #666666
  gray600 = hsl(0, 0, 36), -- #5c5c5c
  gray650 = hsl(0, 0, 32), -- #525252
  gray700 = hsl(0, 0, 28), -- #474747
  gray750 = hsl(0, 0, 24), -- #3d3d3d
  gray800 = hsl(0, 0, 20), -- #333333
  gray850 = hsl(0, 0, 16), -- #292929
  gray900 = hsl(0, 0, 12), -- #1f1f1f
  gray925 = hsl(0, 0, 8), -- #141414
  gray950 = hsl(0, 0, 4), -- #0a0a0a
  white = hsl(0, 0, 88), -- #e0e0e0

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

  pink = hsl(320, 80, 40), -- #C80084
  pink100 = hsl(320, 80, 70), -- #FF6CCA
  pink300 = hsl(320, 80, 55), -- #FD00AE
  pink500 = hsl(320, 80, 45), -- #E10095
  pink700 = hsl(320, 80, 35), -- #AF0074
  pink900 = hsl(320, 80, 25), -- #7D0052

  purple = hsl(265, 90, 40), -- #5F00C9
  purple100 = hsl(265, 90, 70), -- #B16AFF
  purple300 = hsl(265, 90, 55), -- #861AFD
  purple500 = hsl(265, 90, 45), -- #6B00E3
  purple700 = hsl(265, 90, 35), -- #5300B0
  purple900 = hsl(265, 90, 25), -- #3C017E

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

  -- bg = "#222436",
  -- bg_dark = "#1e2030",
  -- bg_dark1 = "#191B29",
  -- bg_highlight = "#2f334d",
  -- blue = "#82aaff",
  -- blue0 = "#3e68d7",
  -- blue1 = "#65bcff",
  -- blue2 = "#0db9d7",
  -- blue5 = "#89ddff",
  -- blue6 = "#b4f9f8",
  -- blue7 = "#394b70",
  -- comment = "#636da6",
  -- cyan = "#86e1fc",
  -- dark3 = "#545c7e",
  -- dark5 = "#737aa2",
  -- fg = "#c8d3f5",
  -- fg_dark = "#828bb8",
  -- fg_gutter = "#3b4261",
  -- green = "#c3e88d",
  -- green1 = "#4fd6be",
  -- green2 = "#41a6b5",
  -- magenta = "#c099ff",
  -- magenta2 = "#ff007c",
  -- orange = "#ff966c",
  -- purple = "#fca7ea",
  -- red = "#ff757f",
  -- red1 = "#c53b53",
  -- teal = "#4fd6be",
  -- terminal_black = "#444a73",
  -- yellow = "#ffc777",
  -- git = {
  --   add = "#b8db87",
  --   change = "#7ca1f2",
  --   delete = "#e26a75",
  -- },
}

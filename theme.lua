-- ~/.config/hypr/theme.lua
local colors = dofile(os.getenv("HOME") .. "/.config/hypr/colors.lua")
local c = colors.c

hl.config({
  general = {
    col = {
      active_border   = { colors = { c(colors.primary), c(colors.tertiary) }, angle = 45 },
      inactive_border = c(colors.outline_variant, "aa"),
    },
  },
})

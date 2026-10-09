hl.config({
    animations = {
        enabled = true,
    },
})

hl.curve("easeOutCubic", { type = "bezier", points = { { 0.33, 1 }, { 0.68, 1 } } })
hl.curve("easeOutQuad", { type = "bezier", points = { { 0.25, 0.46 }, { 0.45, 0.94 } } })

hl.animation({ leaf = "windows", enabled = true, speed = 3, bezier = "easeOutCubic", style = "slide" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 2, bezier = "easeOutQuad", style = "slide" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 2, bezier = "easeOutQuad", style = "slide" })
hl.animation({ leaf = "windowsMove", enabled = true, speed = 3, bezier = "easeOutCubic" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 3, bezier = "easeOutCubic", style = "slidevert" })
hl.animation({ leaf = "border", enabled = true, speed = 3, bezier = "easeOutCubic" })
hl.animation({ leaf = "layers", enabled = true, speed = 2, bezier = "easeOutQuad" })
hl.animation({ leaf = "fade", enabled = true, speed = 3, bezier = "easeOutQuad" })

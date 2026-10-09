-- Vertical swipes change numbered workspaces.
hl.gesture({ fingers = 3, direction = "vertical", action = "workspace" })

-- Horizontal swipes move focus through the scrolling layout's columns.
hl.gesture({
    fingers = 3,
    direction = "right",
    action = function()
        hl.dispatch(hl.dsp.layout("focus l"))
    end,
})
hl.gesture({
    fingers = 3,
    direction = "left",
    action = function()
        hl.dispatch(hl.dsp.layout("focus r"))
    end,
})

-- This file will not be overwritten across dots-hyprland updates.
-- Only custom binds that differ from the default.

local mainMod = "SUPER"

-- Apps
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("brave"))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd("vesktop"))
hl.bind(mainMod .. " + G", hl.dsp.exec_cmd("godot-mono"))
hl.bind(mainMod .. " + H", hl.dsp.exec_cmd("github-desktop"))
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd("kitty nvim"))
hl.bind(mainMod .. " + S", hl.dsp.exec_cmd("steam"))
hl.bind(mainMod .. " + U", hl.dsp.exec_cmd("blender"))

-- Window management

-- Force kill window
hl.bind(mainMod .. " + SHIFT + ALT + Q", hl.dsp.exec_cmd("hyprctl kill"))

-- Split ratio (default uses splitratio ±0.1; yours resized by 40px)
hl.bind(mainMod .. " + Semicolon",
    hl.dsp.window.resize({ x = -40, y = 0, relative = true }),
    { repeating = true })

hl.bind(mainMod .. " + Apostrophe",
    hl.dsp.window.resize({ x = 40, y = 0, relative = true }),
    { repeating = true })

-- Maximize (end-4 uses SUPER+D)
hl.bind(mainMod .. " + M",
    hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" }))

-- Scratchpad (CTRL+SUPER instead of SUPER)
hl.bind("CTRL + " .. mainMod .. " + S",
    hl.dsp.workspace.toggle_special("special"))

hl.bind(mainMod .. " + ALT + S",
    hl.dsp.window.move({ workspace = "special:special", follow = false }))

-- Relative workspace navigation
hl.bind("CTRL + " .. mainMod .. " + Up",
    hl.dsp.focus({ workspace = "r-5" }))
hl.bind("CTRL + " .. mainMod .. " + Down",
    hl.dsp.focus({ workspace = "r+5" }))

-- Custom workspace helper script
for i = 1, 10 do
    local code = ({10,11,12,13,14,15,16,17,18,19})[i]

    hl.bind(mainMod .. " + code:" .. code,
        hl.dsp.exec_cmd("$HOME/.config/hypr/hyprland/scripts/workspace_action.sh workspace " .. i))

    hl.bind(mainMod .. " + SHIFT + code:" .. code,
        hl.dsp.exec_cmd("$HOME/.config/hypr/hyprland/scripts/workspace_action.sh movetoworkspacesilent " .. i))
end

-- Screenshots
hl.bind(mainMod .. " + F10",
    hl.dsp.exec_cmd("hyprshot -m region -m active --clipboard-only"))
hl.bind(mainMod .. " + F11",
    hl.dsp.exec_cmd("hyprshot -m region"))

-- Zoom (uses Quickshell IPC instead of built-in Lua zoom)
hl.bind(mainMod .. " + Minus",
    hl.dsp.exec_cmd("qs -c $qsConfig ipc call zoom zoomOut"),
    { repeating = true })

hl.bind(mainMod .. " + Equal",
    hl.dsp.exec_cmd("qs -c $qsConfig ipc call zoom zoomIn"),
    { repeating = true })

-- Utility
hl.bind("CTRL + " .. mainMod .. " + Backslash",
    hl.dsp.window.resize({ x = 640, y = 480, "exact" }))
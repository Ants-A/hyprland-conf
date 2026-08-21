-- This file will not be overwritten across dots-hyprland updates.
-- The file name is for the sake of organization and does not matter
-- See the corresponding files in ~/.config/hypr/hyprland for examples
local mainMod = "SUPER"

-- Apps
hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd("~/.config/hypr/hyprland/scripts/launch_first_available.sh \"${TERMINAL}\" \"kitty -1\" \"foot\" \"alacritty\" \"wezterm\" \"konsole\" \"kgx\" \"uxterm\" \"xterm\""))
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd("~/.config/hypr/hyprland/scripts/launch_first_available.sh \"${TERMINAL}\" \"kitty -1\" \"foot\" \"alacritty\" \"wezterm\" \"konsole\" \"kgx\" \"uxterm\" \"xterm\""))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd("~/.config/hypr/hyprland/scripts/launch_first_available.sh \"dolphin\" \"nautilus\" \"nemo\" \"thunar\" \"${TERMINAL}\" \"kitty -1 fish -c yazi\""))
hl.bind(mainMod .. " + C", hl.dsp.exec_cmd("~/.config/hypr/hyprland/scripts/launch_first_available.sh \"code\" \"codium\" \"cursor\" \"zed\" \"zedit\" \"zeditor\" \"kate\" \"gnome-text-editor\" \"emacs\" \"command -v nvim && kitty -1 nvim\" \"command -v micro && kitty -1 micro\""))
hl.bind(mainMod .. " + X", hl.dsp.exec_cmd("~/.config/hypr/hyprland/scripts/launch_first_available.sh \"kate\" \"gnome-text-editor\" \"emacs\""))
hl.bind(mainMod .. " + I", hl.dsp.exec_cmd("XDG_CURRENT_DESKTOP=gnome ~/.config/hypr/hyprland/scripts/launch_first_available.sh \"qs -p ~/.config/quickshell/$qsConfig/settings.qml\" \"systemsettings\" \"gnome-control-center\" \"better-control\""))
hl.bind("CTRL + SHIFT + Escape", hl.dsp.exec_cmd("~/.config/hypr/hyprland/scripts/launch_first_available.sh \"gnome-system-monitor\" \"plasma-systemmonitor --page-name Processes\" \"command -v btop && kitty -1 fish -c btop\""))

-- Your launcher replacements
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("brave"))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd("vesktop"))
hl.bind(mainMod .. " + G", hl.dsp.exec_cmd("godot-mono"))
hl.bind(mainMod .. " + H", hl.dsp.exec_cmd("github-desktop"))
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd("kitty nvim"))
hl.bind(mainMod .. " + S", hl.dsp.exec_cmd("steam"))
hl.bind(mainMod .. " + U", hl.dsp.exec_cmd("blender"))

-- Window management
-- Focus
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))

hl.bind(mainMod .. " + BracketLeft", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + BracketRight", hl.dsp.focus({ direction = "right" }))

-- Move windows
hl.bind(mainMod .. " + SHIFT + left", hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + up", hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + down", hl.dsp.window.move({ direction = "down" }))

hl.bind("ALT + F4", hl.dsp.window.close())
hl.bind(mainMod .. " + ALT + Q", hl.dsp.exec_cmd("hyprctl kill"))

hl.bind(mainMod .. " + Semicolon", hl.dsp.window.resize({ x = -40, y = 0 }), { repeating = true })
hl.bind(mainMod .. " + Apostrophe", hl.dsp.window.resize({ x = 40, y = 0 }), { repeating = true })

hl.bind(mainMod .. " + ALT + Space", hl.dsp.window.float("toggle"))
hl.bind(mainMod .. " + M", hl.dsp.window.fullscreen(1))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen(0))
hl.bind(mainMod .. " + ALT + F", hl.dsp.window.fullscreen_state({ internal = 0, client = 3 }))
hl.bind(mainMod .. " + P", hl.dsp.window.pin())

-- Scratchpad
-- Toggle the default special workspace
hl.bind("CTRL + " .. mainMod .. " + S",
    hl.dsp.workspace.toggle_special(""))

-- Move the active window to the default special workspace
hl.bind(mainMod .. " + ALT + S",
    hl.dsp.window.move({ workspace = "special" }))

-- Relative workspace movement
hl.bind("CTRL + " .. mainMod .. " + Right", hl.dsp.focus({ workspace = "r+1" }))
hl.bind("CTRL + " .. mainMod .. " + Left", hl.dsp.focus({ workspace = "r-1" }))
hl.bind("CTRL + " .. mainMod .. " + ALT + Right", hl.dsp.focus({ workspace = "m+1" }))
hl.bind("CTRL + " .. mainMod .. " + ALT + Left", hl.dsp.focus({ workspace = "m-1" }))
hl.bind("CTRL + " .. mainMod .. " + Up", hl.dsp.focus({ workspace = "r-5" }))
hl.bind("CTRL + " .. mainMod .. " + Down", hl.dsp.focus({ workspace = "r+5" }))

-- Move windows between workspaces
hl.bind(mainMod .. " + SHIFT + mouse_down", hl.dsp.window.move({ workspace = "r-1" }))
hl.bind(mainMod .. " + SHIFT + mouse_up", hl.dsp.window.move({ workspace = "r+1" }))
hl.bind(mainMod .. " + ALT + mouse_down", hl.dsp.window.move({ workspace = "-1" }))
hl.bind(mainMod .. " + ALT + mouse_up", hl.dsp.window.move({ workspace = "+1" }))

-- Workspace numbers (preserved because you use the helper script)
for i = 1, 10 do
    local code = ({10,11,12,13,14,15,16,17,18,19})[i]
    hl.bind(mainMod .. " + code:" .. code,
        hl.dsp.exec_cmd("~/.config/hypr/hyprland/scripts/workspace_action.sh workspace " .. i))
    hl.bind(mainMod .. " + SHIFT + code:" .. code,
        hl.dsp.exec_cmd("~/.config/hypr/hyprland/scripts/workspace_action.sh movetoworkspacesilent " .. i))
end

-- Screenshot
hl.bind(mainMod .. " + F10", hl.dsp.exec_cmd("hyprshot -m region -m active --clipboard-only"))
hl.bind(mainMod .. " + F11", hl.dsp.exec_cmd("hyprshot -m region"))

-- Lock / suspend
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("loginctl lock-session"))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.exec_cmd("systemctl suspend || loginctl suspend"), { locked = true })

-- Zoom
hl.bind(mainMod .. " + Minus", hl.dsp.exec_cmd("qs -c $qsConfig ipc call zoom zoomOut"), { repeating = true })
hl.bind(mainMod .. " + Equal", hl.dsp.exec_cmd("qs -c $qsConfig ipc call zoom zoomIn"), { repeating = true })

-- Media
hl.bind(mainMod .. " + SHIFT + B", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
hl.bind(mainMod .. " + SHIFT + N", hl.dsp.exec_cmd("playerctl next || playerctl position `bc <<< \"100 * $(playerctl metadata mpris:length) / 1000000 / 100\"`"), { locked = true })
hl.bind(mainMod .. " + SHIFT + P", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })

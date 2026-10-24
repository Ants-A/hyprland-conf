local M = "SUPER"
local exec = hl.dsp.exec_cmd
local focus = hl.dsp.focus
local move = hl.dsp.window.move

local function bind(key, action)
    hl.bind(M .. " + " .. key, action)
end

bind("A", exec("vicinae toggle"))
bind("V", exec("vicinae vicinae://launch/clipboard/history"))
hl.bind("CTRL + SHIFT + Escape", exec("kitty -1 fish -c btop"))
bind("L", exec("qs ipc call lock lock"))
bind("Escape", exec("qs ipc call notifications toggle"))
bind("SHIFT + E", exec("hyprctl dispatch 'hl.dsp.exit()'"))
bind("Q", hl.dsp.window.close())
bind("F", hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" }))
bind("SHIFT + F", hl.dsp.window.fullscreen({ action = "toggle" }))
bind("M", hl.dsp.window.fullscreen({ action = "toggle" }))
bind("ALT + Space", hl.dsp.window.float({ action = "toggle" }))
bind("SHIFT + V", hl.dsp.window.float({ action = "toggle" }))
bind("Tab", hl.plugin.scrolloverview.overview("toggle"))
bind("SHIFT + F23", exec("qs ipc call notifications toggle"))
bind("mouse:272", hl.dsp.window.drag(), { mouse = true })
bind("mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.bind("switch:on:Lid Switch", hl.dsp.exec_cmd("qs ipc call lock lock"))

-- switch workspaces (up/down)
hl.bind("ALT + mouse_down", exec("~/.config/hypr/scripts/ws-scroll next"))
hl.bind("ALT + mouse_up",   exec("~/.config/hypr/scripts/ws-scroll prev"))
-- switch workspaces and move the window currently focused
hl.bind("SUPER + ALT + mouse_down", exec("~/.config/hypr/scripts/ws-scroll next move")) 
hl.bind("SUPER + ALT + mouse_up",   exec("~/.config/hypr/scripts/ws-scroll prev move"))

-- Shift + scroll: move left/right across columns (scrolling layout)
hl.bind("SHIFT + mouse_down", focus({ direction = "right" }))
hl.bind("SHIFT + mouse_up",   focus({ direction = "left" }))

for key, command in pairs({
    Return = "kitty",
    ["SHIFT + Return"] = "kitty --title fl_term",
    ["SHIFT + T"] = "kitty --title fl_term tmux new-session -A -s main",
    E = "nautilus",
    B = "brave --ozone-platform=wayland --force-device-scale-factor=1.5",
    D = "vesktop",
    G = "godot-mono",
    H = "github-desktop",
    S = "steam",
    U = "blender",
    T = "teams-for-linux",
    C = "code",
    ["SHIFT + W"] = "~/Desktop/launch-webapp https://web.whatsapp.com",
    ["SHIFT + C"] = "~/Desktop/launch-webapp https://www.chatgpt.com",
    ["SHIFT + Y"] = "~/Desktop/launch-webapp https://www.youtube.com",
}) do
    bind(key, exec(command))
end

for key, direction in pairs({ Left = "left", Right = "right", Up = "up", Down = "down" }) do
    bind(key, focus({ direction = direction }))
end

for key, direction in pairs({ Left = "l", Right = "r", Up = "u", Down = "d" }) do
    bind("SHIFT + " .. key, hl.dsp.layout("swapcol " .. direction))
end

for i = 1, 9 do
    bind(tostring(i), focus({ workspace = i }))
    bind("SHIFT + " .. i, move({ workspace = i }))
end

for key, command in pairs({
    ["XF86AudioRaiseVolume"] = "wpctl set-mute @DEFAULT_AUDIO_SINK@ 0; wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+",
    ["XF86AudioLowerVolume"] = "wpctl set-mute @DEFAULT_AUDIO_SINK@ 0; wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-",
    ["XF86AudioMute"] = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle",
    ["XF86AudioMicMute"] = "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle",
    ["XF86MonBrightnessUp"] = "brightnessctl --class=backlight set +10% && qs ipc call brightness trigger",
    ["XF86MonBrightnessDown"] = "brightnessctl --class=backlight set 10%- && qs ipc call brightness trigger",
    ["Print"] = "hyprshot -m region --freeze --clipboard-only",
}) do
    hl.bind(key, exec(command), { locked = true, repeating = true })
end

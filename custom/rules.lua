-- ######## Window rules ########

-- Disable blur
hl.window_rule({
    match = { class = ".*" },
    no_blur = true,
})

-- Common file dialogs
hl.window_rule({
    match = {
        title = "^(Open File|Select a File|Open Folder|Save As|Library|File Upload)(.*)$|^(.*)(wants to save|wants to open)$",
    },
    float = true,
    center = true,
})

hl.window_rule({
    match = { title = "^(Choose wallpaper)(.*)$" },
    float = true,
    center = true,
    size = { "(monitor_w*0.60)", "(monitor_h*0.65)" },
})

-- Utility windows
hl.window_rule({
    match = { class = "^(pavucontrol|org\\.pulseaudio\\.pavucontrol|nm-connection-editor|Zotero)$" },
    float = true,
    center = true,
    size = { "(monitor_w*0.45)", "(monitor_h*0.45)" },
})

hl.window_rule({
    match = { class = "^(blueberry\\.py|guifetch|kcm_.*)$|.*plasmawindowed.*|.*bluedevilwizard" },
    float = true,
})

hl.window_rule({
    match = { title = ".*Welcome|.*Shell conflicts.|^(illogical-impulse Settings)$" },
    float = true,
})

hl.window_rule({
    match = { class = "org.freedesktop.impl.portal.desktop.kde" },
    float = true,
    size = { "(monitor_w*0.60)", "(monitor_h*0.65)" },
})

-- Plasma icon changer
hl.window_rule({
    match = { class = "^(plasma-changeicons)$" },
    float = true,
    no_initial_focus = true,
    move = { 999999, 999999 },
})

-- Dolphin copy dialog
hl.window_rule({
    match = { title = "^(Copying — Dolphin)$" },
    move = { 40, 80 },
})

-- Warp
hl.window_rule({
    match = { class = "^dev\\.warp\\.Warp$" },
    tile = true,
})

-- Picture in Picture
hl.window_rule({
    match = { title = "^([Pp]icture[-\\s]?[Ii]n[-\\s]?[Pp]icture)(.*)$" },
    float = true,
    pin = true,
    keep_aspect_ratio = true,
    move = { "(monitor_w*0.73)", "(monitor_h*0.72)" },
    size = { "(monitor_w*0.25)", "(monitor_h*0.25)" },
})

-- JetBrains blank helper windows
hl.window_rule({
    match = {
        class = "^jetbrains-.*$",
        float = true,
        title = "^$|^\\s$|^win\\d+$",
    },
    no_initial_focus = true,
})

-- Remove shadows from tiled windows
hl.window_rule({
    match = { float = false },
    no_shadow = true,
})

-- ######## Workspace rules ########

hl.workspace_rule({
    workspace = "special:special",
    gaps_out = 30,
})

-- ######## Layer rules ########

for _, ns in ipairs({
    "walker",
    "selection",
    "overview",
    "anyrun",
    "indicator.*",
    "osk",
    "hyprpicker",
    "noanim",
    "quickshell:actionCenter",
    "quickshell:overview",
    "quickshell:overlay",
    "quickshell:polkit",
    "quickshell:regionSelector",
    "quickshell:screenshot",
    "quickshell:wNotificationCenter",
    "quickshell:wOnScreenDisplay",
    "quickshell:wStartMenu",
    "gtk4-layer-shell",
}) do
    hl.layer_rule({
        match = { namespace = ns },
        no_anim = true,
    })
end

hl.layer_rule({
    match = { namespace = "gtk-layer-shell" },
    blur = true,
    ignore_alpha = 0,
})

hl.layer_rule({
    match = { namespace = "launcher" },
    blur = true,
    ignore_alpha = 0.5,
})

hl.layer_rule({
    match = { namespace = "notifications" },
    blur = true,
    ignore_alpha = 0.69,
})

hl.layer_rule({
    match = { namespace = "logout_dialog" },
    blur = true,
})

hl.layer_rule({
    match = { namespace = "quickshell:session" },
    blur = true,
    no_anim = true,
    ignore_alpha = 0,
})

hl.layer_rule({
    match = { namespace = "quickshell:popup" },
    xray = false,
    ignore_alpha = 1,
})

hl.layer_rule({
    match = { namespace = "quickshell:mediaControls" },
    ignore_alpha = 1,
})

-- Custom Quickshell animations
hl.layer_rule({ match = { namespace = "quickshell:bar" }, animation = "slide" })
hl.layer_rule({ match = { namespace = "quickshell:cheatsheet" }, animation = "slide bottom" })
hl.layer_rule({ match = { namespace = "quickshell:dock" }, animation = "slide bottom" })
hl.layer_rule({ match = { namespace = "quickshell:screenCorners" }, animation = "popin 120%" })
hl.layer_rule({ match = { namespace = "quickshell:notificationPopup" }, animation = "fade" })
hl.layer_rule({ match = { namespace = "quickshell:osk" }, animation = "slide bottom", order = -1 })
hl.layer_rule({ match = { namespace = "quickshell:reloadPopup" }, animation = "slide" })
hl.layer_rule({ match = { namespace = "quickshell:sidebarRight" }, animation = "slide right" })
hl.layer_rule({ match = { namespace = "quickshell:sidebarLeft" }, animation = "slide left" })
hl.layer_rule({ match = { namespace = "quickshell:verticalBar" }, animation = "slide" })
hl.layer_rule({ match = { namespace = "quickshell:wallpaperSelector" }, animation = "slide top" })

hl.layer_rule({
    match = { namespace = "quickshell:wTaskView" },
    no_anim = true,
    ignore_alpha = 0,
})
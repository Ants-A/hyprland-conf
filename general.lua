for name, value in pairs({
    XDG_CURRENT_DESKTOP = "Hyprland",
    XDG_SESSION_TYPE = "wayland",
    XDG_SESSION_DESKTOP = "Hyprland",
    XDG_MENU_PREFIX = "plasma-",
    QT_QPA_PLATFORM = "wayland",
    ELECTRON_OZONE_PLATFORM_HINT = "auto",
    QT_QPA_PLATFORMTHEME = "kde",
    QT_STYLE_OVERRIDE = "kvantum",
    MOZ_ENABLE_WAYLAND = "1",
    SDL_VIDEODRIVER = "wayland",
}) do
    hl.env(name, value)
end

hl.monitor({ output = "eDP-1", mode = "2560x1600@165", position = "0x0", scale = 1 })

hl.config({
    general = {
        gaps_in = 10,
        gaps_out = 20,
        border_size = 2,
        layout = "scrolling",
        resize_on_border = true,
        allow_tearing = false,
        col = {
            active_border = "rgba(ffb691ff)",
            inactive_border = "rgba(808080ff)",
        },
    },
    decoration = {
        rounding = 12,
        shadow = {
            enabled = true,
            range = 30,
            render_power = 3,
            offset = "0 0",
            color = 0xcc000000,
        },
        blur = { enabled = true },
    },
    cursor = { no_hardware_cursors = false },
    misc = {
        disable_hyprland_logo = true,
        disable_splash_rendering = true,
        focus_on_activate = true,
    },
    scrolling = {
        fullscreen_on_one_column = true,
        column_width = 0.5,
        direction = "right",
        focus_fit_method = 1,
        follow_focus = true,
        wrap_focus = true,
        wrap_swapcol = true,
        explicit_column_widths = "0.33333, 0.5, 0.66667, 0.8, 1.0",
    },
})

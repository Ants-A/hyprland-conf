local commands = {
    "dbus-update-activation-environment --systemd --all",
    "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP XDG_SESSION_ID",
    "systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP",
    "vicinae server",
    "awww-daemon",
    "qs",
    "rclone mount GoogleDrive: ~/Documents/GoogleDrive/ --vfs-cache-mode full --daemon --allow-non-empty",
    "systemctl --user import-environment XDG_MENU_PREFIX && kbuildsycoca6",
    "wl-paste --type text --watch cliphist store",
    "wl-paste --type image --watch cliphist store",
}

hl.on("hyprland.start", function()
    for _, command in ipairs(commands) do
        hl.exec_cmd(command)
    end
end)

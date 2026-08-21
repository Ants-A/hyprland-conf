-- This file will not be overwritten across dots-hyprland updates.
-- The file name is for the sake of organization and does not matter
-- See the corresponding files in ~/.config/hypr/hyprland for examples
-- execs.lua

hl.on("hyprland.start", function()
    -- Java
    hl.exec_cmd("export _JAVA_AWT_WM_NONREPARENTING=1")

    -- Google Drive mount
    hl.exec_cmd("rclone mount gdrive: ~/Documents/GoogleDrive/ --vfs-cache-mode full --daemon --allow-non-empty")
end)
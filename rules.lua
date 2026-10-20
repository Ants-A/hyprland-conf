hl.window_rule({ name = "suppress-maximize", match = { class = ".*" }, suppress_event = "maximize" })
hl.window_rule({ name = "blueman-float", match = { class = "^(blueman-manager)$" }, float = true, center = true })
hl.window_rule({
    name = "maximize-code",
    match = { class = "^(code|code-oss|vscodium|codium|code-insiders|visual-studio-code|com.visualstudio.code|com.visualstudio.code-oss)$" },
    maximize = true,
})
hl.window_rule({
    name = "maximize-browsers",
    match = { class = "^(firefox|librewolf|waterfox|chrom(e|ium)|brave|edge|vivaldi|opera|epiphany|falkon|qutebrowser|torbrowser|zen|org.mozilla.firefox|com.google.Chrome|com.brave.Browser|org.chromium.Chromium)$" },
    maximize = true,
})
hl.window_rule({
    name = "floating-terminal",
    match = { title = "^(fl_term|System Info)$" },
    float = true,
    size = "50% 50%",
    center = true,
})
hl.window_rule({ name = "rounded-windows", match = { class = ".*" }, rounding = 12 })
hl.window_rule({ name = "stationary-wallpaper", match = { class = "^(awww-daemon)$" }, no_shadow = true })

hl.window_rule({
  name = "nmtui-float",
  match = { class = "^nmtui-float$" },
  float = true,
  size = { "monitor_w * 0.5", "monitor_h * 0.6" },
  center = true,
})
hl.workspace_rule({
  workspace = "special:nmtui",
  on_created_empty = "kitty --class nmtui-float -e nmtui",
})

hl.config({
  decoration = {
    blur = { enabled = true, size = 3, passes = 2 },
  },
})

hl.layer_rule({
  name = "qs-bar-blur",
  match = { namespace = "qs-bar" },
  blur = true,
  xray = false,
  ignore_alpha = 0.3,
})

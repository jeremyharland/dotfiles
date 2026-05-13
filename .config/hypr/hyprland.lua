-- Main Hyprland config
-- https://wiki.hypr.land/Configuring/Start/

local scrPath = os.getenv("HOME") .. "/.config/hypr/scripts"

-- MONITOR (fallback — specifics in monitors.lua)
hl.monitor({ output = "", mode = "preferred", position = "auto", scale = "auto" })

-- AUTOSTART
hl.on("hyprland.start", function()
    hl.exec_cmd(scrPath .. "/resetxdgportal.sh")
    hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
    hl.exec_cmd("dbus-update-activation-environment --systemd --all")
    hl.exec_cmd("systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
    hl.exec_cmd("/usr/lib/polkit-kde-authentication-agent-1")
    hl.exec_cmd("waybar")
    hl.exec_cmd("swww-daemon")
    hl.exec_cmd("blueman-applet")
    hl.exec_cmd("nm-applet --indicator")
    hl.exec_cmd("dunst")
    hl.exec_cmd("wl-paste --type text --watch cliphist store")
    hl.exec_cmd("wl-paste --type image --watch cliphist store")
    hl.exec_cmd("wl-clip-persist --clipboard primary")
    hl.exec_cmd(scrPath .. "/swwwallpaper.sh")
    hl.exec_cmd("1password --silent")
    -- hl.exec_cmd("mullvad-vpn")
end)

-- ENV
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")
hl.env("QT_QPA_PLATFORM", "wayland")
-- hl.env("QT_STYLE_OVERRIDE", "kvantum")
hl.env("QT_QPA_PLATFORMTHEME", "qt5ct")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")
hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1")
hl.env("MOZ_ENABLE_WAYLAND", "1")

-- INPUT
hl.config({
    input = {
        kb_layout      = "us",
        follow_mouse   = 1,
        force_no_accel = true,
        touchpad = {
            natural_scroll = false,
        },
    },
})

hl.device({
    name        = "epic-mouse-v1",
    sensitivity = -0.5,
})

hl.config({
    cursor = {
        no_hardware_cursors = true,
    },
})

-- LAYOUTS & MISC
hl.config({
    dwindle = {
        -- pseudotile removed in 0.55.0
        preserve_split = true,
    },
    master = {
        new_on_active = "after",
    },
    misc = {
        vrr                      = 0,
        disable_hyprland_logo    = true,
        disable_splash_rendering = true,
        force_default_wallpaper  = 0,
    },
})

-- SOURCE MODULES
require("animations")
require("keybindings")
require("windowrules")
require("themes.common")
require("themes.theme")   -- symlink to active theme
require("themes.colors")  -- wallbash color overrides
require("monitors")
require("userprefs")
require("nvidia")

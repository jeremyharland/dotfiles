hl.exec_cmd("gsettings set org.gnome.desktop.interface icon-theme 'Gruvbox-Plus-Dark'")
hl.exec_cmd("gsettings set org.gnome.desktop.interface gtk-theme 'Gruvbox-Retro'")
hl.exec_cmd("gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'")
hl.exec_cmd("gsettings set org.gnome.desktop.interface cursor-theme 'Gruvbox-Retro'")
hl.exec_cmd("gsettings set org.gnome.desktop.interface cursor-size 20")
hl.exec_cmd("hyprctl setcursor Gruvbox-Retro 20")

hl.config({
    general = {
        gaps_in          = 3,
        gaps_out         = 8,
        border_size      = 2,
        col = {
            active_border   = { colors = {"rgba(90ceaaff)", "rgba(ecd3a0ff)"}, angle = 45 },
            inactive_border = { colors = {"rgba(1e8b50d9)", "rgba(50b050d9)"}, angle = 45 },
        },
        layout           = "dwindle",
        resize_on_border = true,
    },
    group = {
        col = {
            border_active          = { colors = {"rgba(90ceaaff)", "rgba(ecd3a0ff)"}, angle = 45 },
            border_inactive        = { colors = {"rgba(1e8b50d9)", "rgba(50b050d9)"}, angle = 45 },
            border_locked_active   = { colors = {"rgba(90ceaaff)", "rgba(ecd3a0ff)"}, angle = 45 },
            border_locked_inactive = { colors = {"rgba(1e8b50d9)", "rgba(50b050d9)"}, angle = 45 },
        },
    },
    decoration = {
        rounding = 3,
        shadow = {
            enabled = false,
        },
        blur = {
            enabled          = true,
            size             = 4,
            passes           = 2,
            new_optimizations = true,
            ignore_opacity   = true,
            xray             = false,
        },
    },
})

hl.layer_rule({ match = { namespace = "waybar" }, blur = true })

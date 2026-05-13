hl.exec_cmd("gsettings set org.gnome.desktop.interface icon-theme 'Tela-circle-grey'")
hl.exec_cmd("gsettings set org.gnome.desktop.interface gtk-theme 'Catppuccin-Latte'")
hl.exec_cmd("gsettings set org.gnome.desktop.interface color-scheme 'prefer-light'")

hl.config({
    general = {
        gaps_in          = 3,
        gaps_out         = 8,
        border_size      = 2,
        col = {
            active_border   = { colors = {"rgba(dc8a78ff)", "rgba(8839efff)"}, angle = 45 },
            inactive_border = { colors = {"rgba(7287fdcc)", "rgba(179299cc)"}, angle = 45 },
        },
        layout           = "dwindle",
        resize_on_border = true,
    },
    group = {
        col = {
            border_active          = { colors = {"rgba(dc8a78ff)", "rgba(8839efff)"}, angle = 45 },
            border_inactive        = { colors = {"rgba(7287fdcc)", "rgba(179299cc)"}, angle = 45 },
            border_locked_active   = { colors = {"rgba(dc8a78ff)", "rgba(8839efff)"}, angle = 45 },
            border_locked_inactive = { colors = {"rgba(7287fdcc)", "rgba(179299cc)"}, angle = 45 },
        },
    },
    decoration = {
        rounding = 10,
        shadow = {
            enabled = false,
        },
        blur = {
            enabled          = true,
            size             = 6,
            passes           = 3,
            new_optimizations = true,
            ignore_opacity   = true,
            xray             = false,
        },
    },
})

hl.layer_rule({ match = { namespace = "waybar" }, blur = true })

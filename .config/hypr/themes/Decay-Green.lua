hl.exec_cmd("gsettings set org.gnome.desktop.interface icon-theme 'Tela-circle-green'")
hl.exec_cmd("gsettings set org.gnome.desktop.interface gtk-theme 'Decay-Green'")
hl.exec_cmd("gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'")

hl.config({
    general = {
        gaps_in          = 3,
        gaps_out         = 8,
        border_size      = 2,
        col = {
            active_border   = { colors = {"rgba(90ceaaff)", "rgba(ecd3a0ff)"}, angle = 45 },
            inactive_border = { colors = {"rgba(86aaeccc)", "rgba(93cee9cc)"}, angle = 45 },
        },
        layout           = "dwindle",
        resize_on_border = true,
    },
    group = {
        col = {
            border_active          = { colors = {"rgba(90ceaaff)", "rgba(ecd3a0ff)"}, angle = 45 },
            border_inactive        = { colors = {"rgba(86aaeccc)", "rgba(93cee9cc)"}, angle = 45 },
            border_locked_active   = { colors = {"rgba(90ceaaff)", "rgba(ecd3a0ff)"}, angle = 45 },
            border_locked_inactive = { colors = {"rgba(86aaeccc)", "rgba(93cee9cc)"}, angle = 45 },
        },
    },
    decoration = {
        rounding = 10,
        blur = {
            enabled          = true,
            size             = 5,
            passes           = 4,
            new_optimizations = true,
            ignore_opacity   = true,
            xray             = true,
        },
    },
})

hl.layer_rule({ match = { namespace = "waybar" }, no_anim = true })

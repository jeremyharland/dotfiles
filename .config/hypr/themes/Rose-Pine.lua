hl.exec_cmd("gsettings set org.gnome.desktop.interface icon-theme 'Tela-circle-pink'")
hl.exec_cmd("gsettings set org.gnome.desktop.interface gtk-theme 'Rose-Pine'")
hl.exec_cmd("gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'")

hl.config({
    general = {
        gaps_in          = 3,
        gaps_out         = 8,
        border_size      = 2,
        col = {
            active_border   = { colors = {"rgba(eb6f92ff)", "rgba(c4a7e7ff)"}, angle = 45 },
            inactive_border = { colors = {"rgba(31748fcc)", "rgba(9ccfd8cc)"}, angle = 45 },
        },
        layout           = "dwindle",
        resize_on_border = true,
    },
    group = {
        col = {
            border_active          = { colors = {"rgba(eb6f92ff)", "rgba(c4a7e7ff)"}, angle = 45 },
            border_inactive        = { colors = {"rgba(31748fcc)", "rgba(9ccfd8cc)"}, angle = 45 },
            border_locked_active   = { colors = {"rgba(eb6f92ff)", "rgba(c4a7e7ff)"}, angle = 45 },
            border_locked_inactive = { colors = {"rgba(31748fcc)", "rgba(9ccfd8cc)"}, angle = 45 },
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

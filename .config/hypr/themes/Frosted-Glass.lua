hl.exec_cmd("gsettings set org.gnome.desktop.interface icon-theme 'Tela-circle-blue'")
hl.exec_cmd("gsettings set org.gnome.desktop.interface gtk-theme 'Frosted-Glass'")
hl.exec_cmd("gsettings set org.gnome.desktop.interface color-scheme 'prefer-light'")

hl.config({
    general = {
        gaps_in          = 4,
        gaps_out         = 10,
        border_size      = 2,
        col = {
            active_border   = { colors = {"rgba(2770C0ff)", "rgba(1E4C84ff)"}, angle = 45 },
            inactive_border = { colors = {"rgba(A44185cc)", "rgba(012339cc)"}, angle = 45 },
        },
        layout           = "dwindle",
        resize_on_border = true,
    },
    group = {
        col = {
            border_active          = { colors = {"rgba(2770C0ff)", "rgba(1E4C84ff)"}, angle = 45 },
            border_inactive        = { colors = {"rgba(A44185cc)", "rgba(012339cc)"}, angle = 45 },
            border_locked_active   = { colors = {"rgba(2770C0ff)", "rgba(1E4C84ff)"}, angle = 45 },
            border_locked_inactive = { colors = {"rgba(A44185cc)", "rgba(012339cc)"}, angle = 45 },
        },
    },
    decoration = {
        rounding         = 13,
        active_opacity   = 0.75,
        inactive_opacity = 0.75,
        shadow = {
            enabled      = false,
            offset       = {0, 0},
            range        = 15,
            render_power = 1,
            color        = 0x80ffffff,
        },
        blur = {
            enabled          = true,
            size             = 4,
            passes           = 4,
            new_optimizations = true,
            ignore_opacity   = true,
            xray             = false,
        },
    },
})

hl.layer_rule({ match = { namespace = "waybar" }, blur = true })

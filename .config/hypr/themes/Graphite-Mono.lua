hl.exec_cmd("gsettings set org.gnome.desktop.interface icon-theme 'Tela-circle-grey'")
hl.exec_cmd("gsettings set org.gnome.desktop.interface gtk-theme 'Graphite-Mono'")
hl.exec_cmd("gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'")

hl.config({
    general = {
        gaps_in          = 8,
        gaps_out         = 14,
        border_size      = 3,
        col = {
            active_border   = { colors = {"rgba(d9d9d9ff)", "rgba(a6a6a6ff)"}, angle = 45 },
            inactive_border = { colors = {"rgba(404040cc)", "rgba(262626cc)"}, angle = 45 },
        },
        layout           = "dwindle",
        resize_on_border = true,
    },
    group = {
        col = {
            border_active          = { colors = {"rgba(d9d9d9ff)", "rgba(a6a6a6ff)"}, angle = 45 },
            border_inactive        = { colors = {"rgba(404040cc)", "rgba(262626cc)"}, angle = 45 },
            border_locked_active   = { colors = {"rgba(d9d9d9ff)", "rgba(a6a6a6ff)"}, angle = 45 },
            border_locked_inactive = { colors = {"rgba(404040cc)", "rgba(262626cc)"}, angle = 45 },
        },
    },
    decoration = {
        rounding = 0,
        shadow = {
            enabled      = true,
            offset       = {4, 4},
            range        = 0,
            render_power = 4,
            color        = 0xffFFFFFF,
        },
        blur = {
            enabled          = true,
            size             = 6,
            passes           = 3,
            new_optimizations = true,
            ignore_opacity   = true,
            xray             = true,
        },
    },
})

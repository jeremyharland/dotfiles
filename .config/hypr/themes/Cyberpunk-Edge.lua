hl.exec_cmd("gsettings set org.gnome.desktop.interface icon-theme 'Tela-circle-yellow'")
hl.exec_cmd("gsettings set org.gnome.desktop.interface gtk-theme 'Cyberpunk-Edge'")
hl.exec_cmd("gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'")

hl.config({
    general = {
        gaps_in          = 8,
        gaps_out         = 15,
        border_size      = 4,
        col = {
            active_border   = { colors = {"rgba(FADA16ff)", "rgba(4DBD4Fff)"}, angle = 45 },
            inactive_border = { colors = {"rgba(5032ACff)", "rgba(1F5322ff)"}, angle = 45 },
        },
        layout           = "dwindle",
        resize_on_border = true,
    },
    group = {
        col = {
            border_active          = { colors = {"rgba(FADA16ff)", "rgba(4DBD4Fff)"}, angle = 45 },
            border_inactive        = { colors = {"rgba(5032ACff)", "rgba(1F5322ff)"}, angle = 45 },
            border_locked_active   = { colors = {"rgba(FADA16ff)", "rgba(4DBD4Fff)"}, angle = 45 },
            border_locked_inactive = { colors = {"rgba(5032ACff)", "rgba(1F5322ff)"}, angle = 45 },
        },
    },
    decoration = {
        rounding = 0,
        shadow = {
            enabled      = true,
            offset       = {5, 5},
            range        = 0,
            render_power = 4,
            color        = 0xffFFA6C2,
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

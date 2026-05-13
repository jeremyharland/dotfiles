hl.exec_cmd("gsettings set org.gnome.desktop.interface icon-theme 'Tela-circle-black'")
hl.exec_cmd("gsettings set org.gnome.desktop.interface gtk-theme 'Material-Sakura'")
hl.exec_cmd("gsettings set org.gnome.desktop.interface color-scheme 'prefer-light'")

hl.config({
    general = {
        gaps_in          = 8,
        gaps_out         = 14,
        border_size      = 4,
        col = {
            active_border   = { colors = {"rgba(b4637aff)", "rgba(d7827eff)"}, angle = 45 },
            inactive_border = { colors = {"rgba(286983cc)", "rgba(56949fcc)"}, angle = 45 },
        },
        layout           = "dwindle",
        resize_on_border = true,
    },
    group = {
        col = {
            border_active          = { colors = {"rgba(b4637aff)", "rgba(d7827eff)"}, angle = 45 },
            border_inactive        = { colors = {"rgba(286983cc)", "rgba(56949fcc)"}, angle = 45 },
            border_locked_active   = { colors = {"rgba(b4637aff)", "rgba(d7827eff)"}, angle = 45 },
            border_locked_inactive = { colors = {"rgba(286983cc)", "rgba(56949fcc)"}, angle = 45 },
        },
    },
    decoration = {
        rounding = 12,
        shadow = {
            enabled      = true,
            offset       = {6, 6},
            range        = 3,
            render_power = 4,
            color        = 0xff26233a,
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

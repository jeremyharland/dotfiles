-- Monitor configuration
-- https://wiki.hypr.land/Configuring/Basics/Monitors/

hl.monitor({
    output    = "HDMI-A-2",
    mode      = "1920x1080@120",
    position  = "0x0",
    scale     = 1,
    bitdepth  = 10,
    transform = 1,
})

hl.monitor({
    output   = "DP-1",
    mode     = "2560x1440@165",
    position = "1080x0",
    scale    = 1,
    bitdepth = 10,
})
